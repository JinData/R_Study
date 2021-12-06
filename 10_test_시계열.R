#시계열 

#비정상성 시계열을 정상성 시계열로 변경
#1단계 AirPassengers데이터 셋가져오기 
data(AirPassengers)
head(AirPassengers)
#2단계 :차분 적용 - 평균 정상화

par(mfrow = c(1,2))
ts.plot(AirPassengers)
diff <- diff(AirPassengers)#차분분
plot(diff)

#3단계 : 로그 적용 - 분산 정상화

par(mfrow = c(1,2))
plot(AirPassengers)
log <- diff(log(AirPassengers));log
plot(log)
##############################################################################

#단일 시계열 자료 시각화

data('WWWusage')
str(WWWusage)
WWWusage

#시계열 자료 추세선 시각화
#x11()#새로 창으로 화면 출력
ts.plot(WWWusage, type= 'l', col ='red')



####################################################################
#다중 시계열 자료 시각화

data(EuStockMarkets)
head(EuStockMarkets)

#데이터 프레임으로 변환
EuStock<- data.frame(EuStockMarkets);head(EuStock)
head(EuStock)

#단일 시계열 자료 추세선 시각화 (1000개 데이터 대상)

#x11()
plot(EuStock$DAX[1:1000], type= 'l', col = 'red')

#다중 시계열 자료 추세선 시각화(1000개 데이터 대상)

plot.ts(cbind(EuStock$DAX[1:1000], EuStock$SMI[1:1000]),
        main = '주가지수 추세선선')
###################################################################
#시계열 요소 분해 시각화
#시게열 자료 준비
data<- c(45,56,45,43,69,75,85,59,66,64,62,65,
         55,49,67,55,71,78,71,65,69,43,70,75,
         56,56,65,55,82,85,75,77,77,69,79,89)

length(data)

#시게열 자료 생성 - 시계열 자료 형식으로 객체 생성
tsdata<- ts(data, start =c(2016,1), frequency =  12)
tsdata

#추세선확인 - 각 요인 (추세 ,순환, 계열, 불규칙)을 시각적으로 확인

ts.plot(tsdata)

plot(stl(tsdata, "periodic"))

# 시계열 분해와 변동요인 제거
m <- decompose(tsdata)
attributes(m)
plot(m)
par(mfrow = c(1, 1))
plot(tsdata - m$seasonal)


# 추세요인과 불규칙요인 제거
plot(tsdata - m$trend)
plot(tsdata - m$seasonal - m$trend)



###################################################

#실습 (시계열 요소 분해 시각화)
#1단계: 시계열 자료 생성
input <- c(3180, 3000, 3200, 3100, 3300, 3200, 
           3400, 3550, 3200, 3400, 3300, 3700)
length(input)
tsdata <- ts(input, start = c(2015, 2), frequency = 12);tsdata


#2단계: 자기 상관 함수 시각화
acf(na.omit(tsdata), main ="자기상관함수", col = "red")


#3단계: 부분 자기 상관 함수 시각화
pacf(na.omit(tsdata), main = "부분 자기 상관 함수", col = "red")
###################################################################


#1단계: 시계열 자료 생성
input <- c(3180, 3000, 3200, 3100, 3300, 3200, 
           3400, 3550, 3200, 3400, 3300, 3700)#위에서 만듬
#2단계: 추세선 시각화
plot(tsdata, type = "l", col = "red")

#3단계: 자기 상관 함수 시각화
acf(na.omit(tsdata), main = "자기 상환함수", col = "red")

#4단계: 차분 시각화
plot(diff(tsdata, differences = 1))


#####################################################
#지수평활법 #이동 평균선
#1단계: 시계열 자료 생성
data <- c(45, 56, 45, 43, 69, 75, 58, 59, 66, 64, 62, 65, 
          55, 49, 67, 55, 71, 78, 71, 65, 69, 43, 70, 75, 
          56, 56, 65, 55, 82, 85, 75, 77, 77, 69, 79, 89)
length(data)
tsdata <- ts(data, start = c(2016, 1), frequency = 12)
tsdata
#2단계: 평활 관련 패키지 설치
#install.packages("TTR")
library(TTR)
#TTR패키지

#3단계: 이동평균법으로 평활 및 시각화
par(mfrow = c(2, 2))

plot(tsdata, main = "원 시계열 자료")
plot(SMA(tsdata, n = 1), main = "1달 단위 이동평균법으로 평활")
plot(SMA(tsdata, n = 2), main = "2달 단위 이동평균법으로 평활")
plot(SMA(tsdata, n = 3), main = "3달 단위 이동평균법으로 평활")
par(mfrow = c(1, 1))
#TTR SMA 이동평균 함수 
###################################################################
#1단계: 시계열 자료 특성분석
#1-1단계: 데이터 준비
input <- c(3180, 3000, 3200, 3100, 3300, 3200, 
           3400, 3550, 3200, 3400, 3300, 3700)

#1-2단계: 시계열 객체 생성(12개월)
tsdata <- ts(input, start = c(2015, 2), frequency = 12)
tsdata

#1-3단계: 추세선 시각화
plot(tsdata, type = "l", col = "red")


#2단계: 정상성 시계열 변환
par(mfrow = c(1, 2))
ts.plot(tsdata)
diff <- diff(tsdata)
plot(diff )

#3단계: 모델 식별과 추정
#install.packages("forecast")
library(forecast)
arima <- auto.arima(tsdata)
arima

#d=0이면, ARMA(p, q)모형이며 정상성을 만족
#p=0이면, IMA(d, q)모형이며 d번 차분하면 MA(q)모형을 따른다.
#q=0이면, ARI(p, d)모형이며, d번 차분하면 AR(p)모형을 따른다.
#4단계: 모형 생성
model <- arima(tsdata, order = c(1, 1, 0))
model

#5단계: 모형 진단(모형의 타당성 검정)
#5-1단계: 자기 상관 함수에 의한 모형 진단
tsdiag(model)

#5-2단계: Box-Ljung검정에 의한 잔차항 모형 진단
Box.test(model$residuals, lag = 1, type = "Ljung")

#6단계: 미래 예측(업무 적용)
fore <- forecast(model)
fore
par(mfrow = c(1, 2))
plot(fore)
model2 <- forecast(model, h = 6)
plot(model2)
#######################################################
#정상성 시계열의 계절형
#실습 (계절성을 갖는 정상성 시계열분석)
#1단계: 시계열 자료 특성분석
#1-1단계: 데이터 준비
data <- c(55, 56, 45, 43, 69, 75, 58, 59, 66, 64, 62, 65, 
          55, 49, 67, 55, 71, 78, 61, 65, 69, 53, 70, 75, 
          56, 56, 65, 55, 68, 80, 65, 67, 77, 69, 79, 82,
          57, 55, 63, 60, 68, 70, 58, 65, 70, 55, 65, 70)
length(data)

#1-2단계: 시계열 자료 생성
tsdata <- ts(data, start = c(2020, 1), frequency = 12)
tsdata

#1-3단계: 시계열 요소 분해 시각화
ts_feature <- stl(tsdata, s.window = "periodic")
plot(ts_feature)

#Seasonal, trend, random요소 분해 시각화를 통해 분석
#차분을 통해 비정상성 시계열을 정상성 시계열로 변환
#: 정상성 시계열 변환
par(mfrow = c(1, 2))
ts.plot(tsdata)
diff <- diff(tsdata)
plot(diff )

#3단계: 모형 식별과 추정
#install.packages('forecast')
library(forecast)
ts_model2 <- auto.arima(tsdata)
ts_model2



#4단계: 모형 생성
model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(1, 1, 0)))
model

#5단계: 모형 진단(모형 타당성 검정)
#5-1단계: 자기 상관 함수에 의한 모형 진단
tsdiag(model)

#5-2단계: Box-Ljung에 의한 잔차항 모형 진단
Box.test(model$residuals, lag = 1, type = "Ljung")

#모형 진단을 통해서 적절하나 모형으로 판단되면 이 모형으로 가까운 미래를 예측하는데 이용
#6단계: 미래 예측(업무 적용)
par(mfrow = c(1, 2))
fore <- forecast(model, h = 24)
plot(fore)
fore2 <- forecast(model, h = 6)
plot(fore2)
























