num1<-100
num2<-20
result<- num1 + num2
result
result<- num1 - num2
result
result<- num1 * num2
result
result<- num1 / num2
result
result<- num1 %% num2
result
result<- num1 ^ 2
result
result<- num1 ^ num2
result
#100 =1e+2, 120=1.2e+2

boolean<- num1==num2; boolean
boolean<- num1!=num2; boolean
boolean<- num1>num2; boolean
boolean<- num1>=num2; boolean
boolean<- num1<num2; boolean
boolean<- num1<=num2; boolean
#논리 연산
logical <- num1 >= 50 & num2 <= 10 ;logical
logical <- num1 >= 50 | num2 <= 10 ;logical
#&는 둘다 TT일때 TRUE |은 둘중하나 만 T여도 TRUE 둘다 TT여도 TRUE

x<-T; y<-F
xor(x,y)
#xor은 둘중하나 T일때만 TRUE

x <- 50; y <- 4; z <- x * y
if(x * y >= 40) {
  cat("x * y의 결과는 40이상입니다.\n")
  cat("x * y = ", z)
} else {
  cat("x * y의 결과는 40미만입니다. x * y = ", z, "\n")
}
x<-50; y<-4; z<- x*y
if(x*y <= 40){
  cat("x*y의 결과는 40이상입니다\n")
  cat("x*y=",z)
}else{
  cat("x*y의 결과는 40미만입니다 x * y = ", z, "\n")
}

score<-scan()

score
result<-"노력"
if(score>=80){
  result<-'우수'
  
}
cat("당신의 학점은", result,score)

score <-scan()

if(score>=90){
  result<- 'a학점'
}else if (score>=80){
  result<- 'b학점'
}else if (score>=70){
  result<- 'c학점'
}else if (score>=60){
  result<- 'd학점'
}else{
  result<- "f학점"
}
cat("당신의학점은 ", result)


score<-scan()
ifelse(score >=80, "우수",'노력')

getwd()
setwd("C:/Rwork/data/dataset1")
excel <- read.csv("excel.csv", header=T)
q1<-excel$q1
q1

ifelse (q1>=3, sqrt(q1),q1)
#sqrt 루트 씌우는 함수
ifelse (q1>=2&q1<=4, q1^2, q1)


switch('name', id='hong', pwd= "1234", age="105", name="홍길동")

empname<- scan(what="")
empname
switch(empname,
       hong=250,
       lee=350,
       kim=200,
       kang=400
)


name<- c('kim', 'lee', 'choi','park')
which(name == 'choi')


no<- c(1:5)
name<-c('홍길동', '이순신', '강감찬', '유관순' , '김유신')
score <- c(85, 78, 89,90,74)
exam<-data.frame(학번 =no, 이름=name, 성적=score)
exam
 
which(exam$이름 =='유관순')
exam[4,]


i<- c(1:10)
for(n in i){
  print(n*10)
  print(n)
}

for(n in i){
  if(n %%2 == 0)
    print(n)
}


for(n in i){
  if(n%%2==0){
    next
 }else{
  print(n)
 }
}
#next 비슷 pass

name <-c(names(exam))
name
for(n in name){
  print(n)
  
}
score<-c(85,95,98)
name<-c('홍길동', '이순신', '강감찬')
i<-1
for(s in score){
  cat(name[i],"->",s,'\n')
  #\n는 스페이스바
  i<- i+1
}

i=0 
while(i<10){
  i<-i+1
  print(i)
}
#조건문이 F일때 탈출함


f1<- function(){
  cat('매개변수가없는함수')
}
f1()#매개변수가없는함수만나옴



f3<-function(x,y){
  add <- x+y
  return(add)
}
add1<- f3(10,20)
add1
setwd("C:/Rwork/data/dataset1")
getwd()
test<- read.csv("test.csv", header =TRUE)
head(test)
summary(test)#많이 쓴다함
table(test$A)# A컬럼의 데이터의 빈도를 알려줌
str(test)



data_pro <- function(x){#어떤 데이터가 들어올지 몰라서 임의로x로 설정
  for(idx in 1: length(x)){#idx에 1부터 length(test)까지 그러므로 미리 알아봐야함
    cat(idx,'번쨰 컬럼의 빈도 분석 결과')
    print (table(x[idx]))
    cat('\n')
  }
  
  for(idx in 1:length(x)){
    f <- table(x[idx])
    cat(idx,'번째 컬럼의 초대감/ 최소값\n')
    cat('max=', max(f), "min=",min(f),"\n")
  }
}
data_pro(test)

table(test[1])
length(test)

#표본분산과 모분산과 차이있음 분산에 루트를 씌우면 표준편차임
#var<- sum((x-산술평균)^2)/(length(x)-1)
x<-c(7,5,12,9,15,6)
y<-sum(x)/6
y
a<-c(4,16,9,0,36,9)
b<-sum(a)/5
b#분산
sqrt(b)
mean()



for(idx in x[1:6]){
  cat(((idx-9)^2)/length(x)-1)
}
#하는중
x<-c(7,5,12,9,15,6) 
var_sd<- function(x){
  var<-sum((x-mean(x))^2)/(length(x)-1)
  sd <-sqrt(var)
  cat('표본분산',var,'\n')
  cat('표본표준편차',sd)
}
var_sd(x)
#******표준분산 표준편차*********************************


pytha<-function(s,t){
  a<- s^2 - t^2
  b<- 2*s*t
  c <- s ^ 2 + t ^ 2
  cat("피타고라스 정리: 3개의 변수: ", a, b, c)
}
pytha(2,1)


gugu <- function(i,j){
  for(x in i){
    cat("**", x, '단**\n')
    for(y in j){
      cat(x, '*',y,'=',x*y,"\n")
    }
    cat("\n")
  }
}

i<- c(2:9)
j<- c(1:9)
gugu(i,j)
#구구단


data <-c(10, 20, 5, 4, 40, 7, NA, 6, 3, NA, 2, NA)

na<- function(x){
  #1차 옵션이용
  print(x)
  print(mean(x,na.rm = T))
  #2차 na =0
  data<- ifelse(!is.na(x), x, 0)
  
  print(mean(data))
  #3차 na 평균으로 대체
  data2<- ifelse(!is.na(x), x, round(mean(x, na.rm= T),2))
  print(data2)
  print(mean(data2))
}
na(data)
##### 공부필요

coin<- function(n){
  r<- runif(n, min=0 , max=1)
  result<- numeric()
  for(i in 1:n){
    if(r[i]<= 0.5)
      result[i]<- 0
    else
      result[i]<-1
  }
  return(result)
}

coin(10)
#------------------------------------

montaCoin<- function(n){
  cnt<-0
  for(i in 1:n){
    cnt<- cnt+coin(1)
  }
  result<-cnt/n
  return(result)
}
montaCoin(10)
montaCoin(30)
montaCoin(100)
montaCoin(1000)
montaCoin(1000000)



library(RSADBE)
data("Bug_Metrics_Software")
str(Bug_Metrics_Software)
rowSums(Bug_Metrics_Software[,,1])
rowMeans(Bug_Metrics_Software[,,1])
colSums(Bug_Metrics_Software[,,1])
colMeans(Bug_Metrics_Software[,,1])

seq(-2, 2, by=0.2)
vec<- 1:10
min(vec)
max(vec)
range(vec)
mean(vec)
median(vec)
sum(vec)
sd(rnorm(10))
rnorm(10)
table(vec)


n <- 1000
rnorm(n, mean = 0, sd =1 )
#rnorm표준정규분포rnorm(n, mean=, sd=)
hist(rnorm(n, mean = 0, sd =1))


n<-1000
runif(n, min=0, max =10)
hist(n, min=0, max =10)
#균등분포


n<-20
rbinom(n, 1, prob = 0.5)
#실습 (이항분포의 난수 생성하기)prob 확률
rbinom(n, 2, 0.5)
rbinom(n, 10, 0.5)
rbinom(n, 5, 1/6)
#rbinom(몇번할건지 , 주사위면 6, 확률)


rnorm(5, mean = 0, sd =1)
#평균이0인표준편차가1인  표준정규분포라한다
set.seed(123)#이게 같은면 같은 데이터가 나온다고한다
rnorm(5, mean = 0, sd =1)
rnorm(5, mean = 0, sd =1)

set.seed(345)
rnorm(5, mean = 0, sd =1)
set.seed(345)
rnorm(5, mean = 0, sd =1)

#abs(x)절대값, sqrt(x)표준편차, ceiling(x)천장, floor()반올림
#, round()소수자리, factorial(x) ex)3!=6=1*2*3,

exp(1)

vec<-1:10
prod(vec)#1부터10까지 곱하면 이런수가나온다
factorial(5)
abs(-5)#절댓값
sqrt(16)#루트 =1/2^
vec
cumsum(vec)#순차적으로 더함
cumprod(vec)#순차적으로 곱합
log(10)
log10(10)

#ncol(x)열의개수, nrow(x)행의개수, t(x)트레이트 자리룰바꾸는함수, 
#cbind(…)열을 붙일때, rbind(…)행을 붙일때, diag(x)대각선에있는숫자만, 
#det(x), apply(x, m, fun)행열의 함수,

#solve(x): 역행렬, 
#eigen(x): 정방행렬을 대상으로 고유값 분해하는 함수
#svd(x): mxn 행렬을 대상으로 특이값을 분해하는 함수
#x%*%y: 두 행렬의 곱을 구하는 수식

x<- matrix(1:9, nrow = 3, ncol = 3, byrow = T)
x
y<- matrix(1:3, nrow = 3)
y
ncol(x)
nrow(x)
x
t(x)
cbind(x, 1:3)
rbind(x, 10:12)
x
diag(x)
det(x)
apply(x, 1, sum)
apply(x, 2, mean)
svd(x)
eigen(x)
x%*%y

x<-c(1,2,3,4,5)
y<-c(5)
x%%y
x<-matrix(c(1,4,2,3), nrow = 2)
x
y<-matrix(c(1,3,2,4,5,6), nrow = 2)
y
x%*%y

z<-matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3)
z
x%*%z

c(1,2,3) %*% c(4,5,6)



x<- matrix(c(1,4,2,3), nrow = 2)
x
y<- matrix(c(1,3,2,4), nrow = 2)
y
x%/%y
z<- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3)
x%/%z
x%in%y
sum(x%in%y)


x<-c(1,3,5,7,9)
y<-c(3,7)
union(x,y)
setequal(x,y)
intersect(x,y)
setdiff(x,y)
setdiff(y,x)
5%in%y
