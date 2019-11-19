l1=0
lst=list()
blocks=unique(bio_train$V1)
for(i in blocks){
  b=newdf[newdf$V1==i,]
  lab=b$V3
  model=svm(b[,-c(75,76,77)],lab,kernel = 'linear')
  print(dim(model$SV)[1])
  l1=l1+dim(model$SV)[1]
  lst=lappend(lst,row.names(model$SV))
}
ul=unlist(lst)
length(ul)
support_vec=ul
positive_examples=which(newdf$V3==1)
length(positive_examples)
neg_examples=which(newdf$V3==0)
length(neg_examples)
neg_sv=intersect(neg_examples,ul)
pos_df=newdf[positive_examples,]
neg_df=newdf[neg_sv,]
dim(neg_df)
df=rbind(neg_df,pos_df)
n=rep(0,dim(neg_df)[1])
p=rep(1,dim(pos_df)[1])
labels=c(n,p)
mod=svm(df[,-c(75,76,77)],labels,kernel = "radial")
pred <- predict(mod, newdf,probability = FALSE,type="C-classification")
pred[pred>0.5]<-1
pred[pred<0.5]<-0


  

  