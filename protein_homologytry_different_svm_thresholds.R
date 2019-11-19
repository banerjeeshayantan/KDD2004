different_pred<-function(thresh){
  copy=pred
  copy[copy>thresh]<-1
  copy[copy<thresh]<-0
  test=data.frame(bio_test$V1,bio_test$V2)
  test$pred=copy
  head(test)
  file=paste("blockwise_svm", toString(thresh), sep="_")
  write.table(test, file, sep="\t",row.names = FALSE,col.names = FALSE,quote = FALSE)
}