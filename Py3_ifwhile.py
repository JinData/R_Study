#조건문 반복문 사용법
var = 10
if var >= 5:
    print('var= ', var)
    print('var 는 5보다 크다')
    print('조건이 참인 경우 실행')
print('항상 실행')

#=========================================================

score = int(input('점수입력:'))
if score >= 85 and score <=100:
    print('우수')
else:
    if score>= 70:
        print('보통')
    else:
        print('저조')
#=====================================
score = int(input('점수입력:'))
grade = ''
if score>= 85 and score <=100:
    grade = '우수'
elif score >= 70:
    grade = '보통'
else :
    grade = '저조'
print('당신의 점수는 %d이고, 등급은 %s'%(score, grade))

#====================================================
num = 9
result = 0
if num >= 5 :
    result = num * 2
else:
    result = num + 2
print("result =", result)
result = 18
result2 = num *2 if num >= 5 else num + 2
print("result2 =", result2)
#=================================================
cnt = tot = 0
while cnt < 5:
    cnt += 1
    tot += cnt
    print(cnt, tot)


cnt = tot = 0
dataset = []
while cnt < 100:
    cnt += 1
    if cnt % 3 ==0:
        tot += cnt
        dataset.append(cnt)
print('1~100 사이 3의 배수 합 = %d' % tot)
print('dataset =', dataset)
#===============================================
numData = []
while True:

    num = int(input('숫자입력:'))
    if num % 10 == 0:
        print('프로그램 종료')
        break
    else :
        numData.append(num)
        print(numData)
        print(num)

#=================================================================================
import random
help(random)
help(random.random)
r = random.random()
print('r =', r)


cnt=0 # 카운터를 0부터 새기위해 0으로 설정해놓는다
while True:
    r = random.random()
    print(r)
    if r< 0.07:
        cnt +=1
        break
    else:
        cnt +=1
print('난수 개수 =', cnt)
#=====================================================================================
names = ['홍길동' ,'이순신', '유관순']
print(names)
print(names[2])


if '유관순' in names:
    print('유관순 있음')
else:
    print('유관순 없음')
idx = random.randint(0,2)
print(names[idx])
#=================================================================
i = 0
while i< 10:
    i += 1
    if i == 3:
        continue
    if i == 6:
        break
    print(i, end= ' ')#end = ' '띄어쓰기로 이어 붙이라는 뜻이다
#==============================================
string = '홍길동'
print(len(string))
for s in string:
    print(s)


lstset = [1,2,3,4,5]
for e in lstset :
    print('원소:', e)
#=======================================================================
num1 =range(10)
print('num1 :', num1)
num2 =range(1,10)
print('num2 :', num2)
num3 =range(1, 10, 2)
print('num3 :', num3)

for n in num1:
    print(n, end=" ")
print( )
for n in num2:
    print(n, end=" ")
print( )
for n in num3:
    print(n, end=" ")
#===========================================
lst=[]
for i in range(10):
    r = random.randint(1, 10)
    lst.append(r)
print('lst=', lst)

for i in range(10):
    print(lst[i] * 0.25)
#===================================================
for i in range(2,10):
    print('~~~ {} 단 ~~~'. format(i))
    for j in range(1,10):
        print('%d * %d = %d'%(i,j, i*j)) #순서대로 대입하며 들어간다
#======================================================
string="""나는 홍길동 입니다.
주소는 서울시 입니다.
나이는 35세 입니다."""
sents = []
words = []
for sen in string.split(sep = '\n'): #엔터로 구분에서 나눈다는 소리
    sents.append(sen)
    for word in sen.split(): #띄어쓰기로 나눈다는 소리
        words.append(word)
print('문장:', sents)
print('문장수:', len(sents))
print('단어:', words)
print('단어수:', len(words))





