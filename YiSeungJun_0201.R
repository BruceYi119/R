library(ggplot2)

# 1)자동차제조회사에 따라 도시연비의 평균출력
data = mpg %>% group_by(manufacturer) %>% summarise(avg = mean(cty))
View(data)

# 2) cty, hwy의 평균연비변수를 추가
data = mpg %>% group_by(manufacturer) %>% summarise(avg = mean(cty), cty = mean(cty), hwy = mean(hwy))
View(data)

# 3) 평균연비가 높은 데이터 3개 출력
data = mpg %>% group_by(manufacturer) %>% summarise(avg = mean(cty)) %>% arrange(desc(avg))
View(head(data, 3))

# mpg$avg = (mpg$cty+mpg$hwy)/2