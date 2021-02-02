library(ggplot2)

data = midwest
# 1) 전체인구대비 미성년인구백분율 변수 추가
# (전체인구 - 성인인구) / 전체인구 * 100
data$minor = (data$poptotal - data$popadults) / data$poptotal * 100
data

# 2) 미성년 인구 백분율이 가장 높은 지역 5개 출력
data = data %>% arrange(desc(minor)) %>% head(5)
data

# 3) 미성년 비율 등급 변수를 추가하여
data$minorgrade = ifelse(data$minor >= 40, 'large', ifelse(data$minor >= 30, 'middle', 'small'))
data