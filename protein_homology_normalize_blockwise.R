blocks=unique(bio_test$V1)
newdf=data.frame()
for(i in blocks){
  b=bio_test[bio_test$V1==i,]
  newdf <- rbind(newdf,as.data.frame(scale(b[,-c(1,2,3)])))
  
}
newdf$V1=bio_test$V1
newdf$V2=bio_test$V2
newdf$V3=bio_test$V3