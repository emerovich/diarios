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
harvardiv_positividad <- read_csv("D:/Dropbox (MPD)/Eze Merovich/harvardiv_positividad.csv")
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

#test_inflacion <- tokens_text %>%
#  filter(word %in% harvardiv_positividad$palabras) %>%            #esto lo dejo comentado porque tengo que buscar el dataset harvardiv en el disco rigido externo
#  group_by(month2) %>%
#  summarise(word = n())

#test_inflacion <- tokens_prueba[word %in% harvardiv_positividad$palabras , .N, by = month2]

tokens_prueba <- setDT(tokens_text)

test_inflacion <- tokens_prueba[word == "dólar" , .N, by = month2]
test_inflacion <- test_inflacion[!is.na(test_inflacion$month2),] #Borro filas con na si las hay

words_per_month_DT <- tokens_prueba[, .N , by = month2]
words_per_month_DT <- words_per_month_DT[!is.na(words_per_month_DT$month2),] #Borro la ultima fila con na en la fecha

###  En este chunk voy a trabajar en el metodo de imputacion para valores faltantes
imputacion_datos_faltantantes <- function(datos){
  #voy a tomar la columna de fechas de words_per_month_DT y voy a hacer un join con el input de la funcion
  #despues voy a iterar por fila y donde falte un valor le voy a impuitar el valor del mes anterior
}

###

words_per_month_DT <- words_per_month_DT[words_per_month_DT$month2 %in% test_inflacion$month2,] #TENGO QUE DEFINIR UN METODO DE IMPUTACION PARA VALORES FALTANTES PARA LA SERIE TEST_INFLACION

test_inflacion$cantidad_total_palabras <- words_per_month_DT$N

test_inflacion$relative_frequency <- test_inflacion$N/test_inflacion$cantidad_total_palabras

test_inflacion$normalizado <- (test_inflacion$relative_frequency - mean(test_inflacion$relative_frequency))/sd(test_inflacion$relative_frequency)

ggplot(data = test_inflacion, mapping = aes(month2, normalizado)) + geom_line()

############################################33

test_dolar_10 <- tokens_text %>%
  filter(word %in% dolar_10) %>%
  group_by(month2) %>%
  summarise(word = n())

#test_grouped_by_month <- tokens_text %>%
#  filter(word == "dólar") %>%
#  group_by(month2) %>%
#  summarise(word = n())

words_per_month <- tokens_text %>%
  group_by(month2) %>%
  summarise(word = n())

words_per_month <- words_per_month[words_per_month$month2 %in% test_dolar_10$month2,]

#words_per_month <- words_per_month %>%
#  filter(month2 != "2014-07-01")



test_dolar_10$cantidad_total_palabras <- words_per_month$word

test_dolar_10$relative_frequency <- test_dolar_10$word/test_dolar_10$cantidad_total_palabras

test_dolar_10$normalizado <- (test_dolar_10$relative_frequency - mean(test_dolar_10$relative_frequency))/sd(test_dolar_10$relative_frequency)

#mean(dolar_normalizado)
#sd(dolar_normalizado)

ggplot() + 
  geom_line(data = test_inflacion, mapping = aes(month2, normalizado), color = "blue") + 
  geom_line(data = test_dolar_10, mapping = aes(month2, normalizado), color = "red")


#############################################33




test <- test[2:nrow(test),]

test  %>%
  ggplot(aes(x = date, y = word, group = 1)) +
  geom_line() +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %d %y") +
  ggtitle("Numero de occurencias de la palabra 'dólar' en el diario El Economista (01/01/2018 a 15/08/2019)") +
  labs (x="Fecha",y="ocurrencia de la palabra 'dólar'")


tc$fecha <-  as.Date(as.character(tc$fecha), format="%d/%m/%Y")

tc <- tc %>%
  filter(fecha %in% test$date)

p1 <- tc %>%
  ggplot(aes(x = fecha, y = tc, group = 1)) +
  geom_line() +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b %d %y") +
  ggtitle("Tipo de cambio USD-ARS (01/01/2018 a 15/08/2019)") +
  labs (x="Fecha",y="Tipo de cambio")

 
p2 <- test  %>%
  ggplot(aes(x = date, y = word, group = 1)) +
  geom_line() +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b %d %y") +
  ggtitle("Numero de occurencias de la palabra 'dólar' en el diario El Economista (01/01/2018 a 15/08/2019)") +
  labs (x="Fecha",y="ocurrencia de la palabra 'dólar'")

grid.arrange(p1, p2, nrow = 2)
  
tokens_text %>%
  filter(word == "dólar") %>%
  group_by(date) %>%
  summarise(word = n()) %>%
  ggplot(aes(x = date, y = word, group = 1)) +
  geom_line() +
  theme(axis.text.x = element_text(angle = 90)) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b %d %y")

#grafico inflacion


inflacion_por_mes <- tokens_text %>%
  filter(word == "inflación") %>%
  #filter(year == 2019) %>%
  group_by(month2) %>%
  summarise(word = n()) 

inflacion_por_mes %>%
  #rename("month"="as.factor(month)") %>%
  ggplot(aes(x = month2, y = word, group=1)) +
  geom_line() +
  geom_point()


inflacion_por_mes[,3] <- inflacion_por_mes[,2]/articulos_por_mes[1:(nrow(articulos_por_mes)),2]

inflacion_por_mes <- inflacion_por_mes %>%
  rename(infla_ajustada = word.1)

inflacion_por_mes %>%  #
  #rename("month"="as.factor(month)") %>%
  ggplot(aes(x = month2, y = word, group=1)) +
  geom_line() +
  geom_point()


inflacion_por_mes %>%  #ACA ESTOY GRAFICANDO LA INFLACION PONDERADA POR EL NUMERO DE ARTICULOS POR MES. EL PROBLEMA ES QUE EL NUMERO DE ARTICULOS CRECE MUCHO EN LOS ULTIMOS TRES AÑOS
  #rename("month"="as.factor(month)") %>%
  ggplot(aes(x = month2, y = infla_ajustada, group=1)) +
  geom_line() +
  geom_point()

articulos_por_mes %>%
  #rename("month"="as.factor(month)") %>%
  ggplot(aes(x = month, y = count, group=1)) +
  geom_line() +
  geom_point()
