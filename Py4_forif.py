


str_var = str(object='string')
print(str_var)
print(type(str_var))
print(str_var[0])
print(str_var[-1])

str_var2 = 'string'
print(str_var2)
print(type(str_var2))
print(str_var2[0])
print(str_var2[-2])

lst = [1,2,3,4,5]
print(lst)
print(type(lst))

for i in lst:
    print(lst[:i])


x = list(range(1,11))
print(x)
print(x[:5])
print(x[-5:])
print('index 2씩 증가')
print(x[::2])
print(x[1::2])
#==============================================
a = ['a', 'b', 'c']
print(a)

b = [10, 20, a, 5, True, '문자열']
print(b[0])
print(b[2])
print(b[2][2])
print(b[2][1:])
#===================================================
num = ['one', 'two', 'three', 'four']
print(num)
print(len(num))#length줌말로 길이를 알려줌

num.append('five')#num list에 five를 추가하라는 함수이다
print(num)
num.remove('five')#num list에 five를 삭제하라는 함수이다
print(num)

num[3]="4"
print(num)
# insert끼워넣다
num.insert(0, 'zero')#0자리에 zero를 추가하라는 함수 이를 삽입이라고 한다 위치를 넣을 수 있다
print(num)

num.insert(4, 'four')#기존 4에 있던 원소가 뒤로 밀리고 기제된다
print(num)
#=====================================================
x= [1,2,3,4]
y= [1.5, 2.5]
z=x+y
print(z)
#extend expand 확장하다
x.extend(y)
print(x)

x.append(y)#x리스트 안에 리스트가 들어가는 함수
print(x)

lst = [1,2,3,4]
result = lst *2
print(result)
#========================================================
print(result)
result.sort()#오름차순으로 정렬하는 메소드
print(result)
result.sort(reverse=True)#내림차순으로 하는 매소드 recerse 뒤집다
print(result)

import random
r = []

for i in range(5):
    r.append(random.randint(1,5))
print(r)

if 4 in r:
    print('있음')
else:
    print('없음')
#==============================================
x=[2,4,1,5,7]
print(x**2)#에러가 뜨면 맞는거임

lst = [ i**2 for i in x]
print(lst)

num = list(range(1,11))
print(num)
lst2 = [i*2 for i in num if i % 2 ==0]
print(lst2)
#=========================================================
t = (1,)
print(type(t))

t2=(1,2,3,4,5,3)
print(t2)
print(type(t2))

t3 = 1,2,3,4
print(t3)
print(type(t3))


print(t2[0], t2[1:4], t2[-1])

# t2[0]=5 #튜플은 추가 삭제 삽입 안됨
print(t2)
for i in t2:
     print(i, end= ' ')

if 6 in t2:
    print('6 있음')
else:
    print('6 없음')

t4= 1,9,4,3
print(type(t4))
print(t4[0], t4[3], t4[2], t4[1])
print(t4[1:3])

#======================================================
# 튜플은 리스트에 비해 지워야 하는 함수가 적다
lst = list(range(1,6))
print(lst)
t3 = tuple(lst)
print(t3)
print(type(t3))
print(len(t3), type(t3))
t4= 1,2,2,3,3,3,
print(t4.count(3))
# 3이 3개 있으니 3이라고 출력된다
print(t3.index(4))
# t3에 4가 3번째 자리에 있기 때문에 3이 출력된다
# ======================================================================
# 셋 객체는 중복불가이다
# 인덱스 사용불가
s = {1,3,5,3,1}
print(len(s))
# 중복된 수는하나만 카운트한다
print(s)

for d in s:
    print(d, end=' ')
print()
# 순서 상관없이 오름차순으로 표기한다
s2 = {3,6}
print(s.union(s2))
# 합집합
print(s.difference(s2))
# 차집합
print(s.intersection(s2))
# 교집합
s3 ={1,3,5}

print(s)

s3.add(7)
print(s3)
s3.discard(3)
print(s3)
s3.remove(5)
print(s3)
# remove와 discard 같이 사용항
# =======================================================

gender = ['남', '여', '여', '남']
print(gender)
sgender = set(gender)
# 셋으로 변환 한다
print(sgender)
print(type(sgender))
lgender= list(sgender)
# 리스트로 변환한다
print(lgender)
print(type(lgender))
print(lgender[1])
# ==============================================================
# dic는 dictionary의 약자이다
# 키와 벨류는 붙어다닌다 -셋과 다른점
# 인덱스는 없지만 키를 인덱스 역할로 대체할 수 있다

dic =dict(key1 = 100, key= 200, key3= 300)
print(dic)

person = {'name':'홍길동', 'age':35, 'address':'서울시'}
print(person)
print(person['name'])#인덱스는 못쓰지만 키를 사용하여 불러올 수 있다
print(type(dic), type(person))

a=list(person)
print(a)
# 딕트를 리스트화하면 키값만 리스트화 된다
person['age']= 45
print(person)

del person['address']
print(person)
# address가 통째로 없어짐

person['pay']=350
print(person)
# 키와 벨류를 한꺼번에 생성한다
# =======================================================
# 요소검사
print(person['age'])
# 벨류로는 지정해서 출력을 할 수 없다 중복이 가능하기에
print('age'in person)
# person안에 age가 있냐 라고 물어보는거임
print('height'in person)
# person안에 height는 없다
for key in person.keys():
    print(key)
# 키만 보여줌
for v in person.values():
    print(v)
# 벨류만
for i in person.items():
    print(i)
# 키와 벨류를 한꺼번에
#  ===================================================
charset = ['abd', 'code', 'band' , 'band', 'abc']
wc = {}

for key in charset:
    wc[key] =wc.get(key, 0)+ 1
print(wc)
# charset의 원소들이 각각 몇개씩있는지 wc를 통해 알려줌

# ==========================================================
name = ['홍길동', '이순신', '강감참']
print('name address =', id(name))

name2 = name
print('name2 address= ', id(name2))
# 주소 값만 던져준 얕은 복사다
print(name)
print(name2)

name2[0]='김길동'
print(name)
print(name2)
# 저장된 주소는 하나이기 때문에 둘중 하나만 바꿔도 둘다 바뀐다


import  copy
name3 = copy.deepcopy(name)
print(name)
print(name3)

print('name address =', id(name))
print('name address =', id(name3))
name[1] = '이순신 장군'
print(name)
print(name3)
# 두 인자가 주소가 다른 곳에 저장이 되었으므로 이것은 깊은 복사라 한다
# ==================================================================
import  random
dataset = []
for i in range(10):
    # i 는 10번을 돌리려는 목적이다
    r = random.randint(1,100)
    # 1부터 100 사이의 숫자를 열개를
    dataset.append(r)
print(dataset)

vmax = vmin = dataset[0]

for i in dataset:
    if vmax < i:
        vmax =i
    if vmin > i:
        vmin =i

print( 'max =', vmax, 'min =', vmin)
# ===================================================
# 오름차순ascending 내리차순descending
# 35124
# 15324
# 13524
# 12534
# 12354
# 12345
dataset=[3,5,1,2,4]
n = len(dataset)

for i in range(0, n-1):
    for j in range(i+1, n):
        if dataset[i]> dataset[j]:
            tmp =dataset[i]
            dataset[i]=dataset[j]
            dataset[j]=tmp
    print(dataset)
print(dataset)
# 3,5,1,2,4가 오름차순으로 정렬되는과정을 중첩 반복문과 조건문으로 표현한것이다
dataset=[3,5,1,2,4]
n = len(dataset)

for i in range(0, n-1):
    for j in range(i+1, n):
        if dataset[i]< dataset[j]:
            tmp =dataset[i]
            dataset[i]=dataset[j]
            dataset[j]=tmp
    print(dataset)
print(dataset)
# 3,5,1,2,4가 내림차순으로 정렬되는과정을 중첩 반복문과 조건문으로 표현한것이다
# ============================================================================
# data 1,3,5,7,9
# start = 1, end = 5, mid =3
# 5>3 오른쪽을 버릴때: end = mid - 1
# 1<3 왼쪽을 버릴때: stat = mid + 1

dataset = [5, 10, 18, 22, 35,55,75, 103]
value = int(input('검색할 값 입력:'))
low= 0#스타트값
high = len(dataset)-1#엔드값
loc = 0#미드값
state =False

while(low <= high):
    mid =(low + high)//2

    if dataset[mid]>value:
        high =mid -1
    elif dataset[mid]< value:
        low = mid +1
    else:
        loc =mid
        state = True
        break
if state:
    print("찾은 위치: %d 번째" % (loc+1))
else:
    print('찾는 값은 없습니다.')

































