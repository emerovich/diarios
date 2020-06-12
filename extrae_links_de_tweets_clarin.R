library(tidyverse)
library(stringr)

tweets <- read_csv("D:/Dropbox (MPD)/Eze Merovich/s/selenium/clarincom201504.csv")


links <- c()
for(i in 1:nrow(tweets)){
  palabras <- strsplit(as.character(tweets[i,2])," ")
  for(j in 1:length(unlist(palabras))){
    #print(unlist(palabras)[j])
    if(grepl("http", as.character(unlist(palabras)[j]), fixed = TRUE)){
      texto <- as.character(unlist(palabras)[j])
      texto <- gsub(".*:","",texto)
      texto <- paste0("http:",texto)
      #print(texto)
      if(grepl("clarin",texto,fixed = TRUE)){
        links <- c(links,texto)
      } else if(grepl("bit",texto,fixed = TRUE)){
        links <- c(links,texto)
      } else if(grepl("clar.in",texto,fixed = TRUE)){
        links <- c(links,texto)
      } else if(grepl("dlvr",texto,fixed = TRUE)){
        links <- c(links,texto)
      }
    }
    else{
       #print("moving on")
    }
  }
}

links <- as.data.frame(links)

links <- distinct(links)

setwd("D:/Dropbox (MPD)/Eze Merovich/s/abril_2015")

write_csv(links, "links_clarin_201504.csv")


