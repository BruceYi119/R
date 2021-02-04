#팁데이터를 가져와서 요약하고 팁과 식대사이의 관계를 그래프로 표현하시오
#data<-read.csv('data/tips.csv')
#data<-read.csv('data/tips.csv')
#data<-read.table('data/tips.csv')
data<-read.table('clipboard',header = T)
data
summary(data)
plot(data$total_bill,data$tip)
cor(data$total_bill,data$tip)  #양의상관관계, 상관계수 0.67
#-------------------------
#상관계수:-1~1에 있다. 두 수치형 변수사이의 관계를 나타낼때 사용
#----------
score=data.frame(kor=c(60,70,74,78,80,83,85,90,95,100),
                 mat=c(75,70,60,85,100,84,94,70,90,92))
#국어점수의 평균
mean(score$kor)
#국어점수가 90점 이상인 것들의 평균
mean(score$kor[score$kor>=90])
hist(score$kor)  #국어점수의 분포
boxplot(score$kor)
#국어와 수학점수의 관계
plot(score$kor,score$mat)
cor(score$kor,score$mat)
#a,b 식당 배달시간
a<-c(20,21,23,22,26,28,35,35,41,42,43,45,44,45,46,47,47,46,47,58,58,59,60,56,57,57,80)
b<-c(5,6,11,13,15,16,20,20,21,23,22,27,27,30,30,32,36,37,37,40,40,43,44,45,51,54,70,600)
mean(a)    #44분
mean(b)    #50.53분
summary(a)
summary(b)
boxplot(a,b)
#이상치제거
b<-b[b<600]
summary(b)
boxplot(a,b)
hist(a)
hist(b)
var(a)  # 210 분산
var(b)  # 239.5
sd(a)   #표준편차
sd(b)
#-----------------------------
bscore<-c(34,76,76,63,73,75,67,78,81,53,58,81,77,80,43,65,76,63,54,64,85,54,70,71,71,55,40,78,79,100,51,93,64,42,63,61,82,67,98,59,63,84,50,67,80,83,66,86,57,48)
ascore<-c(74,87,89,98,65,82,70,70,70,84,56,76,72,69,73,61,83,82,89,75,48,72,80,66,82,71,49,54,70,65,74,63,65,101,82,75,62,83,90,76,87,90,78,63,59,79,74,65,77,74)
length(bscore)
length(ascore)
boxplot(bscore,ascore)
#학원을 다닌후 성적이 향상되었다?
#통계검정
#귀무가설 : 기존가설                          
#대립가설 : 학자가 주장하는 바, 새로운 가설,  
#           귀무가설 잘못되었음을 증명하여 대립가설을 채택하는 방식
#유의확율(p-value) : 귀무가설이 참이라는 가정하에 얻은 통계량,
#                    유의확율은 귀무가설을 얼마나지지하는지를 나타낸 확율
#                    유의확율이 작을수록 대립가설이 통계적 의미를 가진다.
#                    0.05보다 작을때 대립가설 채택
#두 수치형 변수의 관계
data<-read.csv('data/TWO_CONT.csv')
data
#산점도
plot(data$HOUR,data$SCORE,col='blue')
#보조선
mean(data$HOUR)
abline(v=mean(data$HOUR),lty=2)
abline(h=mean(data$SCORE),lty=2)
cor(data$HOUR,data$SCORE)   #상관계수, 양의 상관관계
#상관계수가 의미가 있는지 판단
cor.test(data$HOUR,data$SCORE)    #상관계수를 검정해주는 함수
#0.05 작으므로 상관계수는 의미가 있다. 즉 공부시간과 점수는 양의 상관관계
#----
data=read.csv('data\\heights.csv')
data
plot(data$father,data$son)
cor(data$father,data$son)
cor.test(data$father,data$son)
#p-value가 매우 작으므로 상관계수는 의미가 있다.
#--------------
bscore<-c(34,76,76,63,73,75,67,78,81,53,58,81,77,80,43,65,76,63,54,64,85,54,70,71,71,55,40,78,79,100,51,93,64,42,63,61,82,67,98,59,63,84,50,67,80,83,66,86,57,48)
ascore<-c(74,87,89,98,65,82,70,70,70,84,56,76,72,69,73,61,83,82,89,75,48,72,80,66,82,71,49,54,70,65,74,63,65,101,82,75,62,83,90,76,87,90,78,63,59,79,74,65,77,74)
length(bscore)
length(ascore)
boxplot(bscore,ascore,names=c('수강전','수강후'))
#학원을 다닌후 성적이 향상되었다
#t검정 :추출된 표본은 근거로 모집단을 추정해 모집단이 같은지 다른지 확인
t.test(bscore,ascore,var.equal = T)
#p-value가 0.05보다 작으므로 모집단의 데이터도 점수가 향상되었다고 볼수 있다.
#----------------------------------
#구로구와 도봉구의 미세먼지 비교
library(readxl)
library(dplyr)
data<-read_excel("data/period.xlsx")
d1<-data %>% filter(측정소명 %in% c('구로구','도봉구'))
guro=subset(d1,측정소명=='구로구')
dobong=subset(d1,측정소명=='도봉구')
summary(guro)
boxplot(guro$미세먼지,dobong$미세먼지,main='미세먼지 비교',
        names=c('구로구','도봉구'))
t.test(guro$미세먼지,dobong$미세먼지,var.equal=T)
#mpg 데이터를 활용하여 경차(compact)와 suv차량의 도시연비(cty)를 비교. compact와 suv차량의 도시연비의 차이가 유의미한지 여부를 판단
library(ggplot2)
data<-mpg
data<-data[data['class']=='compact' |data['class']=='suv' ,]
boxplot(data[data['class']=='compact']$cty, 
        data[data['class']=='suv']$cty)
c=data[data['class']=='compact',] 
s=data[data['class']=='suv',] 
boxplot(c$cty,s$cty)
t.test(c$cty,s$cty,var.equal = T)
#--------------------
person=data.frame(name=c('철수','영희','경수','순자'),
                  score=c(80,130,-10,90),
                  gender=c(1,2,1,5))
person
#이상치 처리
person['score']>=0 & person['score']<=100
person<-person[person['score']>=0 & person['score']<=100,]
person
#결측처리
person$gender<-ifelse(person$gender==1 | person$gender==2,person$gender,
                      NA)
#결측치 제외
is.na(person$gender)   #결측유무확인
!is.na(person$gender)
person
person<-person[!is.na(person$gender),]
person
#-------------------------
data<-iris
str(data)    #종류가 factor
data$Species<-as.character(data$Species)
str(data)
data[c(30,90,120),'Species']<-'rose'
data[c(31,91,121),'Sepal.Length']<-99.9
summary(data)
boxplot(data$Sepal.Length)
data$Sepal.Length<10
data<-data[data$Sepal.Length<10,]   #이상치 제거
table(data$Species)
data$Species<-ifelse(data$Species=='setosa'|data$Species=='versicolor'|data$Species=='virginica',data$Species,NA)
table(data$Species)
summary(data)
#결측치제거
data<-data[!is.na(data$Species),]
# 과제 mpg 데이터에서
data<-as.data.frame(ggplot2::mpg)
data<-mpg
data[c(10,14,58,93),'drv']<-'k'
data[c(29,43,129,203),'cty']<-c(3,4,39,42)
1)drv에 이상치 유무를 확인하고 이상치가 있으면 결측처리후 결측데이터를 제외
2) 상자그림을 이용하여 cty에 이상치 유무를 확인하고 정상범위에서 벗어난값은 제외하고 다시 상자그림을 그리시오



choose(4,2)   #4개중 2개를 선택하는 모든 가능한 경우의 수
choose(3,2)
choose(45,6)  #로또에서 모든 가능한 조합수




