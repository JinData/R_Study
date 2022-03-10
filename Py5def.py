import random

help(len)

dataset = list(range(1,6))
print(dataset)

print('len=', len(dataset))
print('sum =', sum(dataset))
print('max =', max(dataset))
print('min =', min(dataset))

import statistics
from statistics import variance, stdev

print('평균 =', statistics.mean(dataset))
print('중위수=', statistics.median(dataset))
print('표준 분산 =', variance(dataset))
print('표본 표준편차=', stdev(dataset))
# ========================================================
import builtins
dir(builtins)
# 절댓값변환
abs(-10)
# 요소가 True일때 True를 반환한다 0이나 False라면 False를 반환한다
all([1, True, 10, -15,2])
all([1, True, 0, -15.2])
all([1, False, 10, -15,2])
# 하나 이상의 요소가 True일떄 True를 반환한다
any([1, False, 10, -15,2])
any([False, 0,0])
# 10진수 정수를 2진수로 반환한다 2진수는  Ob 문자열로 시작한다
bin(10)
bin(2)
# 잘모르겟음
x=[1,2,3,4,5]
dir(x)
# 문자열수식을 인수로 받아서 계산가능하게 만듬
eval('10+20')
eval('10+20*30')
eval('20*30')+10
# 10진수 정수를 16진수로 반환한다. 16진수는 0x 문자열로 시작한다.
hex(10)
hex(15)
hex(64)
# 10진수 정수를 8진수로 반환한다. 8진수는 0o 문자열로 시작한다.
oct(10)
oct(7)
oct(8)
# character를 아스키 값으로 반환한다. 숫자영은 48, 영문자 대문자 A는 65, 영문자 소문자 a는 97이다.
ord('0')
ord('A')
ord('a')
# x에 대한 y의 제곱을 계산하여 반환한다.
pow(10,2)
pow(10,3)
# 실수를 인수로 하여 반올림을 수행하는 결과를 반환한다.
round(3.1459)
round(3.1459,3)# 뒤에있는수는 소수 몇자리까지 나타내라 이런뜻이다.
# 반복 가능한 원소들은 대상으로 오름차순 또는 내림차순 정렬한 결과를 반환한다.
sorted([3,2,1,5])
sorted([3,2,1,5], reverse= True)
# ?????잘모르겠음
zip([1,3,5],[2,4,5])
list(zip([1,3,5],[2,4,5]))
# ================사용자 정의 함수======================
def userFunc1():
    print('인수가 없는 함수')
    print('userFunc1')
userFunc1()
# 인수가 없는 경우
def userFunc2(x, y):
    print('userFunc2')
    z=x+y
    print("z=",z)
userFunc2(10, 20)
# 인수가 있는 경우
def userFunc3(x, y):
    print('userFunc3')
    tot = x + y
    sub = x - y
    mul = x * y
    div = x / y
    return  tot, sub, mul, div

x = int(input('x입력:'))
y = int(input('y입력:'))

t, s, m, d = userFunc3(x, y)
print('tot=', t)
print('sub=', s)
print('mul=', m)
print('div=', d)
# ==================================분산 표준 편차 함수 예 ===========
from statistics import mean, variance
from math import sqrt

dataset = [2,4,5,6,1,8]
def Avg(data):
    avg = mean(data)
    return  avg
print('산술평균 = ', Avg(dataset))

a = Avg(dataset)
print(a)

def var_sd(data):
    avg = Avg(data)
    diff =[(d - avg)**2 for d in data]
    var = sum(diff)/ (len(data)-1)
    sd = sqrt(var)
    return  var, sd
v,s = var_sd(dataset)
print('분산 =',v)
print('표준편차 =',s)
# ============피타고라스=================================
def pytha(s,t):
    a = s**2 -t**2
    b = 2* s * t
    c = s**2 + t**2
    print("3변의 길이:", a,b,c)
pytha(2,1)
# =============================몬테카를로===
import random
def coin(n):
    result =[]
    for i in range(n):
        r = random.randint(0,1)
        if(r ==1):
            result.append(1)
        else:
            result.append(0)
        return result
print(coin(10))


def montaCoin(n):
    cnt =0
    for i in range(n):
        cnt += coin(1)[0]
    result =cnt / n
    return result
print(montaCoin(10))
print(montaCoin(30))
print(montaCoin(100))
print(montaCoin(1000))
print(montaCoin(10000))
# =========================================================
def Func1(name, *names):
    print(name)
    print(names)

Func1('홍길동', '이순신', '유관순')

from statistics import mean, variance, stdev

def statis(func, *data):
    if func == 'avg':
        return  mean(data)
    elif func == 'var':
        return variance(data)
    elif func == 'std':
        return stdev(data)
    else:
        return 'typeError'
print('avg=',statis('avg',1,2,3,4,5))
print('var=',statis('var',1,2,3,4,5))
print('std=',statis('std',1,2,3,4,5))

def emp_func(name, age ,**other):
    print(name)
    print(age)
    print(other)

emp_func('홍길동', 35, addr= '서울시', height= 175, weight= 65)

# ====================================================================
def Adder(x, y):
    add = x+ y
    return add
print('add=', Adder(10,20))

print('add=',(lambda x,y:x+y)(10,20))
# 한줄로 표현한 함수 람다함수
# ========================================================================
x=50
def local_func(x):
    x += 50
    # return이없기떄문에
local_func(x)
print('x=', x)
# 이곳의 x는 맨위의 x가된다는 것이다

def global_func():
    global  x #x를 전역 변수로 선언한다
    x += 50

global_func()
print('x =', x)
# =========================================
def a():
    print('a 함수')
    def b():
        print('b 함수')
    return b()
b= a()
b


data= list(range(1,101))
def outer_func(data):
    dataSet = data
    def tot():
        tot_val =sum(dataSet)
        return  tot_val
    def avg(tot_val):
        avg_val = tot_val / len(dataSet)
        return  avg_val
    return tot, avg

tot, avg = outer_func(data)

tot_val = tot()
print('tot =', tot_val)
avg_val = avg(tot_val)
print('avg =', avg_val)
# ==============================================================================
from statistics import mean
from math import sqrt

data = [4,5, 3.5, 2.5, 6.3, 5.5]

def scattering_func(data):
    dataSet = data
    def avg_func():
        avg_val =mean(dataSet)
        return avg_val
    def var_func(avg):
        diff = [(data -avg) ** 2 for data in dataSet]
        #print(sum(diff))
        var_val =sum(diff) / (len(dataSet)-1)
        return var_val
    def std_func(var):
        std_val = sqrt(var)
        return std_val
    return avg_func, var_func, std_func

avg, var, std = scattering_func(data)
print('평균:', avg())
print('분산:', var(avg()))
print('표준편차:', std(var(avg())))
# 위에꺼 공부해라
# =========================확득자와 지정자======================================
def main_func(num):
    num_val = num
    def getter():
        return  num_val
    def setter(value):
        nonlocal num_val# nonlocal에대해서 알아보자
        num_val = value
    return getter, setter
getter, setter = main_func(100)
print('num =', getter())
setter(200)
print('num =', getter())
# ==================함수 장식자 ==========================
def wrap(func):
    def decorated():
        print('방가워요!')
        func()
        print('잘가요!')
    return  decorated

@wrap
def hello():
    print('hi~ ', '홍길동')
hello()
# ====================카운트 =====================================
def Counter(n):
    if n == 0:
        return 0
    else:
        Counter(n-1)
        print(n, end=" ")

print('n=0:', Counter(0))
Counter(5)
# ======================누적합============================================
def Adder(n):
    if n == 1 :
        return 1
    else :
        result = n + Adder(n-1)
        print(n, end= " ")
        return result

print('n=1:', Adder(1))
print('\nn=5:', Adder(5))




















