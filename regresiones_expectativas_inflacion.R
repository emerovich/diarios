#install.packages("foreign")

library(dplyr)
library(readxl)
library(car)
library(stargazer)
library(foreign)
    ?read.dta

inflacion_argentina <- read_csv("E:/s/Inflacion_Argentina_1999_2019_BCRA.csv")
inflacion_argentina <- rbind(inflacion_argentina, c("30/09/2019", "5,9"))
inflacion_argentina$inflacion_mensual <- as.numeric(str_replace(inflacion_argentina$inflacion_mensual, ",", ".")
)
inflacion_argentina$mes <- as.Date(inflacion_argentina$mes, format="%d/%m/%Y")
inflacion_argentina$mes <- floor_date(as_date(inflacion_argentina$mes), unit = "month") #as.Date(inflacion_argentina$mes, format="%d/%m/%Y")



expectativas_inflacion <- read_excel("E:/s/EI (SERIE HISTORICA).xls") 
colnames(expectativas_inflacion) <- c("Fecha", "Mediana", "Media")

expectativas_inflacion

p5 <- ggplot(data = expectativas_inflacion, mapping = aes(Fecha, Media))+
  geom_line() +
  ggtitle("Expectativas de Inflación Anual en Argentina (2006-2019)")
p5

ggsave("grafico_expectativas_inflacion.png", p5)

inflacion_argentina_anual <- inflacion_argentina
inflacion_argentina_anual$inflacion_anual <- 0


for(i in 13:249){
  base <- 100
  for(j in 12:1){
    base <- base+base * as.numeric(inflacion_argentina_anual[(i-j),2])/100
  }
  inflacion_argentina_anual[i-1,3] <- (base-100)
}
inflacion_argentina_anual
#acoto la serie de expectativas porque tengo datos de la encuesta de expectativas para 
#marzo 2020 pero solo tengo scrapeado hasta agosto 2019

expectativas_inflacion <- expectativas_inflacion[1:158,]

###VOY A PLANTEAR UNA REGRESION CON  LAS EXPECTATIVAS COMO VARIABLE EXPLICADA
###Y LA INFLACION ANUAL DE LOS REZAGOS ANTERIORES Y EL INDICE DE ATENCION Y DE SENTIMIENTO


indice_atencion <- test_inflacion
sentimiento <- output

indice_atencion_un_rezago <- indice_atencion[91:nrow(indice_atencion),2]
indice_atencion_dos_rezagos <- indice_atencion[(90:(nrow(indice_atencion)-1)),2]
indice_atencion_tres_rezagos <- indice_atencion[(89:(nrow(indice_atencion)-2)),2]


#indice_atencion_un_rezago <- indice_atencion_un_rezago[-1]
#indice_atencion_dos_rezagos <- indice_atencion_dos_rezagos[-1]
#indice_atencion_tres_rezagos <- indice_atencion_tres_rezagos[-1]

sentimiento_un_rezago <- sentimiento[91:nrow(sentimiento),2]
sentimiento_dos_rezagos <- sentimiento[(90:(nrow(sentimiento)-1)),2]
sentimiento_tres_rezagos <- sentimiento[(89:(nrow(sentimiento)-2)),2]

sentimiento_un_rezago <- as.vector(unlist(sentimiento_un_rezago))
sentimiento_dos_rezagos <- as.vector(unlist(sentimiento_dos_rezagos))
sentimiento_tres_rezagos <- as.vector(unlist(sentimiento_tres_rezagos))

inflacion_un_rezago <- inflacion_argentina_anual[91:248, 3]
inflacion_dos_rezagos <- inflacion_argentina_anual[90:247, 3]
inflacion_tres_rezagos <- inflacion_argentina_anual[89:246, 3]


inflacion_un_rezago <- as.vector(unlist(inflacion_un_rezago))
inflacion_dos_rezagos <- as.vector(unlist(inflacion_dos_rezagos))
inflacion_tres_rezagos <- as.vector(unlist(inflacion_tres_rezagos))


#sentimiento_un_rezago <- sentimiento_un_rezago[1:(nrow(sentimiento_un_rezago)-1),]
#sentimiento_dos_rezagos <- sentimiento_dos_rezagos[1:(nrow(sentimiento_dos_rezagos)-1),]
#sentimiento_tres_rezagos <- sentimiento_tres_rezagos[1:(nrow(sentimiento_tres_rezagos)-1),]

modelo11 <- lm(unlist(expectativas_inflacion[,3]) ~ indice_atencion_un_rezago + indice_atencion_dos_rezagos +
   indice_atencion_tres_rezagos + sentimiento_un_rezago  + sentimiento_dos_rezagos + 
     sentimiento_tres_rezagos + inflacion_un_rezago + inflacion_dos_rezagos+
     inflacion_tres_rezagos)


summary(modelo11)

stargazer(modelo11, type="text", keep.stat = c("n","rsq", "adj.rsq", "f"), out = "tabla11.htm")



#Quiero modelar el sentimiento como una dummy

datos_modelo_12 <- data.frame(expectativas_inflacion[,3], indice_atencion_un_rezago,
                              indice_atencion_dos_rezagos, indice_atencion_tres_rezagos,
                              inflacion_un_rezago, inflacion_dos_rezagos, inflacion_tres_rezagos,
                              sentimiento_un_rezago, sentimiento_dos_rezagos, sentimiento_tres_rezagos)

for(i in 1:158){
  if(datos_modelo_12[i,8]>0){
    datos_modelo_12[i,8] <- 1
  }
  if(datos_modelo_12[i,8]<0){
    datos_modelo_12[i,8] <- 0
  }
  if(datos_modelo_12[i,9]>0){
    datos_modelo_12[i,9] <- 1
  }
  if(datos_modelo_12[i,9]<0){
    datos_modelo_12[i,9] <- 0
  }
  if(datos_modelo_12[i,10]>0){
    datos_modelo_12[i,10] <- 1
  }
  if(datos_modelo_12[i,10]<0){
    datos_modelo_12[i,10] <- 0
  }
}

datos_modelo_12$indice_atencion_un_rezago_positividad <- datos_modelo_12$indice_atencion_un_rezago*datos_modelo_12$sentimiento_un_rezago
datos_modelo_12$indice_atencion_un_rezago_negatividad <- datos_modelo_12$indice_atencion_un_rezago*(1-datos_modelo_12$sentimiento_un_rezago)

datos_modelo_12$indice_atencion_dos_rezagos_positividad <- datos_modelo_12$indice_atencion_dos_rezagos*(datos_modelo_12$sentimiento_dos_rezagos)
datos_modelo_12$indice_atencion_dos_rezagos_negatividad <- datos_modelo_12$indice_atencion_dos_rezagos*(1-datos_modelo_12$sentimiento_dos_rezagos)

datos_modelo_12$indice_atencion_tres_rezagos_positividad <- datos_modelo_12$indice_atencion_tres_rezagos*(datos_modelo_12$sentimiento_tres_rezagos)
datos_modelo_12$indice_atencion_tres_rezagos_negatividad <- datos_modelo_12$indice_atencion_tres_rezagos*(1-datos_modelo_12$sentimiento_tres_rezagos)

datos_modelo_12$inflacion_un_rezago_positividad <- datos_modelo_12$inflacion_un_rezago*datos_modelo_12$sentimiento_un_rezago
datos_modelo_12$inflacion_un_rezago_negatividad <- datos_modelo_12$inflacion_un_rezago*(1-datos_modelo_12$sentimiento_un_rezago)

datos_modelo_12$inflacion_dos_rezagos_positividad <- datos_modelo_12$inflacion_dos_rezagos*datos_modelo_12$sentimiento_dos_rezagos
datos_modelo_12$inflacion_dos_rezagos_negatividad <- datos_modelo_12$inflacion_dos_rezagos*(1-datos_modelo_12$sentimiento_dos_rezagos)

datos_modelo_12$inflacion_tres_rezagos_positividad <- datos_modelo_12$inflacion_tres_rezagos*datos_modelo_12$sentimiento_tres_rezagos
datos_modelo_12$inflacion_tres_rezagos_negatividad <- datos_modelo_12$inflacion_tres_rezagos*(1-datos_modelo_12$sentimiento_tres_rezagos)

modelo12 <- lm(Media ~ indice_atencion_un_rezago_positividad + indice_atencion_un_rezago_negatividad +indice_atencion_dos_rezagos_positividad+
                  indice_atencion_dos_rezagos_negatividad + indice_atencion_tres_rezagos_positividad + indice_atencion_tres_rezagos_negatividad+
                 inflacion_un_rezago_positividad + inflacion_un_rezago_negatividad + inflacion_dos_rezagos_positividad + 
                 inflacion_dos_rezagos_negatividad + inflacion_tres_rezagos_positividad + inflacion_tres_rezagos_negatividad, datos_modelo_12)

summary(modelo12)
