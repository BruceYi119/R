# 벡터의 연산
a = c(1,2,3,4)
b = c(5,6,7,8)
c = a + b
c

# 길이가 다른 벡터의 연산
a = c(1,2,3,4)
b = c(5,6)
c = a + b
c

c = a * b
c

# 데이터 프레임 벡터들을 조합한 형태
id = c('f1','f2','f3','f4')
name = c('둘리','고길동','도우너','또치')
age = c(10000,55,22,15)
is1004 = c(T,F,T,T)
# 데이터 프레임 생성
df = data.frame(id,name,age,is1004)
df
str(df)

# 데이터 접근
df[2,2]
df[3]
df[c(2,3),]
df[c(2,3),c(2,4)]
df[,c(2,4)]
df[,c('name','age')]

# 열에 접근
df$age
df$name[3:4]

# 예제 데이터
data()
iris

# 데이터 저장
write.csv(iris, file='iris.csv')
write.csv(iris, file='iris.csv', row.names = F)
write.csv(iris, file='iris.csv', row.names = F, fileEncoding = 'utf-8')

# 데이터 읽기기
data = read.csv('D:/r/data/iris.csv')
data

# 엑셀 데이터 읽기 패키지 설치
install.packages('readxl')

# 패키지 import
# library('readxl')
library(readxl)

# 엑셀파일 읽기
data = read_excel('D:/r/data/test.xlsx')
# 시트 선택
data = read_excel('D:/r/data/test.xlsx', sheet = 2)
data = read_excel('D:/r/data/test.xlsx', sheet = 'Sheet2')
data

# 클립보드 읽기
data = read.table('clipboard')
data = read.table('clipboard', header = T)

str(iris)
# 행수
nrow(iris)
# 열수
ncol(iris)
# 앞에서 데이터
head(iris, 3)
# 뒤에서 데이터
tail(iris)
min(iris$Sepal.Length)
# 4분위수
quantile(iris$Sepal.Length)
# 데이터 요약
summary(iris)
# 표로보기
View(iris)

# 필터
# subset(데이터프레임, 조건, 조회하고 싶은열)
subset(iris, iris$Sepal.Length > 6, c(3,5))
subset(iris, iris$Sepal.Length > 6, c(3:5))
subset(iris, iris$Sepal.Length > 6 | iris$Sepal.Width >= 4, c(3:5))
subset(iris, iris$Sepal.Length > 3 & iris$Sepal.Width >= 4, c(2:5))

summary(subset(iris, iris$Species == 'setosa'))
summary(iris[iris$Species == 'setosa',])
summary(iris[iris$Species == 'setosa', c('Sepal.Width')])
# 데이터 프레임
str(summary(iris[iris$Species == 'setosa', c('Sepal.Width','Sepal.Length')]))
# 벡터
str(summary(iris[iris$Species == 'setosa', c('Sepal.Width')]))

# rename함수 포함 패키지
install.packages('dplyr')
library(dplyr)

data = iris

# 컬럼명 변경
data = rename(data, len1 = Sepal.Length, width = Sepal.Width)
data

# 새컬럼 생성
data$length = data$len1 + data$Petal.Length
head(data)

# ifelse (조건, 참, 거짓)
data = ifelse(data$Sepal.Length > 5, 'good', 'low')
head(data)

data$new = ifelse(data$len1 > 5, 'good', ifelse(data$len1 > 4.5, 'low', 'fail'))
head(data, 20)

# 필터
data = head(data, 10) %>% filter(new == 'good')
# select
data = data %>% select(Petal.Length, Petal.Width, Species)
data

data = head(data, 10)  %>% filter(len1 > 5) %>% select(Petal.Length, Petal.Width, Species)
data

# 정렬
data = head(data, 10)  %>% filter(len1 > 5) %>% select(Petal.Length, Petal.Width, Species) %>% arrange(Petal.Width)
data = head(data, 10)  %>% filter(len1 > 5) %>% select(Petal.Length, Petal.Width, Species) %>% arrange(desc(Petal.Width))
data

# 
data = head(iris) %>% mutate(hap=Sepal.Length + Petal.Length, avg = (Sepal.Width + Petal.Width) / 2, grade = ifelse(Sepal.Width >=3.5, 'good','poor'))
data

# 그룹
data = iris %>% group_by('Species') %>% summarise(avg = mean(Sepal.Length), hap = sum(Sepal.Length), med = mean(Sepal.Length))
data

install.packages('ggplot2')
library(ggplot2)

# summarise() 요약
summarise(iris)