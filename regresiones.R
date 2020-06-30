#Tengo que haber corrido procesa_texto_clarin para correr este programa
#Las series son inflacion_argentina, test_inflacion y sentimiento
getwd()


library(car)
library(stargazer)

typeof(indice_atencion)
typeof(test_glove_10)

indice_atencion <- test_inflacion
indice_atencion_glove_10 <- test_glove_10
indice_atencion_glove_50 <- test_glove_50
sentimiento <- output

inflacion <- inflacion_argentina
inflacion$inflacion_mensual <- (inflacion$inflacion_mensual-mean(inflacion$inflacion_mensual))/sd(inflacion$inflacion_mensual)
inflacion <- inflacion[1:(nrow(inflacion)-1),] #esto lo hago porque para la inflacion del periodo t quiero tomar el indice de atencion del periodo t. Antes tenia un mes más para la inflacion

#Chequeo que las tres series tengan la misma extension
nrow(inflacion)
nrow(indice_atencion)
nrow(sentimiento)

#Genero las series correspondientes a los distintos rezagos

indice_atencion_un_rezago <- indice_atencion[3:nrow(indice_atencion),2]
indice_atencion_dos_rezagos <- indice_atencion[(2:(nrow(indice_atencion)-1)),2]
indice_atencion_tres_rezagos <- indice_atencion[(1:(nrow(indice_atencion)-2)),2]
typeof(indice_atencion_un_rezago)

indice_atencion_un_rezago <- indice_atencion_un_rezago[-1]
indice_atencion_dos_rezagos <- indice_atencion_dos_rezagos[-1]
indice_atencion_tres_rezagos <- indice_atencion_tres_rezagos[-1]

sentimiento_un_rezago <- sentimiento[3:nrow(sentimiento),2]
sentimiento_dos_rezagos <- sentimiento[(2:(nrow(sentimiento)-1)),2]
sentimiento_tres_rezagos <- sentimiento[(1:(nrow(sentimiento)-2)),2]

sentimiento_un_rezago <- sentimiento_un_rezago[1:(nrow(sentimiento_un_rezago)-1),]
sentimiento_dos_rezagos <- sentimiento_dos_rezagos[1:(nrow(sentimiento_dos_rezagos)-1),]
sentimiento_tres_rezagos <- sentimiento_tres_rezagos[1:(nrow(sentimiento_tres_rezagos)-1),]

inflacion_un_rezago <- inflacion[3:(nrow(inflacion)-1),2]
inflacion_dos_rezagos <- inflacion[(2:(nrow(inflacion)-2)),2]
inflacion_tres_rezagos <- inflacion[(1:(nrow(inflacion)-3)),2]



inflacion_var_explicada <- inflacion[4:nrow(inflacion),2]
indice_atencion_var_explicada <- indice_atencion[4:nrow(indice_atencion),2]

#Chequeo que tenga el length adecuado
length(indice_atencion_un_rezago)
length(indice_atencion_dos_rezagos)
length(indice_atencion_tres_rezagos)

nrow(sentimiento_un_rezago)
nrow(sentimiento_dos_rezagos)
nrow(sentimiento_tres_rezagos)

nrow(inflacion_un_rezago)
nrow(inflacion_dos_rezagos)
nrow(inflacion_tres_rezagos)
nrow(inflacion_var_explicada)

#Convierto a vectores

sentimiento_un_rezago <- as.vector(unlist(sentimiento_un_rezago))
sentimiento_dos_rezagos <- as.vector(unlist(sentimiento_dos_rezagos))
sentimiento_tres_rezagos <- as.vector(unlist(sentimiento_tres_rezagos))

inflacion_var_explicada <- as.vector(unlist(inflacion_var_explicada))
inflacion_un_rezago <- as.vector(unlist(inflacion_un_rezago))
inflacion_dos_rezagos <- as.vector(unlist(inflacion_dos_rezagos))
inflacion_tres_rezagos <- as.vector(unlist(inflacion_tres_rezagos))


### MODELO CON INFLACION COMO VARIABLE EXPLICADA

modelo <- lm(inflacion_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
     inflacion_tres_rezagos + indice_atencion_un_rezago + indice_atencion_dos_rezagos + 
     indice_atencion_tres_rezagos + sentimiento_un_rezago + sentimiento_dos_rezagos + 
     sentimiento_tres_rezagos)

summary(modelo)

linearHypothesis(modelo, c("inflacion_un_rezago", "inflacion_dos_rezagos", "inflacion_tres_rezagos",
                           "indice_atencion_un_rezago", "indice_atencion_dos_rezagos", "indice_atencion_tres_rezagos",
                           "sentimiento_un_rezago", "sentimiento_dos_rezagos",
                           "sentimiento_tres_rezagos"))

modelo2 <- lm(inflacion_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
               inflacion_tres_rezagos + indice_atencion_un_rezago + indice_atencion_dos_rezagos + 
               indice_atencion_tres_rezagos)

summary(modelo2)

modelo3 <- lm(inflacion_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
                inflacion_tres_rezagos)

summary(modelo3)

stargazer(list(modelo, modelo2, modelo3), type="text", keep.stat = c("n","rsq", "adj.rsq", "f"), out = "tabla1.htm")

### MODELO CON INDICE DE ATENCION COMO VARIABLE EXPLICADA

indice_atencion_un_rezago <- indice_atencion[(3:(nrow(indice_atencion)-1)),2]
indice_atencion_dos_rezagos <- indice_atencion[(2:(nrow(indice_atencion)-2)),2]
indice_atencion_tres_rezagos <- indice_atencion[(1:(nrow(indice_atencion)-3)),2]

indice_atencion_un_rezago <- indice_atencion_un_rezago
indice_atencion_dos_rezagos <- indice_atencion_dos_rezagos
indice_atencion_tres_rezagos <- indice_atencion_tres_rezagos

modelo4 <- lm(indice_atencion_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
               inflacion_tres_rezagos + indice_atencion_un_rezago + indice_atencion_dos_rezagos + 
               indice_atencion_tres_rezagos + sentimiento_un_rezago + sentimiento_dos_rezagos + 
               sentimiento_tres_rezagos)

summary(modelo4)

modelo5 <- lm(indice_atencion_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
                inflacion_tres_rezagos + indice_atencion_un_rezago + indice_atencion_dos_rezagos + 
                indice_atencion_tres_rezagos)

modelo6 <- lm(indice_atencion_var_explicada ~ indice_atencion_un_rezago + indice_atencion_dos_rezagos + 
                indice_atencion_tres_rezagos)

stargazer(list(modelo4, modelo5, modelo6), type="text", keep.stat = c("n","rsq", "adj.rsq", "f"), out = "tabla2.htm")

###REpito las regresiones del modelo 1 con los indices de atencion hechos con glove 10

indice_atencion_glove_10_un_rezago <- indice_atencion_glove_10[3:nrow(indice_atencion_glove_10),2]
indice_atencion_glove_10_dos_rezagos <- indice_atencion_glove_10[(2:(nrow(indice_atencion_glove_10)-1)),2]
indice_atencion_glove_10_tres_rezagos <- indice_atencion_glove_10[(1:(nrow(indice_atencion_glove_10)-2)),2]

indice_atencion_glove_10_un_rezago <- indice_atencion_glove_10_un_rezago[-1]
indice_atencion_glove_10_dos_rezagos <- indice_atencion_glove_10_dos_rezagos[-1]
indice_atencion_glove_10_tres_rezagos <- indice_atencion_glove_10_tres_rezagos[-1]

indice_atencion_glove_10_un_rezago <- as.vector(unlist(indice_atencion_glove_10_un_rezago))
indice_atencion_glove_10_dos_rezagos <- as.vector(unlist(indice_atencion_glove_10_dos_rezagos))
indice_atencion_glove_10_tres_rezagos <- as.vector(unlist(indice_atencion_glove_10_tres_rezagos))

modelo7 <- lm(inflacion_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
               inflacion_tres_rezagos + indice_atencion_glove_10_un_rezago + indice_atencion_glove_10_dos_rezagos + 
               indice_atencion_glove_10_tres_rezagos + sentimiento_un_rezago + sentimiento_dos_rezagos + 
               sentimiento_tres_rezagos)

summary(modelo7)

###REpito las regresiones del modelo 1 con los indices de atencion hechos con glove 50

indice_atencion_glove_50_un_rezago <- indice_atencion_glove_50[3:nrow(indice_atencion_glove_50),2]
indice_atencion_glove_50_dos_rezagos <- indice_atencion_glove_50[(2:(nrow(indice_atencion_glove_50)-1)),2]
indice_atencion_glove_50_tres_rezagos <- indice_atencion_glove_50[(1:(nrow(indice_atencion_glove_50)-2)),2]

indice_atencion_glove_50_un_rezago <- indice_atencion_glove_50_un_rezago[-1]
indice_atencion_glove_50_dos_rezagos <- indice_atencion_glove_50_dos_rezagos[-1]
indice_atencion_glove_50_tres_rezagos <- indice_atencion_glove_50_tres_rezagos[-1]

indice_atencion_glove_50_un_rezago <- as.vector(unlist(indice_atencion_glove_50_un_rezago))
indice_atencion_glove_50_dos_rezagos <- as.vector(unlist(indice_atencion_glove_50_dos_rezagos))
indice_atencion_glove_50_tres_rezagos <- as.vector(unlist(indice_atencion_glove_50_tres_rezagos))

modelo8 <- lm(inflacion_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
                inflacion_tres_rezagos + indice_atencion_glove_50_un_rezago + indice_atencion_glove_50_dos_rezagos + 
                indice_atencion_glove_50_tres_rezagos + sentimiento_un_rezago + sentimiento_dos_rezagos + 
                sentimiento_tres_rezagos)

summary(modelo8)


stargazer(list(modelo7, modelo8), type="text", keep.stat = c("n","rsq", "adj.rsq", "f"), out = "tabla3.htm")


### Repito las regresiones del modelo 4 con glove 10

### MODELO CON INDICE DE ATENCION COMO VARIABLE EXPLICADA

indice_atencion_glove_10_var_explicada <- indice_atencion_glove_10[4:nrow(indice_atencion),2]

indice_atencion_glove_10_un_rezago <- indice_atencion_glove_10[(3:(nrow(indice_atencion_glove_10)-1)),2]
indice_atencion_glove_10_dos_rezagos <- indice_atencion_glove_10[(2:(nrow(indice_atencion_glove_10)-2)),2]
indice_atencion_glove_10_tres_rezagos <- indice_atencion_glove_10[(1:(nrow(indice_atencion_glove_10)-3)),2]

indice_atencion_glove_10_un_rezago <- as.vector(unlist(indice_atencion_glove_10_un_rezago))
indice_atencion_glove_10_dos_rezagos <- as.vector(unlist(indice_atencion_glove_10_dos_rezagos))
indice_atencion_glove_10_tres_rezagos <- as.vector(unlist(indice_atencion_glove_10_tres_rezagos))
indice_atencion_glove_10_var_explicada <- as.vector(unlist(indice_atencion_glove_10_var_explicada))

modelo9 <- lm(indice_atencion_glove_10_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
                inflacion_tres_rezagos + indice_atencion_glove_10_un_rezago + indice_atencion_glove_10_dos_rezagos + 
                indice_atencion_glove_10_tres_rezagos + sentimiento_un_rezago + sentimiento_dos_rezagos + 
                sentimiento_tres_rezagos)

summary(modelo9)


### Repito las regresiones del modelo 4 con glove 50

### MODELO CON INDICE DE ATENCION COMO VARIABLE EXPLICADA

indice_atencion_glove_50_var_explicada <- indice_atencion_glove_50[4:nrow(indice_atencion),2]

indice_atencion_glove_50_un_rezago <- indice_atencion_glove_50[(3:(nrow(indice_atencion_glove_50)-1)),2]
indice_atencion_glove_50_dos_rezagos <- indice_atencion_glove_50[(2:(nrow(indice_atencion_glove_50)-2)),2]
indice_atencion_glove_50_tres_rezagos <- indice_atencion_glove_50[(1:(nrow(indice_atencion_glove_50)-3)),2]

indice_atencion_glove_50_un_rezago <- as.vector(unlist(indice_atencion_glove_50_un_rezago))
indice_atencion_glove_50_dos_rezagos <- as.vector(unlist(indice_atencion_glove_50_dos_rezagos))
indice_atencion_glove_50_tres_rezagos <- as.vector(unlist(indice_atencion_glove_50_tres_rezagos))
indice_atencion_glove_50_var_explicada <- as.vector(unlist(indice_atencion_glove_50_var_explicada))

modelo10 <- lm(indice_atencion_glove_50_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
                inflacion_tres_rezagos + indice_atencion_glove_50_un_rezago + indice_atencion_glove_50_dos_rezagos + 
                indice_atencion_glove_50_tres_rezagos + sentimiento_un_rezago + sentimiento_dos_rezagos + 
                sentimiento_tres_rezagos)

summary(modelo10)

stargazer(list(modelo9, modelo10), type="text", keep.stat = c("n","rsq", "adj.rsq", "f"), out = "tabla4.htm")
