#disp 배기량, cyl 실린더갯수 drv 구동방식, hwy 고속도로연비
#class 자동차종류 model 모델명,year 생산년도, trans 변속기종류
#cty 도시년비, fl 연료종류
library(ggplot2)
library(dplyr)
mpg
# 제조사별 suv차량의 도시,고속도록 연비의 평균을 구해 1-5위까지 출력
data = mpg
data %>% filter(class=='suv') %>% group_by(manufacturer) %>% mutate( hap=(cty+hwy)/2) %>% summarise(avg=mean(hap)) %>% arrange(desc(avg)) %>% head(5)
#----------------------------------------------
#범주형데이터:정해진 값만을 가질수 있음 예)연령대(20대,30대,..),성별,지역(서울,제주),.
#            범주형 변수의 수준 levels  
#수치형데이터:다양한 숫자값을 가짐 예)나이,키,..
city = c('서울','대전','서울','서울','대전')
city
city = factor(city)
city
levels(city)
#범주형 변수의 요약
g = c('남','여','여','남','여','여','여','남','남')
g = factor(g)
levels(g)
length(g)   #9
t1 = table(g)   #절대빈도표
t1
t1 / length(g)   #상대빈도
prop.table(t1)
# 막대그래프
barplot(t1) 
#원그래프
pie(t1)
#수치형변수의 요약
kor = c(60,78,83,74,100,85,95,80,70)
sort(kor)
sort(kor,decreasing = T)
min(kor)
max(kor)
median(kor)
mean(kor)
quantile(kor)
boxplot(kor)   #상자그림
hist(kor)    #히스토그램
var(kor)   #분산
sd(kor)    #표준편차
#구로구와 도봉구의 미세먼지 비교
library(readxl)
library(dplyr)
data = read_excel("period.xlsx")
d1 = data %>% filter(측정소명 %in% c('구로구','도봉구'))
guro = subset(d1,측정소명=='구로구')
dobong = subset(d1,측정소명=='도봉구')
summary(guro)
boxplot(guro$미세먼지,dobong$미세먼지,main='미세먼지 비교', names=c('구로구','도봉구'))
#-구로구에서 치킨집이 많은 동네? --------------------
data<-read_excel('data/치킨.xlsx')
juso = substr(data$소재지전체주소, 11, 14)
juso = gsub('[0-9]', '', juso)
t = table(juso)
pie(t)
barplot(t)

# treemap
# install.packages('treemap')
library(treemap)

data = as.data.frame(t)
str(data)
treemap(data, index = 'juso', vSize = 'Freq')

# 데이터 합치기
g1 = data.frame(no = c(1,2,3), kor = c(100,80,90))
g2 = data.frame(no = c(1,2,3), eng = c(95,60,79), mat = c(100,90,80))
# 가로로 합치기
grade = left_join(g1,g2,by='no')
# 세로로 합치기
df = data.frame(no = c(10,20), kor = c(88, 60), eng = c(55,95), mat = c(78, 88))
data = bind_rows(grade, df)

data = mpg
fuel = data.frame(fl = c('c','d','e','p','r'), price = c(100,200,150,300,250))
data = left_join(data, fuel, by = 'fl')

data = read.csv('data/TWO_CONT.csv')
plot(data$HOUR, data$SCORE, col = 'orange')
# 보조선
abline(v = mean(data$HOUR), lty = 2)
abline(h = mean(data$SCORE), lty = 2)
cor(data$HOUR, data$SCORE)

# https://cleanair.seoul.go.kr/2020/
# https://www.localdata.go.kr/

# 둘리 90점   절대값   --굿
# 95점   상대적 값 

# 분석-데이터 전처리
# - 데이터 추출
# - 분석,시각화