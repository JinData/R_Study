#(1) 세로 막대 차트###########################################

#1단계: 차트 작성을 위한 자료 만들기
chart_data <- c(305, 450, 320, 460, 330, 480, 380, 520)
names(chart_data) <- c("2018 1분기", "2019 1분기",
                       "2018 2분기", "2019 2분기", 
                       "2018 3분기", "2019 3분기", 
                       "2018 4분기", "2019 4분기")
str(chart_data)
chart_data

#2단계: 세로 막대 차트 그리기

barplot(chart_data, ylim = c(0, 600),
        col = rainbow(8),
        main = "2018년도 vs 2019년도 매출현항 비교")



#실습 (막대 차트의 가로축과 세로축에 레이블 추가하기)
barplot(chart_data, ylim = c(0, 600),
        ylab = "매출액(단위: 만원)",
        xlab = "년도별 분기 현황",
        col = rainbow(8),
        main= "2018년도 vs 2019년도 매출현황 비교")


#(2) 가로 막대 차트################################################

barplot(chart_data, xlim = c(0, 600), horiz = T, #horiz=T 가로 막대 차트로 변경
ylab = "매출액(단위: 만원)",
xlab = "년도별 분기 현황", 
col = rainbow(8), 
main = "2018년도 vs 2019년도 매출현항 비교")


######################################################
#(막대 차트에서 막대 사이의 간격 조정하기)
barplot(chart_data, xlim = c(0, 600), horiz = T, 
        ylab = "매출액(단위: 만원)",
        xlab = "년도별 분기 현황", 
        col = rainbow(8), space = 1, cex.names = 0.8,#space= 1, cex.names 간격 조정
        main = "2018년도 vs 2019년도 매출현항 비교")


#막대 차트에서 막대의 색상 지정)
barplot(chart_data, xlim = c(0, 600), horiz = T, 
        ylab = "매출액(단위: 만원)",
        xlab = "년도별 분기 현황", 
        space = 1, cex.names = 0.8,
        main = "2018년도 vs 2019년도 매출현항 비교",
        col = rep(c(2, 4), 4))#색상 지정 

## 실습: 막대 차트에서 색상 이름을 사용하여 막대의 색상 지정하기
barplot(chart_data, xlim = c(0, 600), horiz = T, 
        ylab = "매출액(단위: 만원)",
        xlab = "년도별 분기 현황", 
        space = 1, cex.names = 0.8,
        main = "2018년도 vs 2019년도 매출현항 비교",
        col = rep(c("red", "green"), 4))#색상 지정정


#(3) 누적 막대 차트####

#1단계: 메모리에 데이터 가져오기
data("VADeaths")
VADeaths

#2단계: VADeaths데이터 셋 구조 보기
str(VADeaths)
class(VADeaths)
mode(VADeaths)


#barplot()함수

#beside = T/F: X축 값을 측면으로 배열, F인 경우 하나의 막대에 누적
#font.main: 제목 글꼴 지정
#legend(): 범례의 위치, 이름, 글자 크기, 색상 지정
#title(): 아트 제목, 차트 글꼴 지정

#3단계 : 개별 차트와 누적 차트 그리기
par(mfrow = c(1, 1))
barplot(VADeaths, beside = T, col = rainbow(5),
        main = "미국 버지니아주 하위계층 사망비율")
legend(19, 71, c("50-54", "55-59", "60-64", "65-69", "70-74"),
       cex = 0.8, fill = rainbow(5))
barplot(VADeaths, beside = F, col = rainbow(5))#beside=F 누적 차트트
title(main = "미국 버지니아주 하위계층 사망비율", font.main = 4)
legend(3.8, 200, c("50-54", "55-59", "60-64", "65-69", "70-74"),
       cex = 0.8, fill = rainbow(5))

#par()함수: RStudio의 차트가 나타나는 영역에서 두 개 이상의 차트를 동시에 볼 수 있게함.
#‘beside= T’ 속성: 하나의 막대에 누적
#차트에 제목 넣기: main 속성을 이용 또는 title()함수 이용
#font.main속성: 차트 제목의 글꼴 유형 지

#2 점 차트 시각화###########################################################

#x: 데이터
#label: 점에 대한 설명문
#cex: 점의 확대
#pch: 점 모양
#color: 점의 색
#lcolor: 선의 색
#main: 차트 제목
#xlab: x축의 이름

#(점 차트 사용하기)
par(mfrow = c(1, 1))
dotchart(chart_data, color = c("blue", "red"),
         lcolor = "black", pch = 1:2,
         labels = names(chart_data),
         xlab = "매출액", 
         main = "분기별 판매현황: 점차트 시각화",
         cex = 1.2)

#dotchart()함수의 주요 속성: 
#col: 레이블과 점 색상 지정
#lclor: 구분선(line) 색상 지정
#pch(plotting character): 점 모양
#labels: 점에 대한 레이블 표시
#xlabs: x축 이름
#cex(character expansion): 레이블과 점의 크기 확대

# 원형 차트 시각화#########################################

#x: 데이터
#labels: 원형 차트에서 각 조각에 대한 설명문
#col: 색상
#border: 테두리 색
#lty: 선 타입
#main: 차트 제목을 지정

#(분기별 매출현황을 파이 차트로 시각화하기)
par(mfrow = c(1, 1))
pie(chart_data, labels = names(chart_data), col = rainbow(8), cex = 1.2)
title("2018~2019년도 분기별 매출현황")

#clockwise = TRUE’속성: 시계방향으로 데이터 표시. Default는 FALSE

##################################
#연속변수 시각화


#상자 그래프 시각화###############################

#1단계: ““notch=FALSE”일 때
boxplot(VADeaths, range = 0)

#2단계: ““notch=TRUE”일 때
boxplot(VADeaths, range = 0, notch = T)
abline(h = 37, lty = 3, col = "red")


# (VADeath 데이터 셋의 요약통계량 보기)
summary(VADeaths)


# 히스토그램 시각화####

#(iris 데이터 셋 가져오기)
data(iris)
names(iris)
str(iris)
head(iris)
#names() 함수: 컬럼명 보기


#(iris 데이터 셋의 꿏받침 길이(Sepal.Length) 컬럼으로 히스토그램 시각화
summary(iris$Sepal.Length)
hist(iris$Sepal.Length, xlab = "iris$Sepal.Length", col = "magenta", 
     main = "iris 꽃 받침 길이 Histogram", xlim = c(4.3, 7.9))


#xlab: x축 이름
#col: 차트 생성
#main: 차트 제목
#xlim: x축 범위


#(iris 데이터 셋의 꽃받침 너비(Sepal.Width)컬럼으로 히스토그램 시각화)
summary(iris$Sepal.Width)
hist(iris$Sepal.Width, xlab = "iris$Sepal.Width", col = "mistyrose", 
     main = "iris 꽃받침 너비 Histogram", xlim = c(2.0, 4.5))

#히스토그램에서 빈도와 밀도 표현하기####
# 1단계:빈도수에 의해서 히스토그램 그리기
par(mfrow = c(1, 2))
hist(iris$Sepal.Width, xlab = "iris$Sepal.Width", 
     col = "green", 
     main = "iris 꽃받침 너비 Histogram: 빈도수", xlim = c(2.0, 4.5))

#2단계: 확률 밀도에 의해서 히스토그램 그리기
hist(iris$Sepal.Width, xlab = "iris.$Sepal.Width", 
     col = "mistyrose", freq = F, 
     main = "iris 꽃받침 너비 Histogram: 확률 밀도", xlim = c(2.0, 4.5))

#3단계: 밀도를 기준으로 line 추가하기
lines(density(iris$Sepal.Width), col = "red")


#정규분포 추정 곡선 나타내기####

#1단계: 계급을 밀도로 표현한 히스토그램 시각화
par(mfrow = c(1, 1))
hist(iris$Sepal.Width, xlab = "iris$Sepal.Width", col = "mistyrose", 
     freq = F, main = "iris 꽃받침 너비 Histogram", xlim = c(2.0, 4.5))

#2단계: 히스토그램에 밀도를 기준으로 분포곡선 추가
lines(density(iris$Sepal.Width), col = "red")

#3단계: 히스토그램에 정규분포 추정 곡선 추가
x <- seq(2.0, 4.5, 0.1)
curve(dnorm(x, mean = mean(iris$Sepal.Width),
            sd = sd(iris$Sepal.Width)),
      col = "blue", add = T)

# 산점도 시각화####

#산점도 그래프에 대각선과 텍스트 추가하기

#1단계: 기본 산점도 시각화
price <- runif(10, min = 1, max = 100)
plot(price, col = "red")

#2단계: 대각선 추가
par(new = T)
line_chart = 1:100
plot(line_chart, type = "l", col = "red", axes = F, ann = F)

#3단계: 텍스트 추가
text(70, 80, "대각선 추가", col = "blue")

#(type속성으로 산점도 그리기)
par(mfrow = c(2, 2))
plot(price, type = "l")
plot(price, type = "o")
plot(price, type = "h")
plot(price, type = "s")


#pch속성으로 산점도 그리기####

#1단계: pch속성과 col, ces속성 사용
par(mfrow = c(2, 2))
plot(price, type = "o", pch = 5)
plot(price, type = "o", pch = 15)
plot(price, type = "o", pch = 20, col = "blue")
plot(price, type = "o", pch = 20, col = "orange", cex = 1.5)
plot(price, type = "o", pch = 20, col = "green", cex = 2.0, lwd = 3)

#2단계: lwd속성 추가 사용
par(mfrow=c(1,1))
plot(price, type="o", pch=20,
     col = "green", cex=2.0, lwd=3)


#pch속성으로 점의 모양 지정
#col속성으로 색상을 지정
#cex속성으로 점의 모양을 확대
#lwd속성으로 선의 굵기를 지정

# plot()함수의 시각화 도구 목록
methods("plot")

#method()함수에 “plot”을 넣어 plot()함수에서 제공하는 시각화 기능 확인 가능
#기능 확인해 볼 것!


# plot() 함수에서 시계열 객체 사용하여 추세선 그리기 

# 중첩 자료 시각화##########################################
# 중복된 자료의 수 만큼 점의 크기 확대하기)

#1단계: 두개의 벡터 객체 준비
x <- c(1, 2, 3, 4, 2, 4)
y <- rep( 2, 6)
x; y

#2단계: 교차테이블 작성
table(x, y)

#3단계: 산점도 시각화
plot(x, y)


#4단계: 교차테이블로 데이터프레임 생성
xy.df <- as.data.frame(table(x, y))
xy.df

#plot()함수 내 주요 속성:
#col: 점 색상
#pch: 점 모양 지정
#cex: 점 크기 확대

#5단계: 좌표에 중복된 수 만큼 점을 확대
plot(x, y, 
     pch = "@", col = "blue", cex = 0.5 * xy.df$Freq,
     xlab = "x 벡터의 원소", ylab = "y 벡터 원소")

#galton 데이터 셋을 대상으로 중복된 자료 시각화하기##

#1단계: galton 데이터 셋 가져오기
#install.packages("UsingR")
library(UsingR)
data(galton)
#데이터프레임 생성하여 중복 수 컬럼(Freq) 생성

#2단계: 교차테이블을 작성하고, 데이터프레임으로 변환
galtonData <- as.data.frame(table(galton$child, galton$parent))
head(galtonData)


#3단계: 컬럼 단위 추출
names(galtonData) = c("child", "parent", "freq")
head(galtonData)
parent <- as.numeric(galtonData$parent)
child <- as.numeric(galtonData$child)


#4단계: 점의 크기 확대


#par(mfrow = c(1, 1))
plot(parent, child, 
     pch = 21, col = "blue", bg = "green", 
     cex = 0.2 * galtonData$freq, 
     xlab = "parent", ylab = "child")
#plot()함수 내 cex속성을 이용하여 중복 자료를 시각화


# 변수간의 비교 시각화####





#변수와 변수 사이의 관계를 시각화

#(iris 데이터 셋의 4개 변수를 상호 비교####
attributes(iris)
pairs(iris[iris$Species == "virginica", 1:4])
pairs(iris[iris$Species == "setosa", 1:4])

#1단계: 3차원 산점도를 위한 scatterplot3d 패키지 설치 및 로딩
#install.packages("scatterplot3d")
library(scatterplot3d)

#2단계: 꽃의 종류별 분류
iris_setosa = iris[iris$Species == 'setosa', ]
iris_versicolor = iris[iris$Species == 'versicolor', ]
iris_virginica = iris[iris$Species == 'virginica', ]

#3단계: 3차원 틀(Frame)생성하기
d3 <- scatterplot3d(iris$Petal.Length, 
                    iris$Sepal.Length,
                    iris$Sepal.Width, 
                    type = 'n')


#4단계: 3차원 산점도 시각화
d3$points3d(iris_setosa$Petal.Length,
            iris_setosa$Sepal.Length,
            iris_setosa$Sepal.Width, 
            bg = 'orange', pch = 21)
d3$points3d(iris_versicolor$Petal.Length, 
            iris_versicolor$Sepal.Length,
            iris_versicolor$Sepal.Width,
            bg = 'blue', pch = 23)
d3$points3d(iris_virginica$Petal.Length, 
            iris_virginica$Sepal.Length,
            iris_virginica$Sepal.Width, 
            bg = 'green', pch = 25)


