# Essay Grader Trainer
# 2014-7-5
# Dr. S. Keem

getEssayFromDB <-function() {
     library(RMySQL)
     essayDB = dbConnect(MySQL(), user='keem', password='Xzmxncb1', dbname='nlp',host='fc.keem.net')
     result = dbSendQuery(essayDB, "select * from essays")
     essays = fetch(result, n=-1)
}

getEssayFeatureFromDB <- function() {
     library(RMySQL)
     essayDB = dbConnect(MySQL(), user='keem', password='Xzmxncb1', dbname='nlp',host='fc.keem.net')
     result = dbSendQuery(essayDB, "select * from nlp1")
     essays = fetch(result, n=-1)
}

getEssayScoreFromDB <- function() {
     library(RMySQL)
     essayDB = dbConnect(MySQL(), user='keem', password='Xzmxncb1', dbname='nlp',host='fc.keem.net')
     result = dbSendQuery(essayDB, "select * from nlp3")
     essays = fetch(result, n=-1)
     
}