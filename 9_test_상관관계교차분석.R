#상관 관계 분석=========================================================


#1단계: 데이터 가져오기
product <- read.csv('c:/Rwork/data/dataset1/product.csv', header = T)
head(product)


#2단계: 기술통계량
summary(product)
sd(product$제품_친밀도);sd(product$제품_적절성);sd(product$제품_만족도)#sd()표준편차를 구하는 함수이다
#var()분산
#-----------------

#1단계: 변수 간의 상관계수 보기
cor(product$제품_친밀도, product$제품_적절성)
cor(product$제품_친밀도, product$제품_만족도)

#2단계: 제품_적절성과 제품_만족도의 상관계수 보기
cor(product$제품_적절성, product$제품_만족도)

#3단계: (제품_적절성+제품_친밀도)와 제품_만족도의 상관계수 보기
cor(product$제품_적절성+product$제품_친밀도,product$제품_만족도)


#실습 (전체 변수 간의 상관계수 보기)
cor(product, method = 'pearson')

#실습 (방향성 있는 색상으로 표현)
#install.packages('corrgram')
library(corrgram)
corrgram(product)
corrgram(product, upper.panel = panel.conf)
corrgram(product, lower.panel = panel.conf)


#1단계: 패키지 설치
#install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
#2단계: 상관성, p값(*), 정규분포(모수 검정 조건) 시각화
chart.Correlation(product, histogram = , pch = '+')

cor(product, method = 'spearman')


#@@@@@@@@@@@@@@@@@@@@@@교차분석@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#파일 불러오기
getwd()
setwd("c:/Rwork/data/dataset1")
data <- read.csv('cleanDescriptive.csv', header =  T)
head(data)

#2단계: 변수 리코딩
x <- data$level2
y <- data$pass2


#3단계: 데이터프레임 생성
result <- data.frame(Level = x, Pass = y)
dim(result)

#--------------------

#1단계: 기본 함수를 이용한 교차 분할표 작성
table(result)

#2단계: 교차 분할표 작성을 위한 패키지 설치
#install.packages("gmodels")
library(gmodels)
#install.packages("ggplot2")
library(ggplot2)

#3단계: 패키지를 이용한 교차 분할표 작성
CrossTable(x = diamonds$color, y = diamonds$cut)

#실습 (패키지를 이용한 교차 분할표 작성: 부모의 학력수준과 자녀 대학 진학여부)
# 변수모델: 학력수준(독립변수)  진학여부(종속변수)
x <- data$level2
y <- data$pass2
CrossTable(x, y)

#@@@@@@@@@@@@@@@@@@@@@@@@@@@로지스틱 회귀분석
#날씨관련 요인 변수로 비 유뮤ㅣ 예측
#install.packages('ROCR')
#install.packages('lmtest')
library(car)
library(lmtest)
library(ROCR)

#1단계 : 데이터 가져오기
setwd('c:/Rwork/data/dataset4')
weather = read.csv('weather.csv', stringsAsFactors =  F)
dim(weather)
head(weather)
str(weather)

#2단계 : 변수 선택과 더미 변수 생성
weather_df <- weather[,c(-1,-6,-8,-14)];weather_df
str(weather_df)

weather_df$RainTomorrow[weather_df$RainTomorrow == 'Yes']<-1
weather_df$RainTomorrow[weather_df$RainTomorrow == 'No']<-0

weather_df$RainTomorrow <- as.numeric(weather_df$RainTomorrow)
head(weather_df)

#3단계 : 학습데이터와 검정데이터 생성 (7:3비율)hold out
idx <- sample(1:nrow(weather_df), nrow(weather_df)*0.7)
train <- weather_df[idx,]
test<- weather_df[-idx,];test

#4단계 : 로지스틱 회귀모델 생성

weather_model <- glm(RainTomorrow ~., data = train, family = 'binomial', na.action = na.omit)
weather_model
summary(weather_model)

#5단계 : 로지스틱 회귀모델 예측치 생성
pred <- predict(weather_model, newdata = test, type ='response')
pred

result_pred<-ifelse(pred >= 0.5, 1, 0)
result_pred

table(result_pred)

#6단계 : 모델평가 - 분류정확도 계산
table(result_pred, test$RainTomorrow)

#7단계 : ROC를 이용한 모델 평가

pr <- prediction(pred, test$RainTomorrow)
prf <- performance(pr, measure = 'tpr', x.maeasure = 'fpr')
plot(prf)




























