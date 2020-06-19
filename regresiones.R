#Tengo que haber corrido procesa_texto_clarin para correr este programa
#Las series son inflacion_argentina, test_inflacion y sentimiento

indice_atencion <- test_inflacion
sentimiento <- output

inflacion <- inflacion_argentina
inflacion$inflacion_mensual <- (inflacion$inflacion_mensual-mean(inflacion$inflacion_mensual))/sd(inflacion$inflacion_mensual)
inflacion <- inflacion[1:(nrow(inflacion)-1),] #esto lo hago porque para la inflacion del periodo t quiero tomar el indice de atencion del periodo t. Antes tenia un mes más para la inflacion

#Chequeo que las tres series tengan la misma extension
nrow(inflacion)
nrow(indice_atencion)
nrow(sentimiento)

#Genero las series correspondientes a los distintos rezagos
typeof(indice_atencion_un_rezago)
indice_atencion_un_rezago <- indice_atencion[3:nrow(indice_atencion),2]
indice_atencion_dos_rezagos <- indice_atencion[(2:(nrow(indice_atencion)-1)),2]
indice_atencion_tres_rezagos <- indice_atencion[(1:(nrow(indice_atencion)-2)),2]

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

modelo <- lm(inflacion_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
     inflacion_tres_rezagos + indice_atencion_un_rezago + indice_atencion_dos_rezagos + 
     indice_atencion_tres_rezagos + sentimiento_un_rezago + sentimiento_dos_rezagos + 
     sentimiento_tres_rezagos)

summary(modelo)

modelo2 <- lm(inflacion_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
               inflacion_tres_rezagos + indice_atencion_un_rezago + indice_atencion_dos_rezagos + 
               indice_atencion_tres_rezagos)

summary(modelo2)

modelo3 <- lm(inflacion_var_explicada ~ inflacion_un_rezago + inflacion_dos_rezagos +
                inflacion_tres_rezagos)

summary(modelo3)

