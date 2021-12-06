####앙상블#####################################
###배깅

#install.packages("party")
#install.packages("caret")
library(party) 
library(caret) 
# data sampling
data1 <- iris[sample(1:nrow(iris), replace=T),] 
data2 <- iris[sample(1:nrow(iris), replace=T),]
data3 <- iris[sample(1:nrow(iris), replace=T),]
data4 <- iris[sample(1:nrow(iris), replace=T),]
data5 <- iris[sample(1:nrow(iris), replace=T),]
# 예측모형 생성
citree1 <- ctree(Species~., data1) 
citree2 <- ctree(Species~., data2)
citree3 <- ctree(Species~., data3)
citree4 <- ctree(Species~., data4)
citree5 <- ctree(Species~., data5)
# 예측수행
predicted1 <- predict(citree1, iris)
predicted2 <- predict(citree2, iris)
predicted3 <- predict(citree3, iris)
predicted4 <- predict(citree4, iris)
predicted5 <- predict(citree5, iris)
# 예측모형 결합하여 새로운 예측모형 생성
newmodel <- data.frame(Species=iris$Species, 
                       predicted1,predicted2,predicted3,predicted4,predicted5)
head(newmodel)
newmodel
# 최종모형으로 통합
funcValue <- function(x) { 
  result <- NULL
  for(i in 1:nrow(x)) {
    xtab <- table(t(x[i,]))
    rvalue <- names(sort(xtab, decreasing = T) [1])
    result <- c(result,rvalue)
  }
  return (result)
}
newmodel
# 최종 모형의 2번째에서 6번째를 통합하여 최종 결과 생성
newmodel$result <- funcValue(newmodel[, 2:6])
newmodel$result
# 최종결과 비교
table(newmodel$result, newmodel$Species)
##########################################################
## {adabag} 패키지 이용
#==================
install.packages("adabag")
library(adabag)
data("iris")
iris.bagging <- bagging(Species~., data=iris, mfinal=10)
# mfinal= 반복수 또는 트리의 수(디폴트=100)
iris.bagging$importance # 변수의 상대적인 중요도
# 변수의 중요도는 각 tree 에서 변수에 의해 주어지는
# 지니지수의 이익(gain, 불확실성이 감소량)을 고려한 측도
#windows()
plot(iris.bagging$trees[[10]])
text(iris.bagging$trees[[10]])
#
pred <- predict(iris.bagging, newdata=iris)

pred
table(pred$class, iris[,5])
#========================


##부스팅###################################################################
#실습
#================
library(adabag)
data(iris)
boo.adabag <- boosting(Species~., data=iris, boos=TRUE, mfinal=10)
boo.adabag$importance
#windows()
plot(boo.adabag$trees[[10]])
text(boo.adabag$trees[[10]])
pred <- predict(boo.adabag, newdata=iris)
tb <- table(pred$class, iris[,5])
tb
error.rpart <- 1-(sum(diag(tb))/sum(tb))
error.rpart
#=====================
  



######랜덤포레스트(Random Forest)#################################
head(iris) 
# 70% training데이터, 30% testing데이터로 구분
idx <- sample(2, nrow(iris), replace=T, prob=c(0.7, 0.3)) 
trData <- iris[idx == 1, ] 
nrow(trData)
teData <- iris[idx == 2, ] 
nrow(teData)

#install.packages('randomForest')
library(randomForest) 

# 랜덤포레스트 실행 (100개의 tree를 다양한 방법(proximity=T)으로 생성)
RFmodel <- randomForest(Species~., data=trData, ntree=100, proximity=T)
RFmodel

# 시각화
plot(RFmodel, main="RandomForest Model of iris")
# 모델에 사용된 변수 중 중요한 것 확인
importance(RFmodel)
# 중요한 것 시각화
varImpPlot(RFmodel)
# 실제값과 예측값 비교
table(trData$Species, predict(RFmodel)) 
# 테스트데이터로 예측
pred <- predict(RFmodel, newdata=teData) 
# 실제값과 예측값 비교
table(teData$Species, pred)
# 시각화
plot(margin(RFmodel, teData$Species))

##################################################
#1단계: 패키지 설치 및 데이터 셋 가져오기
#install.packages("randomForest")
library(randomForest)
data(iris)
#randomForest 패키지

#2단계: 랜덤 포레스트 모델 생성
model <- randomForest(Species ~ ., data = iris)
model

#‘Number of trees: 500’: 학습데이터로 500개의 포레스트(Forest)가 복원 추출방식으로 생성
#‘No. of variables tried at each split: 2’: 두 개의 변수 이용하여 트리의 자식 노드가 분류되었다는 의미

#실습 (파라미터 조정 – 트리 개수 300개, 변수 개수 4개 지정)
model2 <- randomForest(Species ~ ., data = iris,
                       ntree = 300, mtry = 4, na.action = na.omit)
model2
#na.action속성: NA 처리 방법 지정. 여기서는 na.omit로 속성을 지정하여 NA 제거

#실습 (중요 변수를 생성하여 랜덤 포레스트 모델 생성)
#1단계: 중요 변수로 랜덤포레스트 모델 생성
model3 <- randomForest(Species ~ ., data = iris,
                       importance = T, na.action = na.omit)


#2단계: 중요 변수 보기
importance(model3)
#importance()함수: 분류모델을 생성하는 과정에서 입력 변수 중 가장 중요한 변수가 어떤
#변수인가를 알려주는 역할

#3단계: 중요 변수 시각화
varImpPlot(model3)
#############################################################
# {rpart}의 stagec data set 이용 RandomForest 기법 적용
library(rpart)
data("stagec")
str(stagec)
# 결측치 제거

stagec1<- subset(stagec, !is.na(g2))
stagec2<- subset(stagec1, !is.na(gleason))
stagec3<- subset(stagec2, !is.na(eet))
str(stagec3)
set.seed(1234)
ind <- sample(2, nrow(stagec3), replace=TRUE, prob=c(0.7, 0.3))###################################################
ind
trainData <- stagec3[ind==1, ] # n=102개
testData <- stagec3[ind==2, ] # n=32개
library(randomForest)
rf <- randomForest(ploidy ~ ., data=trainData, ntree=100, proximity=T) 
# 반응변수는 상동염색체수(예측변수는 7개임)
# proximity=TRUE는 개체들 간의 근접도 행렬을 제공: 
# 동일한 최종노드에 포함되는 빈도에 기초함
table(predict(rf ), trainData$ploidy)
# 트리 수에 따른 종속변수의 범주별 오분류율
print(rf)

# 변수의 중요도 측정
importance(rf )
varImpPlot(rf)
# 테스트 자료에 대한 예측
rf.pred <- predict(rf, newdata=testData)
table(rf.pred, testData$ploidy)
#==================================
  


###############################################
#더 알아보기 (엔트로피(Entropy): 불확실성 척도)
#x1 <- 0.5; x2 <- 0.5 
#e1 <- -x1 * log2(x1) - x2 * log2(x2)
#e1
#x1 <- 0.7; x2 <- 0.3 
#e2 <- -x1 * log2(x1) - x2 * log2(x2)
#e2
#엔트로피가 작으면 불확실성이 낮아진다.
#불확실성이 낮아지면 그만큼 분류정확도가 향상된다고 볼 수 있다.
###############################################
#실습 (최적의 파라미터(ntree, mtry)찾기)
#1단계: 속성값 생성
ntree <- c(400, 500, 600)
mtry <- c(2:4)
param <- data.frame(n = ntree, m = mtry)
param
#2단계: 이중 for()함수를 이용하여 모델 생성
for(i in param$n) {
  cat('ntree =', i, '\n')
  for(j in param$m) {
    cat('mtry =', j, '\n')
    model_iris <- randomForest(Species ~ ., data = iris,
                               ntree = i, mtry = j, na.action = na.omit)
    print(model_iris)
  }
}
#9개의 모델이 생성된 결과에서 오차 비율(OOB(Out of Bag) estimate of error rate)을 비교하여
#최적의 트리와 변수 결정

