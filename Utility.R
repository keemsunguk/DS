getPOSCounting<-function(features, eid="all") {
     POSCategory<-unique(features$POS)
     essayNo<-unique(features$essayNo)
     essayNo<-sort(essayNo)
     
     if (eid == "all") {
          posVscore <- NULL
          for(eno in essayNo) {
               temp<-features[features$essayNo == eno,]
               tempA<-table(temp$POS)
               #tempB<-cbind(tempA,matrix(score[score$essayNo == eno,])
               posVscore<-rbind(posVscore,tempA)
          }
          
          adf<-data.frame(posVscore,row.names=essayNo)
          adf$essayNo<-rownames(adf) 
          adf
     }
}
