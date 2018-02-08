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

ggplot(data = mke)+
  geom_boxplot(mapping= aes(x=year, y=avg_temp))
ggsave("temp_year.jpg")

ggplot(data = mke)+
  geom_boxplot(mapping= aes(x=month, y=avg_temp))
ggsave("temp_month.jpg")

ggplot(data = mke)+
  geom_boxplot(mapping= aes(x=day_of_week, y=avg_temp))
ggsave("temp_wday.jpg")

ggplot(data = mke)+
  geom_point(mapping= aes(x=date, y=snowfall))
ggsave("snow_date_point.jpg")

ggplot(data = mke)+
  geom_line(mapping= aes(x=date, y=snowfall))
ggsave("snow_date_pline.jpg")

mke<-mutate(mke, total_precipitation = snowfall+rainfall)
mke<-mutate(mke, has_snowed = ifelse(snowfall>0,"yes","no"))
mke<-mutate(mke, has_snowed= as.factor(has_snowed))
ggplot(data=mke)+
  geom_boxplot(mapping=aes(x=has_snowed,y=total_precipitation,color=has_snowed))
ggsave("total_precipitation_has_snowed.jpg")

ggplot(data=mke)+
  geom_line(mapping = aes(date,avg_wind_speed))
ggsave("avg_wind_speed_date.jpg")
ggplot(data=mke)+
  geom_boxplot(mapping=aes(month,avg_wind_speed))
ggsave("avg_wind_speed_month.jpg")

ggplot(data=mke, aes(avg_wind_speed,snowfall))+
  geom_point()
ggsave("snowfall_avg_wind_speed.jpg")

save.image("homework2")