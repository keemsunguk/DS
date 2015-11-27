features<-getEssayFeatureFromDB()
scores<-getEssayScoreFromDB()
adf<-getPOSCounting(features)
fns<-merge(adf, scores, by="essayNo")
fns$rate = round(fns$rate*2)
#fns_sorted<-fns[order(fns$essayNo),]
fns_group<-split(fns, fns$type)
table(fns$type)
gre<-fns_group$GRE
gre$essayNo<-as.integer(gre$essayNo)
toefl<-fns_group$TOEFL
toefl_score_group<-table(toefl$score)
