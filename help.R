library(dplyr)
data<-read.csv("./activity.csv", na="NA")

data.summ <-summarise_each(group_by(data, date ), funs(sum))
hist(data.summ$steps,breaks=20,main="Histogram of Total steps per day")

#mean(data.summ$steps, na.rm = TRUE )
#median(data.summ$steps, na.rm = TRUE )

data.summ2 <-summarise_each(group_by(data[!is.na(data$steps),], interval ), funs(mean))
plot(x=data.summ2$interval, y=data.summ2$steps, type="l",main="Average steps per interval",
     xlab="interval", ylab="average steps")
data.max<-data.summ2[which.max(data.summ2$steps),]

## Imputing missing values

data.corrected <- merge(data[is.na(data$steps),c("interval","date")],data.summ[,c("interval","steps")],by="interval")
data.combi<-rbind(data.corrected, data[!is.na(data$steps),])

data.summ3 <-summarise_each(group_by(data.combi, date ), funs(sum))
hist(data.summ3$steps,breaks=20,main="Histogram of Total steps per day (imputed data)")


## Are there differences in activity patterns between weekdays and weekends?

library(ggplot2)

data.combi$day<-as.Date(data.combi$date,format = "%Y-%m-%d")
data.combi$weekday<-ifelse(weekdays(data.combi$day) %in% c("zondag","zaterdag"),"Weekend", "Weekday")

data.summ4 <-summarise_each(group_by(data.combi,  weekday, interval ), funs(mean))

qplot(x=data.summ4$interval, y=data.summ4$steps, data=data.summ4, main="Average steps per interval",
      xlab="interval", ylab="average steps", facets=weekday~., geom="line")

