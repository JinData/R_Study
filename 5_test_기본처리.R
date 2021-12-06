rm(list= ls())

setwd("C:/Rwork/data/dataset1/dataset2 ")
data <- read.csv("descriptive.csv", header = TRUE)
head(data)

dim(data)#로우와 컬럼의 길이를 보여줌
length(data) #몇개의 컬럼이 있는지 보여줌
length(data$survey)#컬럼survey에 몇개의 데이터가 있는지 보여주는듯
str(data)

summary(data)#각각의 최소최대등의 컬럼 표현

length(data$gender)
summary(data$gender)
table(data$gender)

data <- subset(data, gender == 1 | gender == 2)
x <- table(data$gender)
x
barplot(x)

prop.table(x)
y <- prop.table(x)
round(y * 100, 2)


m <- matrix(1:4, 2)
m
4
prop.table(m, 1)
prop.table(m, 2)

length(data$level)
summary(data$level)
table(data$level)


x1 <- table(data$level)
barplot(x1)

survey <- data$survey
survey

summary(survey)

x1 <- table(survey)
x1

hist(survey)
pie(x1)

length(data$cost)
summary(data$cost)

plot(data$cost)
data <- subset(data, data$cost >= 2 & data$cost <= 10)
x <- data$cost
mean(x)

mean(x)
median(x)
sort(x)
sort(x, decreasing = T)


quantile(x, 1/4)
quantile(x, 2/4)
quantile(x, 3/4)
quantile(x, 4/4)

ength(x)
x.t <- table(x)
max(x.t)

x.m <- rbind(x.t)
class(x.m)
str(x.m)
which(x.m[1, ] == 18)
which(x.m == 18)

x.df <- as.data.frame(x.m)
which(x.df[1, ] == 18)
8
which(x.df == 18)

x.df[1, 19]
attributes(x.df) #어떤 행에 어떤 데이터가 있는지  보여줌
names(x.df[19])

var(x)
sd(x)
sqrt(var(data$cost, na.rm = T))#표준편차를 구하는

table(data$cost)

hist(data$cost)

plot(data$cost)

data$cost2[data$cost >= 1 & data$cost <= 3] <- 1
data$cost2[data$cost >= 4 & data$cost <= 6] <- 2
data$cost2[data$cost >= 7] <- 3

data$cost2

table(data$cost2)
par(mfrow = c(1, 2))
barplot(table(data$cost2))
pie(table(data$cost2))

install.packages("moments")
library(moments)
cost <- data$cost

skewness(cost)

kurtosis(cost)

hist(cost)
par(mfrow = c(1, 1))

hist(cost, freq = F)
lines(density(cost), col = 'blue')
x <- seq(0, 8, 0.1)
curve(dnorm(x, mean(cost), sd(cost)), col = 'red', add = T)

attach(data)
length(cost)
summary(cost)
mean(cost)
min(cost)
max(cost)
range(cost)
sd <- sd(cost, na.rm = T)
sqrt(var(cost, na.rm = T))
sd(cost, na.rm = T)
detach(data)

test <- c(1:5, NA, 10:20)
min(test)
max(test)
range(test)
mean(test)

min(test, na.rm = T)
max(test, na.rm = T)
range(test, na.rm = T)
mean(test, na.rm = T)

data$resident2[data$resident == 1] <- "특별시"
data$resident2[data$resident >= 2 & data$resident <= 4] <- "광역시"
data$resident2[data$resident == 5] <- "시구군"

x <- table(data$resident2)
x
prop.table(x)
y <- prop.table(x)
round(y * 100, 2)

data$gender2[data$gender == 1] <- "남자"
data$gender2[data$gender == 2] <- "여자"
x <- table(data$gender2)
prop.table(x)
y <- prop.table(x)
round(y * 100, 2)

data$age2[data$age <= 45] <- "중년층"
14
data$age2[data$age >= 46 & data$age <= 59] <- "장년층"
data$age2[data$age >= 60] <- "노년층"
x <- table(data$age2)
x
prop.table(x)
y <- prop.table(x)
round(y * 100, 2)

data$level2[data$level == 1] <- "고졸"
data$level2[data$level == 2] <- "대졸"
data$level2[data$level == 3] <- "대학원졸"
x <- table(data$level2)
x
prop.table(x)
y <- prop.table(x)
round(y * 100, 2)

data$pass2[data$pass == 1] <- "합격"
data$pass2[data$pass == 2] <- "실패"
x <- table(data$pass)
x
prop.table(x)
y <- prop.table(x)
round(y * 100, 2)
head(data)


















           
           
