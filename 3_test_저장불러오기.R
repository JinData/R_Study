num<-scan()
num
sum(num)
name<-scan(what =character())
name
df= data.frame()
df= edit(df)

getwd()
setwd("C:/Rwork/data/dataset1")
getwd()

student<- read.table(file = 'student.txt')
student
names(student )<- c('번호', '이름', '키', '몸무게')#컬럼명을 지정해줌
student
student <- read.table(file = "student.txt", header=T)#해더가 있을경우만 T를해용해서 한다
student
student1 <- read.table(file.choose(), header=T)
student2 <- read.table(file = 'student2.txt', sep =';', header=T)
student2
student3 <- read.table(file = 'student3.txt',  header=T, na.strings = "-")
student3#-는 NA라고 표시를하라는 것임 na.strings**

student4 <- read.csv(file = 'student4.txt',sep=',',na.strings='-')
student4

Titanic <- read.csv( 'https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv')
Titanic

dim(Titanic)
str(Titanic)#str을 많이 쓴다함
table(Titanic$age)
table(Titanic$sex)#table 은 빈도를 구하는 함수
table(Titanic$survived)#table 은 빈도를 구하는 함수
head(Titanic)
tail(Titanic,20)

tab <- table(Titanic$survived, Titanic$sex)
tab#교차분할표

barplot(tab, col=rainbow(2), main='성별에 따른 생존 여부부')

x <- 10 
y <- 20 
z <- x*y
cat('x*y의 결과는', z,'입니다\n')#문자열과 수가 함께 출력 가능
cat('x*y=',z)

library(RSADBE)#을 깔아야 sink라는 함수를 쓸수있음
data("Severity_Counts")
sink('severity2.txt')
severity <- Severity_Counts
severity
sink()#sink를 이용하여 저장하는(R의 결과를 파일에 보내는함수)
#sink()를 한번 더쓰게되면 저장을 멈춘다

severity <- Severity_Counts
severity

Titanic
write.table(Titanic,"titanic.txt", row.names= F)
Titanic_df <- read.table(file= 'titanic.txt',sep = "",header = T)
Titanic_df
st.df<-studentx
write.csv(st.df,"stdf.csv", row.names = F, quote = F)
#st.df파일이 stdf에 csv 형태로 저장된다   
getwd()



