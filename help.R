library(dplyr)
data<-read.csv("./activity.csv", na="NA")
data.summ <-summarise_each(group_by(data, date ), funs(sum))
mean(data.summ$steps, na.rm = TRUE )
median(data.summ$steps, na.rm = TRUE )

data.summ <-summarise_each(group_by(data[!is.na(data$steps),], interval ), funs(mean))
plot(x=data.summ$interval, y=data.summ$steps, type="l")
data.max<-data.summ[which.max(data.summ$steps),]