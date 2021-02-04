library(ggplot2)

# 1)drv에 이상치 유무를 확인하고 이상치가 있으면 결측처리후 결측데이터를 제외
data = as.data.frame(ggplot2::mpg)
data[c(10,14,58,93),'drv']<-'k'
data$drv = ifelse(data$drv == 'k', NA, data$drv)
is.na(data$drv)
data = data[!is.na(data$drv),]
data

# 2) 상자그림을 이용하여 cty에 이상치 유무를 확인하고 정상범위에서 벗어난값은 제외하고 다시 상자그림을 그리시오
data = as.data.frame(ggplot2::mpg)
data[c(29,43,129,203),'cty']<-c(3,4,39,42)
boxplot(data$cty)
data = data[data$cty >= 9 & data$cty <= 35,]
boxplot(data$cty)