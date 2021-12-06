

install.packages("dplyr")
library(dplyr)
iris %>% head()#head에 iris를 넣어서 출력
iris %>% head() %>% subset(Sepal.Length >= 5.0)#head에 iris를 넣어주고 그것을 subset에 적용함
# 1:5의 인자를 다시 쓰지 않고 사용할 수 있으며 sum 함수로 호출한다.
1:5 %>% sum(.)
# length 함수에 의해서 길이인 5까지 더해져서 20을 반환한다.
1:5 %>% sum(length(.))
# sum(length(1:5))와 같이 수열을 지정하여 반환하므로 수열의 길이인 5까지 더해서20을 반환한다.
5 %>% sum(1:.)
# { }(브레이스)를 적용하면 함수를 한 번씩만 실행한다.
5 %>% {sum(1:.)}
#+_+_+_+_+_+_+_+_+_+_+grade_csv파일없음 
setwd('c:/Rwork/data')
csvgrade <- read.csv("grade_csv.csv")
# 1부터 행의 수만큼 수열로 출력하고 나눈 나머지가 0인 행의 부분집합을 추출한다.
csvgrade %>% subset(1:nrow(.) %% 2 == 0)


#실습 (dply 패키지와 hflights 데이터 셋 설치)
install.packages(c("dplyr", "hflights"))
library(dplyr)
library(hflights)
str(hflights)

hflights_df <- tbl_df(hflights)#tbl_df()함수: 현재 R의 console창 크기에서 볼수 있는 만큼 결과를 나타내고, 나머지는
#아래에 생략된 행 수와 컬럼명 표시

hflights_df


library(dplyr)
csvgrade <-read.csv('grade_csv.csv')
str(csvgrade)
nrow(csvgrade)
csvgrade %>% filter(class == 1)#class컬럼이 1인 것만 

library(dplyr)
csvgrade <- read.csv("grade_csv.csv")
csvgrade %>% filter(class != 1)#class컬럼이 1이 아닌것만(!=not)

csvgrade %>% filter(math > 50)#math컬럼이 50초과만

csvgrade %>% filter(math < 50)#math컬럼이 50미만만

csvgrade %>% filter(eng >= 80)#eng 컬럼이 80이상만

csvgrade %>% filter(eng <= 80)#eng 컬럼이 80이하만

csvgrade %>% filter(class == 1 & math >= 50)#class컬럼이 1이고 math가 50이상만 

csvgrade %>% filter(eng < 90 | sci < 50)#eng컬럼이 90미만이거나  sci컬럼이 50미만만

csvgrade %>% filter(class == 1 | class == 3 | class == 5)#클래스가 1이거나 3이거나 5이거나

csvgrade %>% filter(class %in% c(1,3,5))#컬럼 클래스가 1,3,5 인것만

# 객체 생성
class1 <- csvgrade %>% filter(class == 1)
# class1 객체의 math 컬럼에 접근하여 평균 산출
mean(class1$math)
# class1 객체의 english 컬럼에 접근하여 평균 산출
mean(class1$eng)
# class1 객체의 science 컬럼에 접근하여 평균 산출
mean(class1$sci)



#hflights_df를 대상으로 특정일의 데이터 추출하기
filter(hflights_df, Month == 1 & DayofMonth == 2) # 1월 2일 데이터 추출
hflights_df %>% filter(Month ==1 & DayofMonth ==1)
filter(hflights_df, Month == 1 | Month == 2) # 1월 또는 2월 데이터 추출


#=======================================================
#단일 객체의 오름차순 정렬오름차순으로 데이터를 정렬하여 추출
csvgrade %>% arrange(math)#과목 math점수 오름차순으로 정렬
###########################################
csvgrade %>% arrange(desc(math))#디센딩을이용하여 내림차순으로 정렬
##########################################
csvgrade %>% arrange(class, math)#클래스와 math를 오름차순으로 

arrange(hflights_df, Year, Month, DepTime, ArrTime)#arrange(데이터, 컬럼, ....)
#= 위와 같다 파이프연산자를 활용한 
hflights_df %>% arrange(Year, Month, DepTime, AirTime) 


#=======================================================
#단일 객체를 추출하여 반환
library(dplyr)
csvgrade <- read.csv("grade_csv.csv")
csvgrade %>% select(math)#컬럼 math에 해당하는 데이터만 

csvgrade %>% select(class, math)#컬럼 class와 math에 해당하는 데이터를 추출 
#subset과다르게 간편

#------------객체 제외

csvgrade %>% select(-math)#컬럼 math에 해당하는 데이터만 빼고 모든 데이터 추출

#------------특정 객체의 값을 추출
csvgrade %>% filter(class == 1 ) %>% select(eng)#class가 1이고 eng 에 해당하는 데이터만 추출

#---------객체의 값 일부를 추출
csvgrade %>% select(id, math) %>% head(3)#상위 3개의 행의 데이터(id, math)만

select(hflights_df, Year, Month, DepTime, ArrTime)
hflights_df %>% select(hflights_df, Year, Month, DepTime, ArrTime)

#(hflights_df 대상 컬럼의 범위로 검색)
select(hflights_df, Year:ArrTime)
#제외한 나머지 컬럼만 선택하여 검색할 때
select(hflights_df, -(Year:DepTime)) 

mutate(hflights_df, gain = ArrTime - DepTime, 
       gain_per_hour = gain / (AirTime / 60))

hflights_df %>% mutate(gain = ArrDelay-DepDelay, gain_per_hour = gain / (AirTime /60))
#mutate()함수에 의해 추가된 컬럼 보기
select(mutate(hflights_df, gain = ArrDelay - DepDelay, 
              gain_per_hour = gain / (AirTime / 60)),
       Year, Month, ArrDelay, DepDelay, gain, gain_per_hour)

#======================================================
library(dplyr)
csvgrade <- read.csv("grade_csv.csv")
csvgrade %>% summarise(mean_math = mean(math))#개별 컬럼의 데이터에 대한 요약 통계량을 구할 때는
#summarise 함수를 사용한다.
csvgrade %>% summarise(mean_math = mean(math))

#hflights_df에서 비행시간의 평균 구하기
summarise(hflights_df, avgAirTime = mean(AirTime, na.rm = TRUE))
# =hflights_df %>% summarise(avgAirTime = mean(AirTime, na.rm = TRUE))

#hflights_df 의 관측치 길이 구하기
summarise(hflights_df, cnt = n(), 
          delay = mean(AirTime, na.rm = TRUE))
#도착시간(AirTime)의 표준편차와 분산 계산
summarise(hflights_df, arrTimeSd = sd(ArrTime, na.rm = TRUE),
          arrTimeVar = var(ArrTime, na.rm = T))
#==============================================================
#컬럼의 집단별 평균에 대한 요약 통계량을 반환
library(dplyr)
csvgrade <- read.csv("grade_csv.csv")
csvgrade %>% group_by(class) %>% summarise(mean_math = mean(math))

#컬럼의 집단별 다중 요약 통계량을 반환한다.
library(dplyr)
csvgrade <- read.csv("grade_csv.csv")
csvgrade %>% group_by(class) %>% summarise(mean_math = mean(math), sum_math
                                           = sum(math), median_math = median(math))

#집단변수를 이용하여 그룹화
species <- group_by(iris, Species)
str(species)
species


#조인하는 =====================================================================
###inner_join(df1, df2, x)
#left_join(df1, df2, x)
#right_join(df1, df2, x)
#full_join(df1, df2, x)

#inner join

library(dplyr)
a <- data.frame(id = c(1, 2, 3, 4, 5), score = c(60, 80, 70, 90, 85));a
b <- data.frame(id = c(3, 4 , 5, 6, 7), weight = c(80, 90, 85, 60, 85));b
# id 열을 일치하는 열만 결합한다.
merge(a, b, by="id") #merge란 병합을 의미한다.
inner_join(a, b, by = "id")#내부 조인

df1 <- data.frame(x = 1:5, y = rnorm(5))
df2 <- data.frame(x = 2:6, z = rnorm(5))

df1
df2

inner_join(df1, df2, by = 'x')

#left join
Ex.
library(dplyr)
a <- data.frame(id = c(1, 2, 3, 4, 5), score = c(60, 80, 70, 90, 85))
b <- data.frame(id = c(3, 4, 5, 6, 7), weight = c(80, 90, 85, 60, 85))
merge(a, b, by="id", all.x = T)#x=a, y=b
left_join(a, b, by = "id")

#공통변수를 이용하여 왼쪽으로 조인하기
left_join(df1, df2, by = 'x')

#right join
library(dplyr)
a <- data.frame(id = c(1, 2, 3, 4, 5), score = c(60, 80, 70, 90, 85))
b <- data.frame(id = c(3, 4, 5, 6, 7), weight = c(80, 90, 85, 60, 85))
merge(a, b, by = "id", all.y = T)
right_join(a, b, by = "id")

right_join(df1, df2, by = 'x')


#full join
library(dplyr)
a <- data.frame(id = c(1, 2, 3, 4, 5), score = c(60, 80, 70, 90, 85))
b <- data.frame(id = c(3, 4, 5, 6, 7), weight = c(80, 90, 85, 60, 85))
merge(a, b, by="id", all = T)
full_join(a, b, by = "id")#id에 모든열을 결합한다.

full_join(df1, df2, by = 'x')

#========================dataFrame 합치기
bind_rows(df1, df2)
bind_cols(df1, df2)
#세로결합
library(dplyr)
a <- data.frame(id = c(1, 2, 3, 4, 5), score = c(60, 80, 70, 90, 85))
b <- data.frame(id = c(3, 4, 5, 6, 7), weight = c(80, 90, 85, 60, 85))
# 세로로 결합한다.
bind_rows(a, b)

#두 개의 데이터프레임을 행 단위로 합치기
df1 <- data.frame(x = 1:5, y = rnorm(5))
df2 <- data.frame(x = 6:10, y = rnorm(5))
df1
df2
df_rows <- bind_rows(df1, df2)
df_rows

#세로결합
a <- data.frame(id = c(1, 2, 3, 4, 5), score = c(60, 80, 70, 90, 85))
a
b <- data.frame(id = c(6, 7 , 8), score = c(80, 90, 85))
b
rbind(a, b)

#가로 결합
df_cols <- bind_cols(df1, df2)
df_cols

#가로결합
a <- data.frame(id = c(1, 2, 3, 4, 5), score = c(60, 80, 70, 90, 85))
a
b <- data.frame(age = c(20, 19 , 20, 19, 21), weight = c(80, 90, 85, 60, 85))
b
cbind(a, b)#a, b를 묶음 id, score, age, weight컬럼을 갖는 

#a <- data.frame(id = c(1, 2, 3, 4, 5), score = c(60, 80, 70, 90, 85))
#a
#b <- data.frame(id = c(3, 4 , 5, 6, 7), weight = c(80, 90, 85, 60, 85))
#b
#cbind(a, b)

library(dplyr)
df <- data.frame(one = c(4, 3, 8))
df
df <- rename(df, "원" = one)
df
#실습 (데이터프레임의 컬럼명 수정)

df_cols <- bind_cols(df1, df2)
df_cols#기존에 코딩한 

df_rename <-rename(df_cols, x1 = x...1)
df_rename <- rename(df_rename, y2 = y...2)

df_rename

#================reshape2 패키지 활용=========================

#install.packages("reshape2")
data <- read.csv("C:/Rwork/dataset3/dataset3/data.csv")
head(data)
library(reshape2)
#복습 data.csv 데이터 셋 설명
#형식 dcast(데이터셋, 앞변수 ~뒤변수, 적용함수)
wide<- dcast(data, Customer_ID ~ Date, sum)
wide

setwd('C:/Rwork/')
write.csv(wide, "wide.csv", row.names = FALSE)

wide <- read.csv("wide.csv")
colnames(wide) <- c('Customer_ID', 'day1', 'day2', 'day3',
                    'day4', 'day5', 'day6', 'day7')
wide

long <- melt(wide, id = "Customer_ID")#데이터를 긴 형식으로 변경
long

name <- c("Customer_ID", "Date","Buy")#컬럼명 변경
colnames(long) <- name
head(long)



data("smiths")
smiths

long <- melt(id = 1:2, smiths)
long#넓은 형식의 smiths 데이터 셋을 긴 형식으로 변경


dcast(long, subject + time ~ ...)#긴 형식을 넓은 형식으로 변경하기
#subject와 time컬럼 기준: subject+time ~

#dcast()함수: 데이터프레임 형식으로 구조를 변경
#acast()함수: 3차원 구조를 갖는 배열형태로 변경
# airquality 데이터셋 가져오기
data('airquality')
str(airquality)
airquality

# 컬럼제목을 대문자로 일괄 변경
names(airquality) <- toupper(names(airquality))
head(airquality)

air_melt <- melt(airquality, id = c("MONTH", "DAY"), na.rm = TRUE)
head(air_melt)

#3차원 구조로 변경
names(air_melt) <- tolower(names(air_melt))
acast <- acast(air_melt, day ~ month ~ variable)
acast
class(acast)

# 집합함수 적용하기
acast(air_melt, month ~ variable, sum, margins = TRUE)




