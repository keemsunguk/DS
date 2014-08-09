features<-getEssayFeatureFromDB()
scores<-getEssayScoreFromDB()
adf<-getPOSCounting(features)
fns<-merge(adf, scores, by="essayNo")
#fns_sorted<-fns[order(fns$essayNo),]
fns_group<-split(fns, fns$type)
table(fns$type)
gre<-fns_group$GRE
gre$essayNo<-as.integer(gre$essayNo)
