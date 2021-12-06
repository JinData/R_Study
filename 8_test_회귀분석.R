rm(list = ls())
getwd()
setwd('c:/Rwork/data/dataset1')
product<- read.csv('product.csv', header = T)
head(product)
y=product$제품_만족도#종속변수
x=product$제품_적절성#독립변수
df<- data.frame(x,y)



#선형회귀 모델 생성
result.lm<-lm(formula = y ~ x, data= df)# data =데이터 프레임


# 회귀분석의 절편과 기울기
result.lm


#모델의 적합값과 잔차 보기
names(result.lm)


#적합값 보기
fitted.values(result.lm)[1:5]


#관측값 보기
head(df, 1)


#회귀방정식을 적용하여 모델의 적합값 계산
Y = 0.7789+0.7393*4
Y

#잔차 계산
3-3.735963

#모델의 잔차 보기
residuals(result.lm)[1:2]

#모델의 잔차와 회귀방정식에 의한 적합값으로부터 관측값 계산

-0.7359630 + 3.735963

#xy 산점도
plot(formula = y~x, data =product)


# 선형 회귀모델 생성
result.lm <- lm(formula =  y~ x, data =product)


#회귀선
abline(result.lm, col = 'red')


#선형 회귀분석 결과보기
summary(result.lm)



#=============다중회기분석=====================
#변수 모델링
y = product$제품_만족도
x1 = product$제품_친밀도
x2 = product$제품_적절성
df <- data.frame(x1,x2,y)


#다중 회귀분석
result.lm <- lm(formula = y ~ x1 + x2, data = df)
result.lm


#패키지 설치
#install.packages('car')
library(car)


#분산팽창요인(VIF)
vif(result.lm)#10이상인 경우 다중 공선성 문제를 의심10이 절대값은 아님


#(다중 회귀분석 결과보기)
summary(result.lm)


#=============================다중 공선성 문제 해결과 무델 성능평가 

#패키지 설치 및 데이터 로딩
#install.packages('car')
library(car)

data(iris)
names(iris)

#iris 데이터 셋으로 다중 회귀분석
model <- lm(formula = Sepal.Length~Sepal.Width + 
              Petal.Length +Petal.Width, data = iris)
vif(model)
sqrt(vif(model))>2


# iris 변수 간의 상관계수 구하기
cor(iris[, -5])


#학습데이터와 검정데이터 표본 추출
x<- sample(1:nrow(iris), 0.7*nrow(iris))
train <- iris[x,]
test <- iris[-x,]


#변수 제거 및 다중 회귀분석
model <- lm(formula = Sepal.Length ~ Sepal.Width + Petal.Length,  data = train)
model
summary(model)




#회귀방정식을 위한 절편 기울기 보기
model

#회귀 방정식 도출 

head(train, 1)


#따라서 회귀방정식을 상이할 수 있음
Y= 2.3826 +0.5684*2.9 +0.4576 * 4.6
Y
6.6-Y


#검정데이터의 독립변수를 이용한예측치 생성
pred<- predict(model, test)
pred

#상관계수를 이용한 회귀모델 평가
cor(pred, test$Sepal.Length)
#============================================
#변수모델링
formula = Sepal.Length ~Sepal.Width + Petal.Length + Petal.Width
#회귀모델 생성
model <- lm(formula = formula, data = iris)
model
#잔차 분석
install.packages('lmtest')
library(lmtest)
dwtest(model)

#등분산성 검정 - 잔차와 적합값의 분포
plot(model, which =1)

#잔차의 정규성 검정
attributes(model)
res<- residuals(model)
shapiro.test(res)
par(mfrow = c(1,2))
hist(res, freq = F)
qqnorm(res)

#다중공선성 검사

library(car)
sqrt(vif(model))>2


#회귀모델 생성과 평가
formula = Sepal.Length ~ Sepal.Width + Petal.Length
model <- lm(formula = formula,data = iris)
summary(model)

















