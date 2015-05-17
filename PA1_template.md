# Reproducible Research: Peer Assessment 1
M.van Heezik

## Loading and preprocessing the data

```r
data<-read.csv("./activity.csv", na="NA")
```

## What is mean total number of steps taken per day?

```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
## 
## The following object is masked from 'package:stats':
## 
##     filter
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
data.summ <-summarise_each(group_by(data, date ), funs(sum))
hist(data.summ$steps,breaks=20,main="Histogram of Total steps per day")
```

![](PA1_template_files/figure-html/unnamed-chunk-2-1.png) 

```r
#mean(data.summ$steps, na.rm = TRUE )
#median(data.summ$steps, na.rm = TRUE )
```
The mean total number of steps taken per day is: 1.0766189\times 10^{4}  
The median total number of steps taken per day is: 10765

## What is the average daily activity pattern?

```r
data.summ <-summarise_each(group_by(data[!is.na(data$steps),], interval ), funs(mean))
plot(x=data.summ$interval, y=data.summ$steps, type="l",main="Average steps per interval",
     xlab="interval", ylab="average steps")
```

![](PA1_template_files/figure-html/unnamed-chunk-3-1.png) 

```r
data.max<-data.summ[which.max(data.summ$steps),]
```

The maximum average steps is 206.1698113 and found at interval 835


## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
