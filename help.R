library(dplyr)
data<-read.csv("./activity.csv", na="NA")
data.summ <-summarise_each(group_by(data, date ), funs(sum))
#data.summ <- data.summ[!is.na(data.summ$steps),]
mean(data.summ$steps, na.rm = true )