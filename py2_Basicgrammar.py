
####기본 출력
var1 = 'hello python'
print(var1)
print(id(var1))
 #id
var1 = 100
print(var1)
print(id(var1))


var2 = 150.23
print(var2)
print(id(var2))

var3 = True
print(var3)
print(id(var3))

import keyword
python_keyword = keyword.kwlist
print(python_keyword)

var1 = 'hello python'
print(var1)
print(type(var1))

var1 = 100
print(var1)
print(type(var1))

var2=150.25
print(type(var2))

var3 = True
print(type(var3))#type은 자료형을 알아보는 함수이다

a = int( 10.5)
b= int( 20.42)
add= a+b
print('add=', add)

a=float(10)
b=float(20)
add2= a+b
print('add=', add2)
print(int(True))
print(int(False))
st='10'
print(int(st)**2)
#** == ^


#연산과 출력
num1= 100
num2= 20
add= num1+num2
print('add=', add)
sub=num1 -num2
print(sub)
mul=num1*num2
print(mul)
div=num1/num2
print(div)
div2=num1%num2
print(div2)
square=num1**2
print(square)

#논리연산 과 출력
bool_result=num1==num2
print(bool_result)
bool_result=num1!=num2
print(bool_result)


bool_result=num1>num2
print(bool_result)
bool_result=num1>=num2
print(bool_result)
bool_result=num1<num2
print(bool_result)
bool_result=num1<=num2
print(bool_result)


log_result= num1>=50and num2<=10
print(log_result)

log_result= num1>=50 or num2<=10
print(log_result)

log_result= num1>=50
print(log_result)

log_result= not(num1>=50)
print(log_result)


i = tot = 10
i+= 1
tot +=i
print(i, tot)
#i+=1 same i =i +1

print('출력1', end=',')
print('출력')
v1, v2 = 100, 200
#end=',' 구분자역할할v2, v1 = v1,v2
print(v1,v2)

lst = [1,2,3,4,5]
v1, *v2= lst
print(v1,v2)
#*v2묶는다는개념
*v1, v2 = lst
print(v1,v2)


#입출력
num = input('숫자입력:')
print('num type:', type(num))
print('num=', num)
print('num =', num*2)


num1 = int(input('숫자입력:'))
print('num1 =', num1*2)

num2=float(input('숫자입력:'))
result = num1 + num2
print("result =", result)

print('value =', 10+20+30+40+50)

print('010', '1234','5678', sep='-')

print('value=', 10, end = ',')
print('value=', 20)

print('원주율=', format(3.14159, '8.3f'))#소수자리가 3개
print('금액=', format(10000, '10d'))
print('금액=', format(125000, '3,d'))#d 정수

name = '홍길동'
age= 35
price = 125.456
print('이름: %s, 나이: %d, data = %.2f' %(name, age, price))

print('이름 : {}, 나이:{}, data={}'.format(name, age, price))
print('이름 : {1}, 나이:{0}, data={2}'.format(name, age, price))
#{}는 format의 인덱스

uid= input('id input:')
query= f'select*from member where uid = {uid}'
print(query)

oneline = 'this is one line string'
print(oneline)

multiLine= """this is
multi line
string"""
print(multiLine)
#여러줄을 할 때 삼중 따옴표
multiLine2='this is \nmulti line \nstring'
print(multiLine2)
#\n 은 R 과 동일하게 적용한다

string = "PYTHON"
print(string[0])
print(string[5])
print(string[-1])
print(string[-6])

print("python"+"program")
print("python-"+str(3.7)+".exe")

print('-'*30)


print(oneline)
print('문자열길이:', len(oneline))
print(oneline[0:4])
print(oneline[:4])
print(oneline[:])
print(oneline[::2])

print(oneline[0:-1:2])
#맨끝에 해당하는 인덱스는 찍지않음
print(oneline[-6:-1])
print(oneline[-6:])
#
subString = oneline
print(subString)
#================================================
oneline = 'this is one line string'
print('t 글자수 :', oneline.count('t'))

print(oneline.startswith('this'))
print(oneline.startswith('that'))

print(oneline.replace('this','that'))

multiLine= """this is 
muti line
string"""
sent = multiLine.split('\n')
print('문장:', sent)

words =oneline.split(' ')
print('단어:', words)

sent2= ','.join(words)
print(sent2)

#=============================================
print('escape 문자차단')
print('\n출력 이스케이프 문자')

print('\\n출력 이스케ㅔ이프 기능 차단1')
print(r'\n출력 이스케ㅔ이프 기능 차단2')

print('path =', 'C:\Python\test')
print('path =', 'C:\\Python\\test')
print('path =', r'C:\Python\test')















