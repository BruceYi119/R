# 주석 Ctrl + Shift + C
# 실행 Ctrl + Enter(블럭잡고)
# 콘솔 지우기 Ctrl + l
d = 50
d2 = 100
d + b2
d = '한글'
print(d)
D = 20
print(D)
d
# 벡터함수 c() 데이터 타입이 동일해야한다
d = c(1,3,4,5,6)
# str() 정보확인
str(d)
# length() 길이확인
length(d)
d = seq(1, 100, by=2)
d = c(T, F, FALSE, TRUE)
d = c(T, F, FALSE, TRUE, 'ASDF')
d = c(1, 3.14, 50, 100, 0)
min(d)
max(d)
mean(d)
median(d)
sum(d)
# 형변환 as.xxx
d = as.logical(d)
# 추출
d = '21312657324'
substring(d, 1, 4)
d = '21312657324'
d = c('test1','asdf1','zxcv1')
substring(d, 2, 3)
# 구분자로 자르기기
d = '2020-02-21'
strsplit(d, '-')
# 문자열 합치기기
paste('asdf',123,'3ss','###',sep='/')
paste('asdf',123,'3ss','###',sep='')
# 대소문자 변환
d = 'asdfDFSDf123'
toupper(d)
tolower(d)
# 팩터 생성 : 범주형데이터 factor()
d = c('사과','딸기','배','포도','복숭아')
factor(d)
d = factor(c(10,100,5,90,45))
mode(f)
mode(d)
# 순서변경
d = factor(d, levels = c(5,10,45,90,100))
str(d)
# 등급지정
d = factor(d, levels = c('수','우','미','양','가'), ordered = T)
str(d)
d = c('양','가','미','수','우','수','수','가')
#숫자벡터를 팩터로 변환
n<-c(30,10,10,20,20,30,10)
n1<-factor(n)
n1
n
#요소접근
v1<-c(1,2,3,4,5,6,7,8,9,10)
v1   #v1 전체내용출력
v1[3]
v1[c(1,3,7,9)]   #v1벡터의 1,3,7,9번째 요소 선택
v1[c(9,1,7,3)]   #v1벡터의 1,3,7,9번째 요소 출력순서변경
#연속된 숫자벡터생성
v1<-31:40
v1
v1<-51:100
v1
v1[15:35]  #15~35 요소출력
#seq(from=시작값,to=종료값,by=증감값)
v1<-seq(10,20,2)
v1
v1<-seq(100,0,-20)
v1
#불린추출
v1[3]
idx<-c(T,F,T,F,T,F)
v1[idx]
v1>50 #TRUE  TRUE  TRUE FALSE FALSE FALSE
v1[v1>50]
v1[3]<-67
v1[v1>50]<-  -1    #v1벡터중 50보다 큰값을 -1로 변경
v1[2:4]<-999  #v1벡터의 2번째부터 4번째 까지값을 999로 변경 
#v1벡터의 모든 값을 1로 변경
v1<-1    #X
v1
v1<-c(9,8,7,6,5)
length(v1)
v1[1:length(v1)]<-1   
v1
#----------------------
v1<-c(1,2,3,4,5)
v1<-c(0,v1)   #v1앞에 0 추가
v1<-c(c(-2,-1), v1)  #v1앞에 -2,-1 추가
#v1뒤에 6 추가
v1<-c(v1,6)
v1
#v1뒤에 7,8 추가
v1<-c(v1,7,8)
v1
v1 = c('a','b','c','d','e','f')
v2 = c('g','h')
# append(원본벡터,추가할벡터,추가할위치)
v1 = append(v1,v2,4)
# 데이터 추출
v1[c(3,6)]
# 제외 데이터
v1[-c(3,6)]
# 마지막 데이터터
v1[length((v1))]
# 불린추출
lidx = c(T,F,T,F,F,F)
v1[lidx]
v1[!lidx]