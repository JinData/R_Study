###인공 신경망########


#1단계: 패키지 설치
install.packages("nnet")
library(nnet)


#2단계: 데이터 셋 생성
df = data.frame( # 데이터프레임 생성 - 입력 변수(x)와 출력변수(y)
  x2 = c(1:6),
  x1 = c(6:1),
  y = factor(c('no', 'no', 'no', 'yes', 'yes', 'yes'))
)
str(df )


#3단계: 인공신경망 모델 생성
model_net = nnet(y ~ ., df, size = 1)
#nnet()함수
#where size: 은닉층의 수

#4단계: 모델 결과 변수 보기
model_net

#5단계: 가중치(weights)보기
summary(model_net)

#6단계: 분류모델의 적합값 보기
model_net$fitted.values

#7단계: 분류모델의 예측치 생성과 분류 정확도
p <- predict(model_net, df, type = "class")
table(p, df$y)


######(iris 데이터 셋을 이용한 인공신경망 모델 생성)##########################################

#1단계: 데이터 생성
data(iris)
idx = sample(1:nrow(iris), 0.7 * nrow(iris))
training = iris[idx, ]
testing = iris[-idx, ]
nrow(training)
nrow(testing)


#2단계: 인공신경망 모델(은닉층 1개와 은닉층 3개) 생성
model_net_iris1 = nnet(Species ~ ., training, size = 1)


#model_net_iris1
model_net_iris3 = nnet(Species ~ ., training, size = 3)
model_net_iris3

#3단계: 가중치 네트워크 보기 – 은닉층 1개 신경망 모델
summary(model_net_iris1)


#4단계: 가중치 네트워크 보기 – 은닉층 3개 신경망 모델
summary(model_net_iris3)

#5단계: 분류모델 평가
table(predict(model_net_iris1, testing, type = "class"), testing$Species)
table(predict(model_net_iris3, testing, type = "class"), testing$Species)

#####실습 (neuralnet패키지를 이용한 인공신경망 모델 생성)##############################################

#neuralnet()함수
#형식: neuralnet(formula, data, hidden = 1, threshold = 0.01, stepmax = 1e+05, rep = 1, startweights 
#              = NULL, learningrate.limit = NULL, algorithm = "rprop+")
#where
#formula: y ~ x형식으로 반응변수와 설명변수 식
#data: 모델 생성에 사용될 데이터 셋
#hidden = 1: 은닉층(hidden layer)의 수 지정
#threshold = 0.01: 경계값 지정
#stepmax = 1e+05: 인공신경망 학습을 위한 최대 스텝 지정
#rep = 1: 인공신경마의 학습을 위한 반복 수 지정
#startweights = NULL: 랜덤으로 초기화된 가중치를 직접 지정
#learningrate.limit = NULL: backpropagation 알고리즘에서 사용될 학습비율을 지정
#algorithm = "rprop+": backpropagation과 같은 알고리즘 적용을 위한 속성


#1단계: 패키지 설치
#install.packages("neuralnet")
library(neuralnet)

#2단계: 데이터 셋 생성
data("iris")
idx = sample(1:nrow(iris), 0.7 * nrow(iris))
training_iris = iris[idx, ]
testing_iris = iris[-idx, ]
dim(training_iris)
dim(testing_iris)

#3단계: 수치형으로 컬럼 생성
training_iris$Species2[training_iris$Species == 'setosa'] <- 1
training_iris$Species2[training_iris$Species == 'versicolor'] <- 2
training_iris$Species2[training_iris$Species == 'virginica'] <- 3
training_iris$Species <- NULL
head(training_iris)
testing_iris$Species2[testing_iris$Species == 'setosa'] <- 1
testing_iris$Species2[testing_iris$Species == 'versicolor'] <- 2
testing_iris$Species2[testing_iris$Species == 'virginica'] <- 3
testing_iris$Species <- NULL
head(testing_iris)


#4단계: 데이터 정규화
#4-1단계: 정규화 함수 정의#%^%^%^%^%^%^%^%^%
normal <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

#4-2단계: 정규화 함수를 이용하여 학습데이터/검정데이터 정규화
training_nor <- as.data.frame(lapply(training_iris, normal))#lapply list 변환
summary(training_nor)
testing_nor <- as.data.frame(lapply(testing_iris, normal))
summary(testing_nor)

#5단계: 인공신경망 모델 생성 – 은닉 노드 1개
model_net = neuralnet(Species2 ~ Sepal.Length + Sepal.Width + 
                        Petal.Length + Petal.Width,
                      data = training_nor, hidden = c(1))
model_net
plot(model_net)

#6단계: 분류모델 성능 평가
#6-1단계: 모델의 예측치 생성 – compute()함수 이용
model_result <- compute(model_net, testing_nor[c(1:4)])
model_result$net.result

#6-2단계: 상관관계 분석 – 상관계수로 두 변수 간 선형관계의 강도 측정
cor(model_result$net.result, testing_nor$Species2)


#7단계: 분류모델 성능 향상 – 은닉층 노드 2개 지정, backprop속성 적용
#7-1단계: 인공신경망 모델 생성
model_net2 = neuralnet(Species2 ~ Sepal.Length + Sepal.Width +
                         Petal.Length + Petal.Width, 
                       data = training_nor, hidden = 2, 
                       algorithm = "backprop", learningrate = 0.01)

#7-2단계: 분류모델 예측치 생성과 평가
model_result <- compute(model_net, testing_nor[c(1:4)])
cor(model_result$net.result, testing_nor$Species2)
#Neuralnet()함수 내 lerningrate 속성은 역전파 알고리즘을 적용할 경우 학습비율을 지정하는 속성


