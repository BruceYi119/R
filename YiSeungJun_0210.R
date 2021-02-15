library('ggplot2')
# 과제)r에서 cars데이터를 가져와 car.csv로 저장하고 세로로 읽어 출력,그래프로 그리시오
write.csv(cars, 'data/car.csv', row.names = F)
data = read.csv('data/car.csv')
ggplot(data=data, aes(x=speed, y=dist)) + geom_col() + coord_flip()