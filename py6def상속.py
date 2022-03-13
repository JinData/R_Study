# 함수와 클래스

def calc_func(a,b):
    x= a
    y= b
    def plus():
        p=x+y
        return p

    def minus():
        m=x-y
        return m
    return plus, minus

p,m = calc_func(10, 20)
print('plus =', p())
print('minus=', m())


class calc_class:
    x= y = 0

    def __init__(self, a, b):
        self.x = a
        self.y = b

    def plus(self):
        p=self.x + self.y
        return p

    def minus(self):
        m = self.x -self.y
        return m

obj = calc_class(10, 20)

print('plus=', obj.plus())
print('minus=', obj.minus())

# ===========================================================
class Car:
    cc= 0
    door = 0
    carType = None#문자를 넣을려고 하는 거라고한다.
    # 맴버 변수

    def __init__(self, cc, door, carType):
        self.cc = cc
        self.door = door
        self.carType = carType
        # 맴버 변수 초기화
    def display(self):
        print('자동차 %d cc이고, 문짝은 %d개, 타입은 %s'%(self.cc, self.door, self.carType))

car1 = Car(2000, 4, '승용차')#객체 생성 + 초기화
car2 = Car(3000, 5, 'suv')

car1.display()#맴버 호출
car2.display()
# ==================생성자 예======================================
class multiply:
    x=y=0
    def __init__(self, x,y):
        self.x = x
        self.y = y

    def mul(self):
        return self.x*self.y

obj = multiply(10,20)
print('곱셈=', obj.mul())
# -----------------------------
class multiply2:
    x=y=0
    def __init__(self):
        pass
    # 생성자 없음
    def data(self,x,y):
        self.x =x
        self.y =y
         # 맴버변수 초기화
    def mul(self):
        return self.x*self.y

obj = multiply2()
obj.data(10,20)
print('곱셈=', obj.mul())
# ===============생성자===========================
class multiply3:
    def data(self, x, y):
        self.x = x
        self.y = y

    def mul(self):
        result =self.x *self.y
        self.display(result)

    def display(self, result):
        print('곱셈=%d'%(result))

obj = multiply3()
obj.data(10,20)
obj.mul()
# ==============클래스 맴버의 예=====================================
class DatePro:
    content = '날짜 처리 클래스'

    def __init__(self, year, month, day):
        self.year = year
        self.month = month
        self.day = day

    def display(self):
        print('%d-%d-%d'%(self.year,self.month,self.day))

    @classmethod
    def data_string(cls, dateStr):
        year=dateStr[:4]
        month=dateStr[4:6]
        day=dateStr[6:]
        print(f"{year}년 {month}월 {day}일")

date = DatePro(1995, 10, 25)
print(date.content)
print(date.year)
date.display()
print(DatePro.content)
DatePro.data_string('19951025')#이거 잘안댐



# ==============캡슐화========================
class Account:
    __balance = 0
    __accName = None
    __accNo = None

    def __init__(self, bal, name, no):
        self.__balance = bal
        self.__accName = name
        self.__accNo = no

    def getBalance(self):
        return self.__balance, self.__accName, self.__accNo

    def deposit(self, money):
        if money <0:
            print('금액확인')
            return
        self.__balance += money


    def withdraw(self, money):
        if self.__balance < money:
            print('잔액부족')
            return
        self.__balance -= money

acc= Account(1000, '홍길동', '124-152-4125-41')

acc.__balance#오류
bal = acc.getBalance()
print('계좌정보:',bal)

acc.deposit(10000)
bal = acc.getBalance()
print('계좌정보:', bal)

# acc.withdraw(500)
# bal = acc.getBalance()
# print('계좌정보:', bal)
# ========================상속예=================
class Super:
    def __init__(self, name, age):
        self.name = name
        self.age = age
# 공통으로 사용하는 맴버
    def display(self):
        print('name: %s, age:%d'%(self.name, self.age))
sup=Super('부모',55)
sup.display()

class Sub(Super):#상속한 모습
    gender =None

    def __init__(self, name, age, gender):
        Super.__init__(self,name,age) #부모클래스에서 상속받은 것들이다
        # self.name =name
        # self.age= age
        self.gender= gender

    def display(self):
        print('name : %s, age: %d gender: %s'%(self.name, self.age, self.gender))

sub = Sub('자식',25, '여자')
sub.display()

# =====================Super의 예===========================================
class Parent:
    def __init__(self, name, job):#1번
        self.name= name
        self.job = job

    def display(self):
        print('name: {}, job: {}'.format(self.name, self.job))

p =Parent('홍길동', '회사원')
p.display()

class Children(Parent):
    def __init__(self, name, job, gender):
        super().__init__(name, job)#1번의 맴버 변수를 가져온다
        #Parent.__init__(self,name, job) 이것을 써도 똑같이 작동된다 다만 이것은 self를 기제해줘야 정상작동한다.
        self.gender = gender#그래서 Children의 맴버 변수만 초기화한다

    def display(self):
        print('name: {}, job: {}, gender:{}'.format(self.name, self.job, self.gender))


chil=Children('이순신','해군장군','남자')
chil.display()
# =============================매소드 재정의 예================================
class Employee:
    name = None
    pay =0

    def __init__(self, name):
        self.name = name

    def pay_calc(self):
        pass

class Permanent(Employee):
    def __init__(self, name):
        super().__init__(name)

    def pay_calc(self, base, bonus):
        self.pay = base + bonus
        print('총 수령액:',format(self.pay,'3,d'),'원')

class Temporary(Employee):
    def __init__(self, name):
        super().__init__(name)

    def pay_calc(self, tpay, time):
        self.pay = tpay*time
        print('총 수령액: ',format(self.pay, '3,d'), '원')#.으로 바꿈

p= Permanent('이순신')
p.pay_calc(3000000, 200000)
t= Temporary('홍길동')
t.pay_calc(15000, 80)
# ===========================다형성 예===================================

class Flight:

    def fly(self):
        print('날다, fly 원형 메소드')

class Airplane(Flight):

    def fly(self):
        print('비행기가 날다.')

class Bird(Flight):

    def fly(self):
        print('새가 날다.')

class PaperAirplane(Flight):

    def fly(self):
        print('종이 비행기 날다.')

flight= Flight()
air = Airplane()
bird = Bird()
paper = PaperAirplane()

flight.fly()

flight=air
flight.fly()

flight=bird
flight.fly()

flight=paper
flight.fly()
# ================내장클래스==============================
lst = [1,3,5]
for i, c in enumerate(lst):#for문의 첫번째 변수를 인덱스로둔다 따라서 i는 인덱스이다
    print('색인:', i, end=',')
    print('내용:', c)

dit = {'name':'홍길동', 'job' :'회사원', 'addr': '서울시'}
for i, k in enumerate(dit):#위의 설명과 같이 첫번째변수 i는 인덱스 k는 내용을 갖는다.
    print('순서:', i, end=',')#인덱스 0의 키값의 내용물을보여준다.
    print('키:',k, end=',')#
    print('값:', dit[k])
# ===================import 모듈 내장클래스 예=================================
import datetime
from datetime import date, time

# help(date)

today= date(2019,10,23)
print(today)

print(today.year)
print(today.month)
print(today.day)

w=today.weekday()
print('요일정보:', w)

# help(time)

currTime = time(21,4,30)
print(currTime)

print(currTime.hour)
print(currTime.minute)
print(currTime.second)

isoTime = currTime.isoformat()
print(isoTime)

# ===============sattering 모듈 내용==============================

# from statistics import mean
# from math import sqrt
#
# def Avg(data):
#     avg = mean(data)
#     return avg
#
# def var_sd(data):
#     avg = Avg(data)
#     diff=[(d-avg)**2for d in data]
#     var = sum(diff)/(len(data)-1)
#     sd =sqrt(var)
#     return  var, sd

# ===============위에랑 이어지는 =================
import chapter06.myPackage.scattering

data = [1,3,1.5,2,1,3.2]
print('평균:',chapter06.myPackage.scattering.Avg(data))

var, sd = chapter06.myPackage.scattering.var_sd(data)
print('분산:', var)
print('표준편차:', sd)
# 또는
# -------------------------------------------------------------

from chapter06.myPackage.scattering import Avg, var_sd

print('평균:', Avg(data))

var, sd = var_sd(data)
print('분산:', var)
print('표준편차:', sd)
# 으로 표현할 수 있다
# =========================프로그램 시작점 만들기예=================================
from statistics import mean
from math import sqrt

def Avg(data):
    avg =mean(data)
    return avg
def var_sd(data):
    avg = Avg(data)
    diff = [(d - avg)** 2 for d in data]

    var = sum(diff)/(len(data) -1)
    sd = sqrt(var)
    return  var, sd

if __name__ =='__main__':
    data = [1,3,5,7]
    print('평균=', Avg(data))
    var,sd, =var_sd(data)
    print('분산 =',var)
    print('표준편차 =', sd)
# =============프로그램 시작점이 없는 경우 예==================
from statistics import mean
from math import sqrt

def Avg(data):
    avg = mean(data)
    return avg

def var_sd(data):
    avg = Avg(data)
    diff = [(d -avg)**2 for d in data]
    var = sum(diff)/(len(data)-1)
    sd = sqrt(var)

    return var, sd
data=[1,3,5,7]
print('평균 =',Avg(data))
var, sd = var_sd(data)
print('분산 = ', var)
print('표준편차 =', sd)
# ==================scattering 모듈 import예=======================
import chapter06.myPackage.scattering

# ===================================================6장 끝






