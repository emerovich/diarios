#install.packages("text2vec")
#PARA CORRER ESTE PROGRAMA HAY QUE HABER CORRIDO CARGA_ARCHIVOS_CLARIN
#CONVIENCE REALIZAR EL FILTRO DE LAS ULTIMAS LINEAS PORQUE SINO ES MUY PESADO


library(text2vec)
#setwd("D:/Dropbox (MPD)/Eze Merovich/s/clarin")
#input = read.csv("database_referencia.csv")
input <- clarin_unicos_filtered
input <- input %>%
  select(Cuerpo)

#setwd("D:/Dropbox (MPD)/Eze Merovich/s/lanacion")
#input2 = read.csv("database_referencia.csv")
#input2 <- input2[,6]t


#student.list <- c(as.character(input[,7]),as.character(input2[,6]))
#student.list <- as.factor(student.list)

#input <- student.list

input=tolower(input)

input=gsub("\br", "", input)	
input=gsub("[[:digit:]]", "", input)	
input=gsub("[[:punct:]]", "", input)
input=gsub("más", "", input)
input=gsub("había", "", input)
input=gsub("está", "", input)
input=gsub("también", "", input)
input=gsub("después", "", input)
input=gsub("año", "", input)
input=gsub("años", "", input)

tokens <- space_tokenizer(input)

tokens[1]

for(i in tokens[2]){
  print(i)
}


it = itoken(tokens, progressbar = FALSE)
vocab <- create_vocabulary(it,ngram=c(ngram_min=1L,ngram_max=1L),
                           stopwords=c("NA","	"," ","httpsearchproquestcomdocviewaccountid",
                                       "can"	,"could"	,"was"	,"were"	,"is"	,"are"	,"has"	
                                       ,"have"	,"been"	,"will"	,"without"	
                                       ,"the"	,"to","with"	,"a","on"	,"in","at"	,"an"	
                                       ,"between","of"	,"by"	,"since"	,"for"	
                                       ,"and","or","this","that","these","those",
                                       # Other common words:
                                       "said","its","it","million","as","from","new","inc","corp","mr",
                                       "be","us","but","year","he","about","co","which","more","company","his",
                                       "resumen","documento","de","texto","completo",
                                       "resumen","ninguno","comdocviewaccountid","resumen","httpsearchproqunitedstates",
                                       "comdocviewaccountid","a","ante","bajo","cabe","con","de","desde","durante","en","entre","hacia","hasta","mediante",
                                       "para","por","segun","sin","sobre","tras","versus","via","el","ellos","ella","ellas","la","las","lo","los","y","que",
                                       "no","si","una","un","se","del","unos","unas","aquel","aquella","aquellos","aquellas","como","más","mas","al","es",
                                       "su","sus","me","le","pero","fue","también","cuando","este","o","dos","porque","ya","todo","son","ser","hay","tiene",
                                       "donde","esta","ese","muy","todos","n","mi","era","dijo","vez","uno","hace","parte","eso","puede","esa","año","años",
                                       "nos","ahora","s","otro"))
vocab[1]

head(vocab, desc = TRUE)

sum(vocab$term_count)

vocab <- prune_vocabulary(vocab, term_count_min = 100L)
vocab
vectorizer <- vocab_vectorizer(vocab)
tcm <- create_tcm(it, vectorizer,skip_grams_window = 5L)

#glove_model = GloVe$new(word_vectors_size = 100,
#                        vocabulary = vocab, x_max = 100)

glove_model = GloVe$new(rank = 50, x_max = 100)

# fit model and get word vectors
word_vectors_main = glove_model$fit_transform(tcm, n_iter = 20)
word_vectors_context = glove_model$components
word_vectors = word_vectors_main + t(word_vectors_context)
 

wordint=word_vectors["inflación", ,drop = FALSE]
cos_sim = sim2(x = word_vectors, y = wordint, method = "cosine", norm = "l2")

infla_10 <- names(head(sort(cos_sim[,1], decreasing = TRUE), 10))
infla_50 <- names(head(sort(cos_sim[,1], decreasing = TRUE), 50))
infla_100 <- names(head(sort(cos_sim[,1], decreasing = TRUE), 100))

