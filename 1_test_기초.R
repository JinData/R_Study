#테스트

a=5

b<-6

print(a)

print(b)



dim(available.packages())



a <- available.packages()


head(a)



sessionInfo()





install.packages("stringr")

installed.packages()

library(stringr)





data()



hist(Nile)

hist(Nile, freq=F)

lines(density(Nile))




a1=7
a1 <- 7
a1 <-1


rm(list= ls())

var0 <- 0
var1 <- 1
var2 <- 2
var3 <- 3
var0
var1
var2
var3

goods.code <- 'a001'
goods.code
goods.name <- '냉장고'
goods.price <- 850000
goods.des <- '최고사양, 동급최고 품질'
goods.name
goods.price
goods.des

age <- 35
name <- c('홍길동', '이순신', '유관순 ')
age 
name




int <- 20
int
string <-'홍길동'
string
boolean <- TRUE
boolean
sum(10,20,20)
sum(10,20,20,NA)
sum(10,20,20,NA, na.rm = T)
max(1,2,3,4,5)
min (2,3,4,NA,na.rm=T)

is(int)
x<- is.numeric(int)
is.character(string)
is.logical(boolean)
is.logical(boolean)
is.character(string)
is(string)
x<- c(1,2,'3')
x2<- c(1,2,3)
x
x2
result <-x*3
result <- as.numeric(x)*3
result

z<- 5.3 -3i 
Re(z)
Im(z)
is.complex(z)
as.complex(5.3)



mode(int)
mode(string)
mode(boolean)
class(int)
class(string)
class(boolean)


gender<- c('man', 'woman','woman','man','man')
plot(gender)
mode(gender)
Ngender <- as.factor(gender)
Ngender
plot(Ngender)
table(Ngender)



plot(Ngender)
mode(Ngender)
class(Ngender)
is.factor(Ngender)
Ngender


args(factor)
Ogender <- factor(gender,levels= c('woman','man'), ordered= T)
Ogender


par(mfrow=c(1,4))
plot(Ngender)
plot(Ogender)
plot(Ngender)
plot(Ogender)


Sys.getlocale(category = "LC_ALL")
Sys.time()
sdate <- '2019-11-11 12:49:05'
sdate

class(sdate)


today <- strptime(sdate, format = "%Y-%m-%d %H:%M:%S")
today
class(today)

strptime("30-11-2019", format = ("%d-%m-%Y"))
strptime("30-11-19", format = ("%d-%m-%y"))

Sys.setlocale(category ='LC_ALL', locale= 'Korean_Korea')
Sys.setlocale(category ='LC_ALL', locale= 'English_US')
Sys.setlocale(category ='LC_ALL', locale= 'Japanese_Japan')
Sys.getlocale()


strptime('19-nov-19', format= '%d-%b-%y')
strptime("19 nov 19", format = "%d %b %y")

strptime("01-nov-19", format = "%d-%b-%y")
strptime("01-nov-19", format = "%d-%b-%y")
day <- strptime("tuesday, 19 nov 2019", format = "%A,%d %b %Y")
day <- strptime("Tue, 19 nov 2019", format = "%a,%d %b %Y")
weekdays(day)
strptime("19 Nov 19", format = "%d %b %y")
day <- c("1may99", "2jun01", "28jul15")
strptime(day, format = "%d%b%y")


help('print')
args(max)


example(mean)
#mean()

x<-c(0:10, 50:60)
plot(x)
x
xm<- mean(x)
xm
sum(x)
x<- c(0:10, NA , 50)
x
xm <- mean(x)
xm
setwd('c:/Rwork')
getwd()
  
  
setwd('c:/Rwork/data')
data <-read.csv('test.csv', header = T)
data

head(data, 10)
tail(data, 3)

getwd()
setwd('c:/Rwork')









