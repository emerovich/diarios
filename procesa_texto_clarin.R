#library(tidyverse)
library(tidytext)
library(dplyr)
library(tm)
library(ggplot2)
library(lubridate)
library(gridExtra)
library(stringr)
library(data.table)

memory.limit(size=10000)

#clarin <- backup

#tc <- read_csv("D:/Dropbox (MPD)/Eze Merovich/s/tipo_de_cambio.csv")
harvardiv_positividad <- read_csv("E:/s/harvardiv_positividad.csv")
harvardiv_negatividad <- read_csv("E:/s/harvardiv_negatividad.csv")

expectativas_inflacion <- openxlsx::read.xlsx("D:/Dropbox (MPD)/Eze Merovich/EI (SERIE HISTORICA).xls") #esto no funciona

#clarin_unicos <- clarin_unicos_filtered
backup <- clarin

clarin$year <- ""
clarin$month <- ""
clarin$date <- ""



clarin$Test <- str_length(clarin$Fecha)


clarin$date <- if_else(clarin$Test==43, str_sub(clarin$Fecha, 13, -22), 
                        if_else(clarin$Test==44, str_sub(clarin$Fecha, 13, -23), 
                                if_else(clarin$Test==29, str_sub(clarin$Fecha, 11, -10),
                                        if_else(clarin$Test==28, str_sub(clarin$Fecha, 11, -9),
                                                if_else(clarin$Test==22, str_sub(clarin$Fecha, 3, -11),
                                                        if_else(clarin$Test==24, str_sub(clarin$Fecha, 5, -11),
                                                                if_else(clarin$Test==23, str_sub(clarin$Fecha, 5, -10),
                                                                        if_else(clarin$Test==21, str_sub(clarin$Fecha, 3, -10),
                                                                                if_else(clarin$Test==25, str_sub(clarin$Fecha, 3, -10),
                                                                                        if_else(clarin$Test==32, str_sub(clarin$Fecha, 13, -10),
                                                                                                if_else(clarin$Test==31, str_sub(clarin$Fecha, 13, -10),"")))))))))))

#length(which(clarin[,10]==""))

clarin$date <-  as.Date(clarin$date, format="%d/%m/%Y")

unicos <- distinct(clarin, Link, .keep_all = TRUE)

#Por algun motivo hay algunos con Test=22 y 24 que les queda mal el date porque el subsetting que hago 
#con str_sub no se cumple bien para ellos. Eso hace que la columna date quede mal. Por suerte quedan mal 
#de una manera similar, aparaciendo como que el año tiene tres digitos. Corrijo esto ordenandolo por fecha
# y separo los anteriores a 1999 para corregirles la fecha y despues volver a unir el data set.

unicos_post_1999 <- unicos %>%
  filter(date >= "1999-01-01")

unicos_pre_1999 <- unicos %>%
  filter(date < "1999-01-01")

unicos_pre_1999$date <- if_else(unicos_pre_1999$Test==22, str_sub(unicos_pre_1999$Fecha, 4,-10),
                                if_else(unicos_pre_1999$Test==22,str_sub(unicos_pre_1999$Fecha, 6, -10),""))

unicos_pre_1999$date <-  as.Date(unicos_pre_1999$date, format="%d/%m/%Y")
unicos <- rbind(unicos_pre_1999, unicos_post_1999)

unicos <- dplyr::arrange(unicos, date)

unicos$month[month(unicos$date) == 1] <- "enero"
unicos$month[month(unicos$date) == 2] <- "febrero"
unicos$month[month(unicos$date) == 3] <- "marzo"
unicos$month[month(unicos$date) == 4] <- "abril"
unicos$month[month(unicos$date) == 5] <- "mayo"
unicos$month[month(unicos$date) == 6] <- "junio"
unicos$month[month(unicos$date) == 7] <- "julio"
unicos$month[month(unicos$date) == 8] <- "agosto"
unicos$month[month(unicos$date) == 9] <- "septiembre"
unicos$month[month(unicos$date) == 10] <- "octubre"
unicos$month[month(unicos$date) == 11] <- "noviembre"
unicos$month[month(unicos$date) == 12] <- "diciembre"

text_df <- unicos

text_df <- as_tibble(text_df)

articulos_por_mes <- text_df %>% group_by(month = floor_date(date,"month")) %>%   #reescribir esto con data.table
  summarize(count = n())

ggplot(data = articulos_por_mes, mapping = aes(month, count)) + geom_line()

#Obtengo los tokens a partir del texto en el Cuerpo de las noticias
tokens_text <- select(text_df, Cuerpo, date) %>%
  unnest_tokens(word, Cuerpo)

custom_stop_words <- bind_rows(stop_words,
                               data_frame(word = tm::stopwords("spanish"),
                                          lexicon = "custom"))

tokens_text <- tokens_text %>%  #fijarme si puedo hacer este join mas rapido con data.table
  anti_join(custom_stop_words)

tokens_text$month2 <- floor_date(as_date(tokens_text$date), unit = "month")


tokens_prueba <- setDT(tokens_text)

generate_data_table <- function(dataset){
  datos <- dataset[, .N , by = month2]
  datos <- datos[!is.na(datos$month2),] #Borro la ultima fila con na en la fecha
}

words_per_month_DT <- generate_data_table(tokens_prueba)

###  Esta funcion imputa datos faltantes en la serie que resulta de la query de una palabra
imputacion_datos_faltantantes <- function(datos, referencia){  #Le tengo que agregar una parte ad hoc para corregir el valor de principios de 2010
  datos_output <- left_join(referencia[,1], datos, by="month2")
  for(i in seq_along(datos_output$N)){
    if(i==1 && is.na(datos_output[1,2])){
      datos_output[1,2] <- 0
    }
    if(is.na(datos_output[i,2])){
      datos_output[i,2] <- datos_output[i-1,2]
    }
  }
  return(datos_output)
}

###  Esta funcion me devuelve una serie normalizada a partir de la palabra que quiera buscar

get_normalized_series <- function(palabra, dataset, referencia){
  output <- dataset[word == palabra , .N, by = month2]
  output <- output[!is.na(output$month2),]
  output <- imputacion_datos_faltantantes(output, referencia)
  output$cantidad_total_palabras <- referencia$N
  output$relative_frequency <- output$N/output$cantidad_total_palabras
  output$normalizado <-  (output$relative_frequency - mean(output$relative_frequency))/sd(output$relative_frequency)
  return(output[,c(1,5)])
}

###

test_inflacion <- get_normalized_series("inflación", tokens_prueba, words_per_month_DT)
ggplot(data = test_inflacion, mapping = aes(month2, normalizado)) + geom_line()

###########  Ahora viene la parte de analisis de sentmiento


test_inflacion_positividad_DT <- tokens_prueba[word %in% harvardiv_positividad$palabras , .N, by = month2]
test_inflacion_negatividad_DT <- tokens_prueba[word %in% harvardiv_negatividad$palabras , .N, by = month2]

sentimiento <- test_inflacion_positividad_DT
sentimiento$N <- test_inflacion_positividad_DT$N-test_inflacion_negatividad_DT$N
sentimiento <- sentimiento[!is.na(sentimiento$month2),]

output <- sentimiento
output$cantidad_total_palabras <- words_per_month_DT$N
output$relative_frequency <- output$N/output$cantidad_total_palabras
output$normalizado <-  (output$relative_frequency - mean(output$relative_frequency))/sd(output$relative_frequency)
output <- (output[,c(1,5)])

ggplot(data = output, mapping = aes(month2, normalizado)) + geom_line()
