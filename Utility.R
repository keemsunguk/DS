library(XML)
require(RCurl)
require(XML)

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

getTextFromWeb<-function(address) {
     webpage <- getURL(address)
     webpage <- readLines(tc <- textConnection(webpage)); close(tc)
#     webpage
      pagetree <- htmlTreeParse(webpage, error=function(...){}, useInternalNodes = TRUE)
#      pagetree
#      # parse the tree by tables
      x <- xpathSApply(pagetree, "//p", xmlValue)  
#      x
#      # do some clean up with regular expressions
       x <- unlist(strsplit(x, "\n"))
       x <- gsub("\t","",x)
       x <- sub("^[[:space:]]*(.*?)[[:space:]]*$", "\\1", x, perl=TRUE)
       x <- as.list(x[!(x %in% c("", "|"))])
       esy<-do.call(rbind, Filter(function(x) nchar(x)>30, x))
       esy
}

getLinkFromWeb <- function(address) {
     webpage <- htmlParse(address)
      x <- xpathSApply(webpage, "//a/@href")  
      x <- unlist(strsplit(x, "\n"))
      x <- unlist(strsplit(x, "&"))
      x <- gsub("\t","",x)
      x <- sub("^[[:space:]]*(.*?)[[:space:]]*$", "\\1", x, perl=TRUE)
      x <- as.list(x[!(x %in% c("", "|"))])
      lnk<-as.list(do.call(rbind, Filter(function(x) nchar(x)>40, x)))
      lnk<-do.call(rbind, lnk[grep("/url?", lnk)])
      mlnk<-sub("/url\\?q=","",lnk)
#      mlnk[!grepl("google", mlnk) ]
      df<-data.frame(mlnk)
      df[-grep("google",df$mlnk)]
}

