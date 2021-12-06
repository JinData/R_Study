#벡터
a<- c(1:100)
a

b<-seq(1, 10, 2)
c<-rep(1:3, 2)
rep(1:3, each=3)

x<- c(1,3,5,7)
y<- c(3,5)
#집합
union(x,y)#합집합
setdiff(x,y)#차집합
intersect(x,y)#교집합

v1 <- c(33, -5, 20:23, 12, -2:3)
v2 <- c('홍길동','이순신','유관순')
v3 <- c(T, TRUE, FALSE, T, TRUE, F, T)
v1; v2; v3

v4 <- c(33, 05, 20:23, 12, '4')
v4 

age<-c(30, 35, 40)
age
names(age)<- c('홍길동','이순신','강감찬')#이름을 다는 함수
age
age <- NULL# 데이터를 없앤다
age

a<- c(1:50)
a[10:45]
a[19:(length(a)-3)]
a[19:47]

v1 <- c(13, -5, 20:23, 12, -2:3) #(13, -5, 20, 21, 22, 23, 12,-2:3)same
v1[1]
v1[c(2,4)]#꼭 c함수를 써야함
v1[c(3:5)]# []is index 따로 인덱스를 표기하지 않는 듯하다
v1[c(4, 5:8, 7)]
v1[-1]#1번자리에잇는 13을 뺴고 보여준다
v1[-c(2,4)]
v1[-c(2,5:10, 1)]# 해당하는자리의 데이터만 삭제해서 보여줌

install.packages("RSADBE")
library(RSADBE)
data("Severity_Counts")
str(Severity_Counts)# 데이터 구조를 볼때 쓰인다structure의 줌말
head(Severity_Counts)

m<- matrix(c(1:5))
m
m<- matrix(c(1:10), nrow=2) #행을 2개로설정하고 위에서아래로 출력
m
m<- matrix(c(1:11), nrow=2)#11까지 출력후 빈공간 첫번째 데이터출력
m
m<- matrix(c(1:10), nrow=2, byrow = T) #byrow는 행기준으로 하는 서브옵션이다
m

x1 <- c(40, 50:52)
x2 <- c(30, 6:8)
mr <- rbind(x1,x2)
mr
mc <- cbind(x1,x2)
mc
mc2 <- cbind(x2,x1)
mc2
m3<- matrix(10:19,nrow=2)
m4<- matrix(10:20,nrow=2)
m3
m4
mode(m3)
class(m3)

m3[1,]
m3[,5]
m3[2,3]
m3[1,c(2:5)]

x<- matrix(c(1:9), nrow =3, ncol =3, byrow =T)
x

x
apply(x,1,max)
apply(x,2,max)
apply(x,1,min)
apply(x,2,mean)


f<- function(x){
  x*c(1,2,3 )
}
result<-apply(x,1,f)
result
x
colnames(x)<-c('one', 'two', 'three')
x
rownames(x)<-c('row one', 'row two','row three')
x

vec <- c(1:24)
vec
arr <- array(vec, c(3,4,2))
arr
arr[,,1]
arr[,,2]
mode(arr); class(arr)
arr[,2,]

library(RSADBE)
data("Bug_Metrics_Software")
str(Bug_Metrics_Software)
head(Bug_Metrics_Software, 3)
dim(Bug_Metrics_Software)

no <-c(1,2,3)
name <-c("hong", "lee","kim")
pay<-c(150, 250, 300)
vemp<-data.frame(No=no, Name= name, Pay=pay)
vemp

m<- matrix(c(1,'hong',150, 2,'lee', 250, 3,'kim', 300),3, byrow=T)
m
memp <-data.frame(m)
memp
mode(m)
class(m)


getwd()
setwd('c:/Rwork/data/')
txtemp <- read.table("emp.txt", header =1, sep = "")
txtemp
csvemp <- read.csv("emp.csv", header =1, sep= "")
csvemp

read.csv('emp2.csv', header=F)
name<-c("사번", "이름","급여")
name
read.csv('emp2.csv', header= F, col.names =name)

df <- data.frame(x= c(1:5), y=seq(2,10,2), z=c('a','b','c','d','e'))
df
df$x
df$z
str(df)
ncol(df)
nrow(df)
names(df)
df[c(2:3),1]

apply(df[,c(1,2)],2, sum)
df[,2]
df


x1<-subset(df, x>=2)# x컬럼의 해당되는열의 데이터를보여줌
x1
df

y1 <-subset(df, y<=8)
y1
xyand <- subset(df, x<=2&y <=6)
xyor <- subset(df,x<=2| y <=0)
xyand
xyor

sid <- c("A","B","C","D")
score<- c(90,80,70,60)
subject <-c("컴퓨터", "국어국문", "소프트웨어", "유아교육")
student<- data.frame(sid, score, subject)
student
 
mode(student); class(student)
str(sid)
str(score)
str(subject)
str(student)

height <- data.frame(id = c(1,2), h= c(180,175))
weight <- data.frame(id = c(1,2), w= c(80,75))
weight
height
user <- merge(height, weight, by.x ='id', by.y='id')
user

install.packages("UsingR")
library(UsingR)
data(galton)

str(galton)
dim(galton)#928 행 2 열
head(galton, 15)# 처음에서 15를 보여달라는것


#====================================================
list <- list('lee', '이순신',95)
list
unlist<-unlist(list)
unlist #벡터 변환 숫자가 문자열로 변함
num<-list(c(1:5),c(6,10))
num

member<-list(name=c("홍길동","유관순"), age =c(35,25),
             address = c("한양", "충남"), gender= c("남자", "여자"),
             htype= c("아파트", "오피스텔"))
member
member$name
member$name[1]
member$name[2]

member <-NULL
member$age[1]<-45# 해당하는자리에 지정한 수를 대입할수있다
member$id<-"hong" #새로만듬
member
member$age<- NULL# age 가 싹다 사라짐
member$pwd<- 1234
length(member)
mode(member)
class(member)

a<-list(c(1:5))
b<-list(c(6:10))
lapply(c(a,b), max)# apply와같고 함수를 적용하여 처리하는 함수인듯
sapply(c(a,b), max)# lapply와같고 다만 벡터 메트릭스형식으로로 표기한다

multi_list<-list(c1 =list(1,2,3),
                 c2 = list(10,20,30),
                 c3 =list(100,200,300))
multi_list$c1;multi_list$c2;multi_list$c3
#여러 리스트를 묶는 것

do.call(cbind, multi_list)#cbind 열을 기준으로 작성된다
do.call(rbind, multi_list)#rbind 행을 기준으로 작성된다

class(do.call(cbind, multi_list))
#--------------------------
install.packages('stringr')
library(stringr)
str_extract('홍길동35이순신45유관순23','[1-9]{2}')#1-9숫자를찾아라
#{2}는 숫자가 2개 연속된것을 찾아서 출력
str_extract_all('홍길동35이순신45유관순23','[1-9]{2}')

string <-"hongkd105leesss1002you25강감찬2005"
str_extract_all(string, '[a-z]{3}')#3자리까지만
str_extract_all(string, '[a-z]{3,}')#3자리이상만
str_extract_all(string, '[a-z]{3,5}')

str_extract(string,'hong')
str_extract(string,"25")
str_extract(string,"[가-힣]{3}")
str_extract_all(string,"[a-z]{3}")
str_extract_all(string,"[0-9]{4}")#{}는자리수

#"[^제외문자열]"
#"[^제외문자열]{n}"
string
str_extract_all(string, "[^a-z]")
str_extract_all(string, "[^a-z]{4}")
#^는 제외하는 
str_extract_all(string, '[^가-힣]{5}')
str_extract_all(string, '[^0-9]{3}')

jumin<- '123456-1234567'
str_extract(jumin, "[0-9]{6}-[1234][0-9]{6}")
str_extract_all(jumin, "\\d{6}-[1234]\\d{6}")

name <- '홍길동1234,이순신5678,강감찬1012'
str_extract_all(name, '\\w{7,}')#7글자 이상만 나옴

string <-"hongkd105leess1002you25강감찬2005"
len<- str_length(string)
len
str_locate(string, '강감찬')
#지정한 것의 위치의 시작과 끝을알려줌 
str_length(string)
string_sub <- str_sub(string, 1, 23)
string_sub
 
ustr<-str_to_upper(string_sub)
ustr
ustr2<-str_to_lower(ustr)
ustr2

string_rep <- str_replace(string_sub,"hongkd105","홍길동35")
string_rep <- str_replace(string_rep,"leess1002","이순신45")
string_rep <- str_replace(string_rep,"you25","유관순25")
string_rep

string_c<-str_c(string_rep, '강감찬55')
string_c

string_sp <- str_split(string_join,   "," )
string_sp


string_vec <- c('홍길동35','이순신45', '유관순23','강감찬55')
string_vec


string_join <- paste(string_vec, collapse = ',')
string_join

