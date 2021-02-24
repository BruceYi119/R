# install.packages('rpart')
# install.packages('rpart.plot')
library(rpart)
library(rpart.plot)
data=read.csv('data/insurance.csv')
data
result<-rpart(charges~.,data=data)
result
rpart.plot(result)

data<-read.csv('data/sales.csv')
result<-rpart(sales~price+advert,data=data)
rpart.plot(result)

load('data/admission.RData')
#admit: 합격여부
#gre :시험점수
#gpa :대학 평균평점
#rank :대학교 등급
result<-rpart(admit~gre+gpa+rank,data=admission)
rpart.plot(result,cex=1)