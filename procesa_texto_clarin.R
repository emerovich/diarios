#install.packages("tidytext")
#install.packages("tm")
#install.packages("gridExtra")
#install.packages("mudata")
library(tidyverse)
library(tidytext)
library(dplyr)
library(tm)
library(ggplot2)
library(lubridate)
library(gridExtra)
library(stringr)
library(data.table)

#clarin <- backup

#tc <- read_csv("D:/Dropbox (MPD)/Eze Merovich/s/tipo_de_cambio.csv")
harvardiv_positividad <- read_csv("D:/Dropbox (MPD)/Eze Merovich/harvardiv_positividad.csv")
expectativas_inflacion <- openxlsx::read.xlsx("D:/Dropbox (MPD)/Eze Merovich/EI (SERIE HISTORICA).xls") #esto no funciona

#clarin_unicos <- clarin_unicos_filtered
backup <- clarin

clarin$year <- ""
clarin$month <- ""
clarin$date <- ""

clarin <- clarin %>% filter(!is.na(Fecha))

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

length(which(clarin[,10]==""))


#for(i in 1:nrow(clarin)){                              #TODO ESTE BLOQUE YA NO LO CORRO MAS PORQUE LO REEMPLAZE POR LOS IF_ELSE ANIDADOS QUE SON MUCHO MAS RAPIDOS
  #clarin[i,2] <- gsub("[\r\n]", "", clarin[i,2])
  #str_replace_all(clarin[i,2], "[\r\n]" , "")
#  if(str_length(clarin[i,2])==43){
#    clarin[i,10] <- str_sub(clarin[i,2],13,-22)
#  } else if(str_length(clarin[i,2])==44){
#    clarin[i,10] <- str_sub(clarin[i,2],13,-23)
#  } else if(str_length(clarin[i,2])==29){
#    clarin[i,10] <- str_sub(clarin[i,2],11,-10)
#  } else if(str_length(clarin[i,2])==28){
#    clarin[i,10] <- str_sub(clarin[i,2],11,-9)
#  } else if(str_length(clarin[i,2])==22){
#    clarin[i,10] <- str_sub(clarin[i,2],3,-11)
#  } else if(str_length(clarin[i,2])==24){
#    clarin[i,10] <- str_sub(clarin[i,2],5,-11)
#  } else if(str_length(clarin[i,2])==23){
#    clarin[i,10] <- str_sub(clarin[i,2],5,-10)
#  } else if(str_length(clarin[i,2])==21){
#    clarin[i,10] <- str_sub(clarin[i,2],3,-10)
#  } else if(str_length(clarin[i,2])==25){
#    clarin[i,10] <- str_sub(clarin[i,2],3,-10)
#  } else if(str_length(clarin[i,2])==32){
#    clarin[i,10] <- str_sub(clarin[i,2],13,-10)
#  } else if(str_length(clarin[i,2])==31){
#    clarin[i,10] <- str_sub(clarin[i,2],13,-10)
#  } else{
#    clarin[i,10] <- "NA"
#  }
#}

#length(which(clarin[,10]=="NA"))
#which(clarin[,10]=="NA")
#12750
#400
#220
#45



clarin$date <-  as.Date(clarin$date, format="%d/%m/%Y")

unicos <- distinct(clarin, Link, .keep_all = TRUE)

#unicos <- unicos[order(as.Date(unicos$date, format="%Y/%m/%d")),]

unicos <- dplyr::arrange(unicos, date)

unicos <- unicos %>%
  filter(date >= "2001-01-01")

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


#vector_articulos <- as.character(eleconomista[,7])
#text_df <- filter(lanacion, Categoria == '\n\r\n                    Economía\r\n                \n')
text_df <- unicos

text_df <- as_tibble(text_df)

articulos_por_mes <- text_df %>% group_by(month = floor_date(date,"month")) %>%   #reescribir esto con data.table
  summarize(count = n())

ggplot(data = articulos_por_mes, mapping = aes(month, count)) + geom_line()

colnames(text_df)

tokens_text <- select(text_df, Cuerpo, date) %>%
  unnest_tokens(word, Cuerpo)

custom_stop_words <- bind_rows(stop_words,
                               data_frame(word = tm::stopwords("spanish"),
                                          lexicon = "custom"))

tokens_text <- tokens_text %>%
  anti_join(custom_stop_words)

tokens_text$month2 <- as.Date(cut(tokens_text$date,
                                  breaks = "month"))


#text_df$date[1]
#grafico dolar

typeof(tokens_text)

test_inflacion <- tokens_text %>%
  filter(word %in% harvardiv_positividad$palabras) %>%
  group_by(month2) %>%
  summarise(word = n())

#frecuencia_de_palabras <- tokens_text %>% group_by(word) %>%
#  summarise(word_test = n())


#inicio1 <- Sys.time()
#test_inflacion <- tokens_text %>%
#  filter(word == "inflación") %>%
#  group_by(month2) %>%
#  summarise(word = n())
#final1 <- Sys.time()

tokens_prueba <- setDT(tokens_text)

#inicio2 <- Sys.time()
test_inflacion <- tokens_prueba[word %in% harvardiv_positividad$palabras , .N, by = month2]
test_inflacion <- tokens_prueba[word == "pobreza" , .N, by = month2]
#final2 <- Sys.time()

#print(final1-inicio1)
#print(final2-inicio2)


words_per_month <- tokens_text %>%
  group_by(month2) %>%
  summarise(word = n())

words_per_month <- words_per_month[words_per_month$month2 %in% test_inflacion$month2,]

#words_per_month <- words_per_month %>%
#  filter(month2 != "2014-07-01")



test_inflacion$cantidad_total_palabras <- words_per_month$word

test_inflacion$relative_frequency <- test_inflacion$N/test_inflacion$cantidad_total_palabras

test_inflacion$normalizado <- (test_inflacion$relative_frequency - mean(test_inflacion$relative_frequency))/sd(test_inflacion$relative_frequency)

#mean(dolar_normalizado)
#sd(dolar_normalizado)

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
