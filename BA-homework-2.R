library(tidyverse)

#question 1
mke <- read_csv("C:/Users/taoya/Desktop/MSCS6520/Homework/homework2/milwaukee_weather.csv")
head(mke)
nrow(mke)

#question 2

ggplot(data = mke) +
  geom_point(mapping = aes(x = date, y = avg_temp))
ggsave("time_temp_scatter.jpg")

ggplot(data = mke) +
  geom_line(mapping = aes(x = date, y = avg_temp))
ggsave("time_temp_line.jpg")

#question 3
library(lubridate)
mke<-mutate(mke, day_of_week = as.factor(wday(mke$date)))
mke<-mutate(mke, month = as.factor(month(mke$date)))
mke<-mutate(mke, year = as.factor(year(mke$date)))
head(mke)



save.image("homework2")