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
#mean(data.summ$steps, na.rm = TRUE )
```
The mean total number of steps taken per day is: 1.0766189\times 10^{4}

## What is the average daily activity pattern?



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
