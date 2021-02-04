library(ggplot2)

# hwy = 고속도로연비, cty = 도시연비
data = as.data.frame(ggplot2::mpg)
data$total = (data$cty + data$hwy) / 2
data

# 4)R에서 제공되는 iris데이터 셋을 활용하여 다음을 수행하시오
# 4-1) iris데이터의 구조와 차원, 요약통계량을 확인하시오
data = as.data.frame(iris)
summary(data)
# 4-2) 꽃잎의 길이와 꽃잎의 넓이 사이의 관계를 시각화 하시오
plot(data$Petal.Length, data$Petal.Width, pch=3)
# 4-3) 꽃잎의 길이와 꽃잎의 넓이 사이의 관계를 검정하고 해석하시오
cor(data$Petal.Length, data$Petal.Width) # 매우 강한 관계