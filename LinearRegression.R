td<-read.csv("toefl_training.csv")
toefl.lm <- lm(rate~length+wcount+avgWordLength+noOfSentences+noOfLongWords+VBall+CCcount+CDcount+DTcount+EXcount+INcount+JJcount+MDcount+NNcount+NNPcount+PRPcount+RBcount+TOcount+VBcount+WDTcount+WPcount+WRBcount,data=td)
summary(toefl.lm)
gd<-read.csv("gre_data.csv")
pg<-predict(toefl.lm, newdata=gd)
pg_m<-matrix(pg)
intpg <- apply(pg_m,1 , round)
res<-data.frame(intpg, gd$rate)

