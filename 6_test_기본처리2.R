getwd()
setwd("C:/Rwork/dataset3/dataset3")
dataset <- read.csv("dataset.csv", header = T)
dataset

print(dataset)
View(dataset)

head(dataset)
tail(dataset)

names(dataset)
attributes(dataset)
str(dataset)

dataset$age
dataset$resident
length(dataset$age)

x<- dataset$gender
y<- dataset$price
x
y

plot(dataset$price)

dataset['gender']  
dataset['price']  
  
dataset[2]#dataset[a]라고 했을 때 그냥 컬럼의 순서를 
dataset[6]  
dataset[3,]#기억해야함 dataset[a,b]시 a는 행row b는 열colume임
dataset[,3]  
#% nrow는 number row 이다 따라서 nrow는 row의 개수를 의미한다.
dataset[c('job','price')]#컬럼job, price의 해당하는 데이터를 출력한다. 
dataset[c(2,6)]
dataset[c(1,2,3)]  
dataset[c(2,4:6,3,1)]#ex) 순서의 따라 1번 컬럼이 마지막에위치해있으므로 resident는 마지막으로 기제된다. 

dataset[,c(2,4)]
dataset[c(2:4),]#2부터 4까지의 행의 데이터를 보여준다.
dataset[-c(1:100),]#-이므로 1부터 100까지의 행을 제외하고 출력한다는 것을 보여주기 위한 것

#결측지를 숫자 0으로대체

x<- dataset$price;x
x[1:30]
dataset$price2 = ifelse(!is.na(x), x,0)#x라는 변수를 적용해서 ifelse 를 사용 !is.na이기에 아니면 기존값 맞으면 0을넣음
dataset$price2[1:30]#30개의 데이터르보여줌


dataset$price3 =ifelse(!is.na(x), x, round(mean(x, na.rm = T),2))#@@@@@@@@@@@@@@@@@@@@@@@
#위의 ifelse와같이 NA값이 아니면 기존값 맞음면 NA값을 제외한 값의 평균 소수 둘쨰자리 수까지 표현함
#price2,price3 컬럼을 추가 한다.
dataset$price3[1:30]
dataset[c('price','price2','price3')]


#극단치  처리 
table(dataset$gender)#빈도수를 표현한
pie(table(dataset$gender))#동그란 차트를 

dataset <- subset(dataset, gender == 1 | gender == 2)
dataset
length(dataset$gender)
pie(table(dataset$gender))
pie(table(dataset$gender), col = c('red','blue'))#색을 입혀서 표현가능 

dataset<- resd.csv('dataset.csv', header = T)
dataset$price
length(dataset$price)
plot(dataset$price)
summary(dataset$price)

dataset2 <- subset(dataset, price >=2& price<= 8)#2~8에해당하는 데이터를 추출한것

length(dataset2$price)
stem(dataset2$price)#잘모르겟음 이게뭐노
dataset2

summary(dataset2$age)
length(dataset2$age)

dataset2<- subset(dataset2, age >= 20& age<= 69)
length(dataset2$age)
summary(dataset$age)
boxplot(dataset2$age)# box 플로팅으로 평균연령 분석
boxplot(dataset2$age)$stats

boxplot(dataset$price)
boxplot(dataset$price)$stats#boxplot로 price의 극단치 시각화


dataset_sub <- subset(dataset, price >=2& price <= 7.9)#극단치를 제거한 셋 만들기
summary(dataset_sub$price)

#코딩변경 
dataset2$resident2[dataset2$resident == 1] <- '1.서울특별시'
dataset2$resident2[dataset2$resident == 2] <- '2.인천광역시'
dataset2$resident2[dataset2$resident == 3] <- '3.대전광역시'
dataset2$resident2[dataset2$resident == 4] <- '4.대구광역시'
dataset2$resident2[dataset2$resident == 5] <- '5.시구군'
dataset2[c("resident", "resident2")]

dataset2$job2[dataset2$job == 1] <- '공무원'
dataset2$job2[dataset2$job == 2] <- '회사원'
dataset2$job2[dataset2$job == 3] <- '개인사업'
dataset2[c("job", "job2")]

head(dataset2)
dataset2$age2[dataset2$age <= 30] <- "청년층"
dataset2$age2[dataset2$age > 30 & dataset2$age <= 55] <- "중년층"
dataset2$age2[dataset2$age > 55 ] <- "장년층"
head(dataset2)

#age2라는 컬럼을 만들면서 age의 연령별 비교후 층별로 나누는 컬럼 생성 


#, 만족도 컬럼을 대상으로 1~5순서로 코딩된 값을 5~1순서로 역코딩을 하기 위해 ‘6-현재값’형식으로 수식 적용
survey <-dataset2$survey#처음에 survey라는 변수에 기존값을 저장한다.
csurvey <- 6-survey#그리고 csurvey라는 변수에 기존 6-survey라는 값을 넣고
csurvey#확인하려는 것

dataset2$survey <- csurvey#dataset2의 survey를 csurvey로 대체변경한다.
head(dataset2)#그리고 헤드함수로 변경된 것을 확인한다.


#=======================================
getwd()
setwd("C:/Rwork/dataset3/dataset3")
new_data <- read.csv("new_data.csv", header = T)
#데이터블러오기
str(new_data)#구조확인
new_data
names(new_data)#컬럼 이름과 개수확인

resident_gender<- table(new_data$resident2, new_data$gender2)
resident_gender#(1)
gender_resident <- table(new_data$gender2, new_data$resident2)#table(a,b)라고 정의할때 a는 행b는 열로 처리되어 빈도를 알려줌
gender_resident

barplot(resident_gender, beside = T, horiz = T, #(1)을 차트로 표현한 것 beside는 막대그래프가 겹치지않게, horiz는 수평으로
        col = rainbow(5), #색을 5가지 무지개 색으로 
        legend = row.names(resident_gender),#bar의 각각의 이름을 resident_gender의 행이름으로 지음 
        main = '성별에 따른 거주지역 분포 현황')#제목을 표현함

barplot(gender_resident, beside = T, #각 메뉴들의 순서는 상관없는 것으로 보인다 이것엔 col이 horiz보다 먼저 코딩 되었다.
        col = rep(c(2, 4), 5), horiz = T, #색을 정의한다.
        legend = c("남자", "여자"),#bar의 각각의 이름을선정하는듯
        main = '거주지역별 성별 분포 현황')#맨위의 제목을 의미하는듯


#1단계: lattice 패키지 설치와 메모리 로딩 및 데이터 준비
#install.packages("lattice")
library(lattice)
#2단계: 직업 유형에 따른 나이 분포 현황
densityplot(~ age, data = new_data, #가로측에는 age의 간격의 선이 있고 해당데이터는 new_data를 갖는다
            groups = job2, #선이고 직업은 3개이니 3개의 선이 있을것
            # plot.points = T: 밀도, auto.key = T: 범례)
            plot.points = T, auot.key = T)
#1단계: 성별에 따른 직급별 구매비용 분석
densityplot(~ price | factor(gender),#차트별 가로측에 구매비용을 간격 별로기제하고 factor은 남,여이므로 두개를 갖는다.
            data = new_data, 
            groups = position2, #선이고 직급은 5개의 종류가있으니 5개의 선으로 이루어질 것 
            plot.points = T, auto.key = T)
#2단계: 직급에 따른 성별 구매비용 분석
densityplot(~ price | factor(position2), #차트별 가로측에 구매비용을 간격 별로 기제하고, factor은 5개의 종류 이므로 5개를 갖는다.
            data = new_data, 
            groups = gender2, #그룹은 2개의 종류를 갖고있는 gender이므로 2개의 선을 갖는다.
            plot.points = T, auto.key = T)
#실습 (연속형(2개) vs 범주형(1개) 데이터 분포 시각화)
xyplot(price ~ age | factor(gender2),#세로측은 price, 가로측은 age, 그리고 factor은 gender이므로 2개의 차트를 갖는다. 
       data = new_data)
#xyplot이나 densityplot은 동일하게 y ~ x라고 생각하면 편하다.이떄 x는 가로와 y는 세로는 해당축을 의미한다.
#========================================================
getwd()
setwd("C:/Rwork/dataset3/dataset3")
user_data <- read.csv("user_data.csv", header = T)
#데이터 블러오기
str(user_data)#데이터 구조 

head(user_data)#6개의 데이터 출력
table(user_data$house_type)#데이터중 house_type의 빈도도


#2단계: 더미변수 생성
#단독주택 or 다세대 주택이면 0, 아파트 or 오피스텔이면 1
house_type2 <- ifelse(user_data$house_type == 1 |#컬럼 house_type이 1아니면 2면 0이고 나머지는 1로 표현하라는말
                        user_data$house_type == 2, 0 , 1);house_type2
house_type2[1:10]
#3단계: 파생변수 추가
user_data$house_type2 <- house_type2
head(user_data)
#=======================================================
pay_data <- read.csv("pay_data.csv", header = T)
head(pay_data, 10)#상위 10개의 데이터를 보여줌
table(pay_data$product_type)#product_type의 빈도를 나타냄

#2단계: 고객별 상품 유형에 따른 구매금액과 합계를 나타내는 파생변수 생성
#install.packages("reshape2")
library(reshape2)

product_price <- dcast(pay_data, user_id ~ product_type,# dacast도 xyplot이나 densityplot같이 y~x라고 생각하면됨
                       sum, na.rm = T)

head(product_price)
#3단계: 컬럼명 수정
names(product_price) <- c('user_id', '식표품(1)', '생필품(2)',
                          '의류(3)', '잡화(4)', '기타(5)')#해당 컬럼에 각 항목의 이름으 저장 
head(product_price)
#1단계: 고객별 지불유형에 따른 구매상품 개수를 나타내는 파생변수 생성
pay_price <- dcast(pay_data, user_id ~ pay_method, length)#구매 개수를 나타냄
head(pay_price, 3)
#2단계: 컬럼명 변경
names(pay_price) <- c('user_id', '현금(1)', '직불카드(2)', 
                      '신용카드(3)', '상품권(4)')#해당데이터에 이름을 입력
head(pay_price, 3)

#================================================================
#1단계: 고객정보 테이블과 고객별 상품 유형에 따른 구매금액 합계 병합하기
library(plyr)
user_pay_data <- join(user_data, product_price, by = 'user_id')#공통으로 user_id가 있으므로 
head(user_pay_data, 10)
#2단계: 고객별 지불유형에 따른 구매상품 개수 병합하기
user_pay_data <- join(user_pay_data, pay_price, by = 'user_id')
user_pay_data[c(1:10), c(1, 7:15)]
#=================================================================
#1단계: 고객별 구매금액의 합계(총 구매금액) 계산
user_pay_data$총구매금액 <- user_pay_data$`식표품(1)` +
  user_pay_data$`생필품(2)` +
  user_pay_data$`의류(3)` +
  user_pay_data$`잡화(4)` +
  user_pay_data$`기타(5)`
#2단계: 고객별 상품 구매 총금액 컬럼 확인
user_pay_data[c(1:10), c(1, 7:11, 16)]

print(user_pay_data)
setwd("C:/Rwork/ ")
write.csv(user_pay_data, "cleanData.csv", quote = F, row.names = F)
data<- read.csv("cleanData.csv", header = TRUE)
data

#=====================샘플=====================================================
nrow(data)

choice1 <- sample(nrow(data), 30)
choice1

choice2 <- sample(50:nrow(data), 30)
choice2

choice3 <- sample(c(50:100), 30)
choice3

choice4 <- sample(c(10:50, 80:150, 160:190), 30)
choice4

data[choice1, ]

data("iris")
dim(iris)

idx <-sample(1:nrow(iris), nrow(iris) * 0.7);idx
training <- iris[idx, ];training
testing <- iris[-idx, ];testing
dim(training)
dim(testing)
#=====================교차검정 샘플링========================
name <- c('a', 'b','c', 'd', 'e', 'f')
score <- c(90, 85, 99, 75, 65, 88)
df <- data.frame(Name = name, Score = score)
df
install.packages("cvTools")
library(cvTools)

cross <- cvFolds(n = 6, K = 3, R = 1, type = "random")
cross

str(cross)
cross$which

cross$subsets[cross$which == 1, 1]
cross$subsets[cross$which == 2, 1]
cross$subsets[cross$which == 3, 1]

r = 1
K = 1:3
for(i in K) {
  datas_idx <- cross$subsets[cross$which == i, r]
  cat('K = ', i, '검정데이터 \n')
  print(df[datas_idx, ])
  
  cat('K = ', i, '훈련데이터 \n')
  print(df[-datas_idx, ])
}

#==============예제==========================================
#1. 본문에서 생성된 dataset2의 직급(postion)컬럼을 대상으로 1급  5급, 5급  1급 형식으로 역
#코딩하여 position2컬럼에 추가하시오
position <-dataset2$position
cposition<- 6-position
cposition
dataset2$position<-cposition
dataset2

#2. 본문에서 생성된 dataset2의 resident 컬럼을 대상으로 NA값을 제거한 후 resident2변수에 저
#장하시오

g<-dataset2$resident
dataset2$resident2 <- ifelse(!is.na(g), g, 0)
dataset2[c('resident','resident2')]


#3. 본문에서 생성된 dataset2의 gender컬럼을 대상으로 1  “남자”, 2 “여자”로 코딩 변경하여
#gender2 컬럼에 추가하고, 파이차트로 결과를 확인하시오
dataset2$gender2<- ifelse(dataset2$gender==1 , '남자', '여자' )
pie(table(dataset2$gender2))


#4. 본문에서 생성된 dataset2의 age컬럼을 대상으로 30세이하  1, 30-55세  2, 55이상  3으로
#리코딩하여 age3컬럼에 추가한 뒤에 age, age2, age3 컬럼만 확인하시오
dataset2$age3[dataset2$age<=30]<-'1'
dataset2$age3[dataset2$age>30 & dataset2$age<=55]<-'2'
dataset2$age3[dataset2$age>=55]<-'3'
dataset2[c('age','age2','age3')]

#5. 정제된 data를 대상으로 작업 디렉터리(“C/Rwork/”)에 파일 이름을 “cleandata.csv”로 하여 따옴
#표와 행 이름을 제거하여 저장하고, 저장된 파일의 내용을 읽어 new_data변수에 저장하고 확인하
#시오
setwd('c:/Rwork')
write.csv(dataset2,'cleandata.csv', quote = F, row.names = F)
new_data <- read.csv('cleandata.csv', header = T)
new_data

#6. dataset#3 내 “user_data.csv”, “return_data.csv”파일을 이용하여 고객별 반폼사유코드
#(return_code)를 대상으로 다음과 같이 파생변수를 추가하시오.
setwd('C:/Rwork/dataset3/dataset3')
user<-read.csv('user_data.csv', header = T);user
re<-read.csv('return_data.csv', header = T);re
head(re)
re2<- dcast(re, user_id ~ return_code, sum)
names(re2)<-c('user_id','제품이상(1)', '변심(2)', '원인불명(3)', '기타(4)')
head(re2)


user_re_data <- join(user, re2, by = 'user_id')
user_re_data



#7. iris데이터를 이용하여 5겹 2회 반복하는 교차 검정 데이터를 샘플링하시오

head(iris)
dim(iris)

library(cvTools)
c<-cvFolds(n =150, K=5, R=2, type = 'random')

r=2
k=1:5

for (i in k) {
  datas_idx <- c$subsets[c$which == i, r]
  cat('k =', i, '검정데이터\n')
  print(iris[datas_idx,])
  
  cat('k =',i, '훈련데이터 \n')
  print(iris[-datas_idx,])
  
  
}












