#install.packages("tidyverse")
library(tidyverse)
#CLARIN
#E:

setwd("E:/s/clarin")
clarin_abril <- read_csv("database_referencia.csv", col_names = TRUE, locale = readr::locale(encoding = "latin1"))
clarin_abril <- clarin_abril[,c(2:7)]
clarin_abril$Categoria <- NA


setwd("E:/s/mayo")
clarin_mayo_0 <- read_csv("database_clarin_0.csv", col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_1 <- read_csv("database_clarin_1.csv", col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_2 <- read_csv("database_clarin_2.csv", col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_3 <- read_csv("database_clarin_3.csv", col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_4 <- read_csv("database_clarin_4.csv", col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_5 <- read_csv("database_clarin_5.csv", col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_6 <- read_csv("database_clarin_6.csv", col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_7 <- read_csv("database_clarin_7.csv", col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_8 <- read_csv("database_clarin_8.csv", col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_9 <- read_csv("database_clarin_9.csv", col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_mayo_2019 <- rbind(clarin_mayo_0,clarin_mayo_1,clarin_mayo_2,clarin_mayo_3,clarin_mayo_4,clarin_mayo_5,clarin_mayo_6,clarin_mayo_7,clarin_mayo_8,clarin_mayo_9)
clarin_mayo_2019 <- clarin_mayo_2019[,c(2:7)]
clarin_mayo_2019$Categoria <- NA


setwd("E:/s/junio")
clarin_junio_0 <- read_delim("database_clarin_0.csv", delim = ",",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_junio_1 <- read_delim("database_clarin_1.csv", delim = ",",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_junio_2 <- read_delim("database_clarin_2.csv", delim = ",",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_junio_3 <- read_delim("database_clarin_3.csv", delim = ",",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_junio_2019 <- rbind(clarin_junio_0,clarin_junio_1,clarin_junio_2,clarin_junio_3)
clarin_junio_2019 <- clarin_junio_2019[,c(2:7)]
clarin_junio_2019$Categoria <- NA


setwd("E:/s/agosto")
clarin_agosto_0 <- read_delim("database_clarin_0.csv", delim = ",",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_agosto_0$Categoria <- NA
clarin_agosto_2019_1 <- rbind(clarin_agosto_0,clarin_agosto_1,clarin_agosto_2)


setwd("E:/s/agosto_2")
clarin_agosto_2_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2_4 <- read_delim("database_clarin_4.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2_5 <- read_delim("database_clarin_5.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_agosto_2019_2 <- rbind(clarin_agosto_2_0,clarin_agosto_2_1,clarin_agosto_2_2,clarin_agosto_2_3,clarin_agosto_2_4,clarin_agosto_2_5)

clarin_agosto_2019 <- rbind(clarin_agosto_2019_1,clarin_agosto_2019_2)


setwd("E:/s/abril_2019")
clarin_abril_2019_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2019_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2019_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_abril_2019 <- rbind(clarin_abril_2019_0,clarin_abril_2019_1,clarin_abril_2019_2,clarin_abril)

setwd("E:/s/marzo_2019")
clarin_marzo_2019_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_marzo_2019_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_marzo_2019_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_marzo_2019_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_marzo_2019_4 <- read_delim("database_clarin_4.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_marzo_2019_5 <- read_delim("database_clarin_5.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_marzo_2019_6 <- read_delim("database_clarin_6.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_marzo_2019 <- rbind(clarin_marzo_2019_0,clarin_marzo_2019_1,clarin_marzo_2019_2,clarin_marzo_2019_3,clarin_marzo_2019_4,clarin_marzo_2019_5,clarin_marzo_2019_6)

setwd("E:/s/febrero_2019")
clarin_febrero_2019_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_febrero_2019_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_febrero_2019 <- rbind(clarin_febrero_2019_0,clarin_febrero_2019_1)

setwd("E:/s/enero_2019")
clarin_enero_2019_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_enero_2019_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_enero_2019 <- rbind(clarin_enero_2019_0,clarin_enero_2019_1)

setwd("E:/s/diciembre_2018")
clarin_diciembre_2018_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_diciembre_2018_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_diciembre_2018_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_diciembre_2018_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_diciembre_2018 <- rbind(clarin_diciembre_2018_0,clarin_diciembre_2018_1,clarin_diciembre_2018_2,clarin_diciembre_2018_3)


setwd("E:/s/noviembre_2018")
clarin_noviembre_2018_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_noviembre_2018_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_noviembre_2018 <- rbind(clarin_noviembre_2018_0,clarin_noviembre_2018_1)

setwd("E:/s/octubre_2018")
clarin_octubre_2018_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_octubre_2018_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_octubre_2018_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_octubre_2018 <- rbind(clarin_octubre_2018_0,clarin_octubre_2018_1,clarin_octubre_2018_2)

setwd("E:/s/septiembre_2018")
clarin_septiembre_2018_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_septiembre_2018_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_septiembre_2018_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_septiembre_2018_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_septiembre_2018_4 <- read_delim("database_clarin_4.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_septiembre_2018_5 <- read_delim("database_clarin_5.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_septiembre_2018 <- rbind(clarin_septiembre_2018_0,clarin_septiembre_2018_1,clarin_septiembre_2018_2,clarin_septiembre_2018_3,
                                clarin_septiembre_2018_3,clarin_septiembre_2018_4,clarin_septiembre_2018_5)

setwd("E:/s/agosto_2018")
clarin_agosto_2018_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2018_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2018_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2018_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2018_4 <- read_delim("database_clarin_4.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2018_5 <- read_delim("database_clarin_5.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2018_6 <- read_delim("database_clarin_6.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2018_7 <- read_delim("database_clarin_7.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_agosto_2018 <- rbind(clarin_agosto_2018_0,clarin_agosto_2018_1,clarin_agosto_2018_2,clarin_agosto_2018_3,clarin_agosto_2018_4,
                            clarin_agosto_2018_5,clarin_agosto_2018_6,clarin_agosto_2018_7)

setwd("E:/s/julio_2018")
clarin_julio_2018_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_julio_2018_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_julio_2018_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_julio_2018_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_julio_2018_4 <- read_delim("database_clarin_4.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_julio_2018 <- rbind(clarin_julio_2018_0,clarin_julio_2018_1,clarin_julio_2018_2,clarin_julio_2018_3,clarin_julio_2018_4)

setwd("E:/s/junio_2018")
clarin_junio_2018_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_junio_2018_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_junio_2018_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))


clarin_junio_2018 <- rbind(clarin_junio_2018_0,clarin_junio_2018_1)


setwd("E:/s/mayo_2018")
clarin_mayo_2018_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_2018_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_2018_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_2018_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_2018 <- rbind(clarin_mayo_2018_0,clarin_mayo_2018_1,clarin_mayo_2018_2,clarin_mayo_2018_3)

setwd("E:/s/abril_2018")
clarin_abril_2018_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2018_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2018 <- rbind(clarin_abril_2018_0,clarin_abril_2018_1)

setwd("E:/s/marzo_2018")
clarin_marzo_2018 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2018")
clarin_febrero_2018_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_febrero_2018_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_febrero_2018_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_febrero_2018_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_febrero_2018_4 <- read_delim("database_clarin_4.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_febrero_2018_5 <- read_delim("database_clarin_5.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_febrero_2018_6 <- read_delim("database_clarin_6.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_febrero_2018 <- rbind(clarin_febrero_2018_0,clarin_febrero_2018_1,clarin_febrero_2018_2,clarin_febrero_2018_3,clarin_febrero_2018_4,
                             clarin_febrero_2018_5,clarin_febrero_2018_6)

setwd("E:/s/enero_2018")
clarin_enero_2018_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_enero_2018_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_enero_2018 <- rbind(clarin_enero_2018_0,clarin_enero_2018_1)

#clarin <- rbind(clarin_abril,clarin_mayo, clarin_junio,clarin_agosto_2019_1, clarin_agosto_2019_2, clarin_abril_2019, clarin_marzo_2019)

setwd("E:/s/clarin_2017")
clarin_2017_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_4 <- read_delim("database_clarin_4.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_5 <- read_delim("database_clarin_5.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_6 <- read_delim("database_clarin_6.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_7 <- read_delim("database_clarin_7.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_8 <- read_delim("database_clarin_8.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_9 <- read_delim("database_clarin_9.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_10 <- read_delim("database_clarin_10.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_11 <- read_delim("database_clarin_11.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_12 <- read_delim("database_clarin_12.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_13 <- read_delim("database_clarin_13.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_14 <- read_delim("database_clarin_14.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_15 <- read_delim("database_clarin_15.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_16 <- read_delim("database_clarin_16.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_17 <- read_delim("database_clarin_17.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_18 <- read_delim("database_clarin_18.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_19 <- read_delim("database_clarin_19.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_20 <- read_delim("database_clarin_20.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_21 <- read_delim("database_clarin_21.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_22 <- read_delim("database_clarin_22.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_23 <- read_delim("database_clarin_23.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_24 <- read_delim("database_clarin_24.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_25 <- read_delim("database_clarin_25.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_26 <- read_delim("database_clarin_26.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_27 <- read_delim("database_clarin_27.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_28 <- read_delim("database_clarin_28.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_29 <- read_delim("database_clarin_29.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_30 <- read_delim("database_clarin_30.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_31 <- read_delim("database_clarin_31.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_32 <- read_delim("database_clarin_32.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_33 <- read_delim("database_clarin_33.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_34 <- read_delim("database_clarin_34.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_35 <- read_delim("database_clarin_35.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_36 <- read_delim("database_clarin_36.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_37 <- read_delim("database_clarin_37.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_38 <- read_delim("database_clarin_38.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_39 <- read_delim("database_clarin_39.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_40 <- read_delim("database_clarin_40.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_41 <- read_delim("database_clarin_41.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_42 <- read_delim("database_clarin_42.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_43 <- read_delim("database_clarin_43.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_44 <- read_delim("database_clarin_44.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_45 <- read_delim("database_clarin_45.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_46 <- read_delim("database_clarin_46.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_47 <- read_delim("database_clarin_47.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_48 <- read_delim("database_clarin_48.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_49 <- read_delim("database_clarin_49.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_50 <- read_delim("database_clarin_50.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_51 <- read_delim("database_clarin_51.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_52 <- read_delim("database_clarin_52.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_53 <- read_delim("database_clarin_53.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_54 <- read_delim("database_clarin_54.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_55 <- read_delim("database_clarin_55.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_56 <- read_delim("database_clarin_56.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_57 <- read_delim("database_clarin_57.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_58 <- read_delim("database_clarin_58.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_59 <- read_delim("database_clarin_59.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_60 <- read_delim("database_clarin_60.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_61 <- read_delim("database_clarin_61.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_62 <- read_delim("database_clarin_62.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_63 <- read_delim("database_clarin_63.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_64 <- read_delim("database_clarin_64.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_65 <- read_delim("database_clarin_65.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_66 <- read_delim("database_clarin_66.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_67 <- read_delim("database_clarin_67.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_68 <- read_delim("database_clarin_68.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_69 <- read_delim("database_clarin_69.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_70 <- read_delim("database_clarin_70.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_71 <- read_delim("database_clarin_71.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_72 <- read_delim("database_clarin_72.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_73 <- read_delim("database_clarin_73.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_74 <- read_delim("database_clarin_74.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_75 <- read_delim("database_clarin_75.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_76 <- read_delim("database_clarin_76.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_77 <- read_delim("database_clarin_77.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_78 <- read_delim("database_clarin_78.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_79 <- read_delim("database_clarin_79.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_80 <- read_delim("database_clarin_80.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_81 <- read_delim("database_clarin_81.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_82 <- read_delim("database_clarin_82.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_83 <- read_delim("database_clarin_83.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_84 <- read_delim("database_clarin_84.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_85 <- read_delim("database_clarin_85.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_86 <- read_delim("database_clarin_86.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_87 <- read_delim("database_clarin_87.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_88 <- read_delim("database_clarin_88.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_89 <- read_delim("database_clarin_89.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_90 <- read_delim("database_clarin_90.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_2017_91 <- read_delim("database_clarin_91.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2017 <- rbind(clarin_2017_0, clarin_2017_1, clarin_2017_2, clarin_2017_3, clarin_2017_4, clarin_2017_5, clarin_2017_6, clarin_2017_7,
                     clarin_2017_8,clarin_2017_9,clarin_2017_10,clarin_2017_11,clarin_2017_12,clarin_2017_13,clarin_2017_14,clarin_2017_15,
                     clarin_2017_16,clarin_2017_17, clarin_2017_18, clarin_2017_19, clarin_2017_20, clarin_2017_21, clarin_2017_22, clarin_2017_23,
                     clarin_2017_24,clarin_2017_25,clarin_2017_26,clarin_2017_27,clarin_2017_28,clarin_2017_29,clarin_2017_30,
                     clarin_2017_31,clarin_2017_32,clarin_2017_33,clarin_2017_34,clarin_2017_35,clarin_2017_36,clarin_2017_37,
                     clarin_2017_38,clarin_2017_39,clarin_2017_40,clarin_2017_41,clarin_2017_42,clarin_2017_43,clarin_2017_44,clarin_2017_45,
                     clarin_2017_46,clarin_2017_47,clarin_2017_48,clarin_2017_49,clarin_2017_50,clarin_2017_51,clarin_2017_52,clarin_2017_53,
                     clarin_2017_54,clarin_2017_55,clarin_2017_56,clarin_2017_57,clarin_2017_58,clarin_2017_59,clarin_2017_60,clarin_2017_61,clarin_2017_62,
                     clarin_2017_63,clarin_2017_64,clarin_2017_65,clarin_2017_66,clarin_2017_67,clarin_2017_68,clarin_2017_69,clarin_2017_70,clarin_2017_71,
                     clarin_2017_72,clarin_2017_73,clarin_2017_74,clarin_2017_75,clarin_2017_76,clarin_2017_77,clarin_2017_78,clarin_2017_79,
                     clarin_2017_80, clarin_2017_81, clarin_2017_82, clarin_2017_83, clarin_2017_84, clarin_2017_85, clarin_2017_86,
                     clarin_2017_87, clarin_2017_88, clarin_2017_89, clarin_2017_90, clarin_2017_91)

setwd("E:/s/diciembre_2016")
clarin_diciembre_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_diciembre_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_diciembre_2016_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_diciembre_2016_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_diciembre_2016 <- rbind(clarin_diciembre_2016_0,clarin_diciembre_2016_1,clarin_diciembre_2016_2,clarin_diciembre_2016_3)

setwd("E:/s/noviembre_2016")
clarin_noviembre_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_noviembre_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_noviembre_2016 <- rbind(clarin_noviembre_2016_0,clarin_noviembre_2016_1)

setwd("E:/s/octubre_2016")
clarin_octubre_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_octubre_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_octubre_2016 <- rbind(clarin_octubre_2016_0,clarin_octubre_2016_1)

setwd("E:/s/septiembre_2016")
clarin_septiembre_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_septiembre_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_septiembre_2016_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_septiembre_2016 <- rbind(clarin_septiembre_2016_0, clarin_septiembre_2016_1, clarin_septiembre_2016_2)

setwd("E:/s/agosto_2016")
clarin_agosto_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2016_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_agosto_2016 <- rbind(clarin_agosto_2016_0, clarin_agosto_2016_1, clarin_agosto_2016_2)

setwd("E:/s/julio_2016")
clarin_julio_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_julio_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_julio_2016_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_julio_2016 <- rbind(clarin_julio_2016_0, clarin_julio_2016_1, clarin_julio_2016_2)

setwd("E:/s/junio_2016")
clarin_junio_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_junio_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_junio_2016_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_junio_2016_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_junio_2016_4 <- read_delim("database_clarin_4.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_junio_2016_5 <- read_delim("database_clarin_5.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_junio_2016 <- rbind(clarin_junio_2016_0, clarin_junio_2016_1, clarin_junio_2016_2, clarin_junio_2016_3,clarin_junio_2016_4,clarin_junio_2016_5)


setwd("E:/s/mayo_2016")
clarin_mayo_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_2016_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_2016_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_mayo_2016 <- rbind(clarin_mayo_2016_0, clarin_mayo_2016_1, clarin_mayo_2016_2, clarin_mayo_2016_3)

setwd("E:/s/abril_2016")
clarin_abril_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2016_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2016_3 <- read_delim("database_clarin_3.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2016_4 <- read_delim("database_clarin_4.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))


clarin_abril_2016 <- rbind(clarin_abril_2016_0, clarin_abril_2016_1, clarin_abril_2016_2, clarin_abril_2016_3, clarin_abril_2016_4)

setwd("E:/s/marzo_2016")
clarin_marzo_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_marzo_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_marzo_2016_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_marzo_2016 <- rbind(clarin_marzo_2016_0, clarin_marzo_2016_1, clarin_marzo_2016_2)

setwd("E:/s/febrero_2016")
clarin_febrero_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_febrero_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_febrero_2016 <- rbind(clarin_febrero_2016_0, clarin_febrero_2016_1)

setwd("E:/s/enero_2016")
clarin_enero_2016_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_enero_2016_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_enero_2016 <- rbind(clarin_enero_2016_0, clarin_enero_2016_1)

setwd("E:/s/diciembre_2015")
clarin_diciembre_2015 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2015")
clarin_noviembre_2015 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2015")
clarin_octubre_2015 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2015")
clarin_septiembre_2015_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_septiembre_2015_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_septiembre_2015 <- rbind(clarin_septiembre_2015_0, clarin_septiembre_2015_1)

setwd("E:/s/agosto_2015")
clarin_agosto_2015_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_agosto_2015_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_agosto_2015 <- rbind(clarin_agosto_2015_0, clarin_agosto_2015_1)

setwd("E:/s/julio_2015")
clarin_julio_2015_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_julio_2015_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_julio_2015 <- rbind(clarin_julio_2015_0, clarin_julio_2015_1)

setwd("E:/s/junio_2015")
clarin_junio_2015 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2015")
clarin_mayo_2015_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_2015_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_mayo_2015 <- rbind(clarin_mayo_2015_0, clarin_mayo_2015_1)

setwd("E:/s/abril_2015")
clarin_abril_2015_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2015_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2015_2 <- read_delim("database_clarin_2.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_abril_2015 <- rbind(clarin_abril_2015_0, clarin_abril_2015_1, clarin_abril_2015_2)

setwd("E:/s/marzo_2015")
clarin_marzo_2015_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2015")
clarin_febrero_2015_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2015")
clarin_enero_2015_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2015 <- rbind(clarin_diciembre_2015, clarin_noviembre_2015, clarin_octubre_2015, clarin_septiembre_2015,
                     clarin_agosto_2015, clarin_julio_2015, clarin_junio_2015, clarin_mayo_2015, clarin_abril_2015,
                     clarin_marzo_2015_0, clarin_febrero_2015_0, clarin_enero_2015_0)


setwd("E:/s/diciembre_2014")
clarin_diciembre_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2014")
clarin_noviembre_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2014")
clarin_octubre_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2014")
clarin_septiembre_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2014")
clarin_agosto_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2014")
clarin_julio_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2014")
clarin_junio_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2014")
clarin_mayo_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2014")
clarin_abril_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2014")
clarin_marzo_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2014")
clarin_febrero_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2014")
clarin_enero_2014 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/diciembre_2013")
clarin_diciembre_2013 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2013")
clarin_noviembre_2013 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2013")
clarin_octubre_2013_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_octubre_2013_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_octubre_2013 <- rbind(clarin_octubre_2013_0, clarin_octubre_2013_1)

setwd("E:/s/septiembre_2013")
clarin_septiembre_2013 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2013")
clarin_agosto_2013 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2013")
clarin_julio_2013 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2013")
clarin_junio_2013 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2013")
clarin_mayo_2013 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2013")
clarin_abril_2013 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2013")
clarin_marzo_2013 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2013")
clarin_febrero_2013 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2013")
clarin_enero_2013 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/diciembre_2012")
clarin_diciembre_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2012")
clarin_noviembre_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2012")
clarin_octubre_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2012")
clarin_septiembre_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2012")
clarin_agosto_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2012")
clarin_julio_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2012")
clarin_junio_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2012")
clarin_mayo_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2012")
clarin_abril_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2012")
clarin_marzo_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2012")
clarin_febrero_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2012")
clarin_enero_2012 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2012 <- rbind(clarin_diciembre_2012, clarin_noviembre_2012, clarin_octubre_2012, clarin_septiembre_2012,
                     clarin_agosto_2012, clarin_julio_2012, clarin_junio_2012, clarin_mayo_2012, clarin_abril_2012,
                     clarin_marzo_2012, clarin_febrero_2012, clarin_enero_2012)

### 2011

setwd("E:/s/diciembre_2011")
clarin_diciembre_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2011")
clarin_noviembre_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2011")
clarin_octubre_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2011")
clarin_septiembre_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2011")
clarin_agosto_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2011")
clarin_julio_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2011")
clarin_junio_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2011")
clarin_mayo_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2011")
clarin_abril_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2011")
clarin_marzo_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2011")
clarin_febrero_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2011")
clarin_enero_2011 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2011 <- rbind(clarin_diciembre_2011, clarin_noviembre_2011, clarin_octubre_2011, clarin_septiembre_2011,
                     clarin_agosto_2011, clarin_julio_2011, clarin_junio_2011, clarin_mayo_2011, clarin_abril_2011,
                     clarin_marzo_2011, clarin_febrero_2011, clarin_enero_2011)


###

### 2010

setwd("E:/s/diciembre_2010")
clarin_diciembre_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2010")
clarin_noviembre_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2010")
clarin_octubre_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2010")
clarin_septiembre_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2010")
clarin_agosto_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2010")
clarin_julio_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2010")
clarin_junio_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2010")
clarin_mayo_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2010")
clarin_abril_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2010")
clarin_marzo_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2010")
clarin_febrero_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2010")
clarin_enero_2010 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2010 <- rbind(clarin_diciembre_2010, clarin_noviembre_2010, clarin_octubre_2010, clarin_septiembre_2010,
                     clarin_agosto_2010, clarin_julio_2010, clarin_junio_2010, clarin_mayo_2010, clarin_abril_2010,
                     clarin_marzo_2010, clarin_febrero_2010, clarin_enero_2010)

### 2009

setwd("E:/s/diciembre_2009")
clarin_diciembre_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2009")
clarin_noviembre_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2009")
clarin_octubre_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2009")
clarin_septiembre_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2009")
clarin_agosto_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2009")
clarin_julio_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2009")
clarin_junio_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2009")
clarin_mayo_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2009")
clarin_abril_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2009")
clarin_marzo_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2009")
clarin_febrero_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2009")
clarin_enero_2009 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2009 <- rbind(clarin_diciembre_2009, clarin_noviembre_2009, clarin_octubre_2009, clarin_septiembre_2009,
                     clarin_agosto_2009, clarin_julio_2009, clarin_junio_2009, clarin_mayo_2009, clarin_abril_2009,
                     clarin_marzo_2009, clarin_febrero_2009, clarin_enero_2009)

### 2008

setwd("E:/s/diciembre_2008")
clarin_diciembre_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2008")
clarin_noviembre_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2008")
clarin_octubre_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2008")
clarin_septiembre_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2008")
clarin_agosto_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2008")
clarin_julio_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2008")
clarin_junio_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2008")
clarin_mayo_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2008")
clarin_abril_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2008")
clarin_marzo_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2008")
clarin_febrero_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2008")
clarin_enero_2008 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2008 <- rbind(clarin_diciembre_2008, clarin_noviembre_2008, clarin_octubre_2008, clarin_septiembre_2008,
                     clarin_agosto_2008, clarin_julio_2008, clarin_junio_2008, clarin_mayo_2008, clarin_abril_2008,
                     clarin_marzo_2008, clarin_febrero_2008, clarin_enero_2008)

### 2007

setwd("E:/s/diciembre_2007")
clarin_diciembre_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2007")
clarin_noviembre_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2007")
clarin_octubre_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2007")
clarin_septiembre_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2007")
clarin_agosto_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2007")
clarin_julio_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2007")
clarin_junio_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2007")
clarin_mayo_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2007")
clarin_abril_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2007")
clarin_marzo_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2007")
clarin_febrero_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2007")
clarin_enero_2007 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2007 <- rbind(clarin_diciembre_2007, clarin_noviembre_2007, clarin_octubre_2007, clarin_septiembre_2007,
                     clarin_agosto_2007, clarin_julio_2007, clarin_junio_2007, clarin_mayo_2007, clarin_abril_2007,
                     clarin_marzo_2007, clarin_febrero_2007, clarin_enero_2007)

### 2006

setwd("E:/s/diciembre_2006")
clarin_diciembre_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2006")
clarin_noviembre_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2006")
clarin_octubre_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2006")
clarin_septiembre_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2006")
clarin_agosto_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2006")
clarin_julio_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2006")
clarin_junio_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2006")
clarin_mayo_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2006")
clarin_abril_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2006")
clarin_marzo_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2006")
clarin_febrero_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2006")
clarin_enero_2006 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2006 <- rbind(clarin_diciembre_2006, clarin_noviembre_2006, clarin_octubre_2006, clarin_septiembre_2006,
                     clarin_agosto_2006, clarin_julio_2006, clarin_junio_2006, clarin_mayo_2006, clarin_abril_2006,
                     clarin_marzo_2006, clarin_febrero_2006, clarin_enero_2006)

### 2005

setwd("E:/s/diciembre_2005")
clarin_diciembre_2005 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2005")
clarin_noviembre_2005 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2005")
clarin_octubre_2005 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2005")
clarin_septiembre_2005 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2005")
clarin_agosto_2005 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2005")
clarin_julio_2005_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_julio_2005_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_julio_2005 <- rbind(clarin_julio_2005_0, clarin_julio_2005_1)

setwd("E:/s/junio_2005")
clarin_junio_2005 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2005")
clarin_mayo_2005 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2005")
clarin_abril_2005 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2005")
clarin_marzo_2005 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2005")
clarin_febrero_2005 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2005")
clarin_enero_2005 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2005 <- rbind(clarin_diciembre_2005, clarin_noviembre_2005, clarin_octubre_2005, clarin_septiembre_2005,
                     clarin_agosto_2005, clarin_julio_2005, clarin_junio_2005, clarin_mayo_2005, clarin_abril_2005,
                     clarin_marzo_2005, clarin_febrero_2005, clarin_enero_2005)

### 2004

setwd("E:/s/diciembre_2004")
clarin_diciembre_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2004")
clarin_noviembre_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2004")
clarin_octubre_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2004")
clarin_septiembre_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2004")
clarin_agosto_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2004")
clarin_julio_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2004")
clarin_junio_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2004")
clarin_mayo_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2004")
clarin_abril_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2004")
clarin_marzo_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2004")
clarin_febrero_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2004")
clarin_enero_2004 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2004 <- rbind(clarin_diciembre_2004, clarin_noviembre_2004, clarin_octubre_2004, clarin_septiembre_2004,
                     clarin_agosto_2004, clarin_julio_2004, clarin_junio_2004, clarin_mayo_2004, clarin_abril_2004,
                     clarin_marzo_2004, clarin_febrero_2004, clarin_enero_2004)

### 2003

setwd("E:/s/diciembre_2003")
clarin_diciembre_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2003")
clarin_noviembre_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2003")
clarin_octubre_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2003")
clarin_septiembre_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2003")
clarin_agosto_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2003")
clarin_julio_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2003")
clarin_junio_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2003")
clarin_mayo_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2003")
clarin_abril_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2003")
clarin_marzo_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2003")
clarin_febrero_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2003")
clarin_enero_2003 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2003 <- rbind(clarin_diciembre_2003, clarin_noviembre_2003, clarin_octubre_2003, clarin_septiembre_2003,
                     clarin_agosto_2003, clarin_julio_2003, clarin_junio_2003, clarin_mayo_2003, clarin_abril_2003,
                     clarin_marzo_2003, clarin_febrero_2003, clarin_enero_2003)


###

### 2002

setwd("E:/s/diciembre_2002")
clarin_diciembre_2002 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2002")
clarin_noviembre_2002 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2002")
clarin_octubre_2002_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_octubre_2002_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_octubre_2002 <- rbind(clarin_octubre_2002_0, clarin_octubre_2002_1)

setwd("E:/s/septiembre_2002")
clarin_septiembre_2002 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2002")
clarin_agosto_2002 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2002")
clarin_julio_2002 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2002")
clarin_junio_2002 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2002")
clarin_mayo_2002 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2002")
clarin_abril_2002 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2002")
clarin_marzo_2002 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2002")
clarin_febrero_2002 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2002")
clarin_enero_2002 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2002 <- rbind(clarin_diciembre_2002, clarin_noviembre_2002, clarin_octubre_2002, clarin_septiembre_2002,
                     clarin_agosto_2002, clarin_julio_2002, clarin_junio_2002, clarin_mayo_2002, clarin_abril_2002,
                     clarin_marzo_2002, clarin_febrero_2002, clarin_enero_2002)

### 2001

setwd("E:/s/diciembre_2001")
clarin_diciembre_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2001")
clarin_noviembre_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2001")
clarin_octubre_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2001")
clarin_septiembre_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2001")
clarin_agosto_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2001")
clarin_julio_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2001")
clarin_junio_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2001")
clarin_mayo_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2001")
clarin_abril_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_2001")
clarin_marzo_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2001")
clarin_febrero_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2001")
clarin_enero_2001 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2001 <- rbind(clarin_diciembre_2001, clarin_noviembre_2001, clarin_octubre_2001, clarin_septiembre_2001,
                     clarin_agosto_2001, clarin_julio_2001, clarin_junio_2001, clarin_mayo_2001, clarin_abril_2001,
                     clarin_marzo_2001, clarin_febrero_2001, clarin_enero_2001)


### 2000

setwd("E:/s/diciembre_2000")
clarin_diciembre_2000 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_2000")
clarin_noviembre_2000 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_2000")
clarin_octubre_2000 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_2000")
clarin_septiembre_2000 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_2000")
clarin_agosto_2000 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_2000")
clarin_julio_2000 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_2000")
clarin_junio_2000 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_2000")
clarin_mayo_2000 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_2000")
clarin_abril_2000_0 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2000_1 <- read_delim("database_clarin_1.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))
clarin_abril_2000 <- rbind(clarin_abril_2000_0, clarin_abril_2000_1)

setwd("E:/s/marzo_2000")
clarin_marzo_2000 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_2000")
clarin_febrero_2000 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_2000")
clarin_enero_2000 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_2000 <- rbind(clarin_diciembre_2000, clarin_noviembre_2000, clarin_octubre_2000, clarin_septiembre_2000,
                     clarin_agosto_2000, clarin_julio_2000, clarin_junio_2000, clarin_mayo_2000, clarin_abril_2000,
                     clarin_marzo_2000, clarin_febrero_2000, clarin_enero_2000)

####

### 1999

setwd("E:/s/diciembre_1999")
clarin_diciembre_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/noviembre_1999")
clarin_noviembre_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/octubre_1999")
clarin_octubre_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/septiembre_1999")
clarin_septiembre_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/agosto_1999")
clarin_agosto_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/julio_1999")
clarin_julio_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/junio_1999")
clarin_junio_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/mayo_1999")
clarin_mayo_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/abril_1999")
clarin_abril_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/marzo_1999")
clarin_marzo_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/febrero_1999")
clarin_febrero_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

setwd("E:/s/enero_1999")
clarin_enero_1999 <- read_delim("database_clarin_0.csv", delim = " ",col_names = TRUE, locale = readr::locale(encoding = "UTF-8"))

clarin_1999 <- rbind(clarin_diciembre_1999, clarin_noviembre_1999, clarin_octubre_1999, clarin_septiembre_1999,
                     clarin_agosto_1999, clarin_julio_1999, clarin_junio_1999, clarin_mayo_1999, clarin_abril_1999,
                     clarin_marzo_1999, clarin_febrero_1999, clarin_enero_1999)

####


clarin_2014 <- rbind(clarin_diciembre_2014, clarin_noviembre_2014, clarin_octubre_2014, clarin_septiembre_2014,
                     clarin_agosto_2014, clarin_julio_2014, clarin_junio_2014, clarin_mayo_2014, clarin_abril_2014,
                     clarin_marzo_2014, clarin_febrero_2014, clarin_enero_2014)

clarin_2013 <- rbind(clarin_diciembre_2013, clarin_noviembre_2013, clarin_octubre_2013, clarin_septiembre_2013,
                     clarin_agosto_2013, clarin_julio_2013, clarin_junio_2013, clarin_mayo_2013, clarin_abril_2013,
                     clarin_marzo_2013, clarin_febrero_2013, clarin_enero_2013)

clarin_2016 <- rbind(clarin_diciembre_2016,clarin_noviembre_2016,clarin_octubre_2016, clarin_septiembre_2016, clarin_agosto_2016,clarin_julio_2016,
                     clarin_junio_2016, clarin_mayo_2016, clarin_abril_2016, clarin_marzo_2016, clarin_febrero_2016, clarin_enero_2016)

clarin <- rbind(clarin_abril_2019, clarin_marzo_2019, clarin_febrero_2019,clarin_enero_2019,clarin_mayo_2019, clarin_junio_2019
                ,clarin_diciembre_2018,clarin_agosto_2019,clarin_noviembre_2018,clarin_octubre_2018,clarin_septiembre_2018,clarin_agosto_2018,
                clarin_julio_2018,clarin_junio_2018,clarin_mayo_2018,clarin_abril_2018, clarin_marzo_2018, clarin_febrero_2018,
                clarin_enero_2018, clarin_2017, clarin_2016, clarin_2015, clarin_2014, clarin_2013, clarin_2012, clarin_2011,
                clarin_2010, clarin_2009, clarin_2008, clarin_2007, clarin_2006, clarin_2005, clarin_2004, clarin_2003, clarin_2002, clarin_2001,
                clarin_2000, clarin_1999)

clarin_unicos <- distinct(clarin, Titulo, .keep_all = TRUE)

datos_finales <- clarin
datos_finales_unicos <- clarin_unicos

rm(list = ls()[grep("^clarin", ls())])

clarin <- datos_finales
clarin_unicos <- datos_finales_unicos

rm(datos_finales_unicos)
rm(datos_finales)

#clarin_unicos_filtered <- clarin_unicos %>%
#  filter(grepl("economia", Link) | grepl("politica",Link)| grepl("empresas y negocios",Link) | grepl("mercados y finanzas",Link) | grepl("Economía",Categoria) | grepl("Política",Categoria))

#clarin_backup <- clarin