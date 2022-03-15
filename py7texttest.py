import re
from re import findall

st1 = '1234 abc홍길동 ABC_555_6 이사도시'

print(findall('1234',st1))
print(findall('[0-9]',st1))
print(findall('[0-9]{3}',st1))
print(findall('[0-9]{3,}',st1))
print(findall('\\d{3,}',st1))

print(findall('[가-힣]{3,}',st1))
print(findall('[a-z]{3}',st1))
print(findall('[a-zA-Z]{3,}',st1))

st2 ='test1abcABC 123mbc 45test'

print(findall('^test', st2))
print(findall('st$', st2))

print(findall('.bc',st2))

print(findall('t.',st2))

st3 ='test^홍길동 abc 대한*민국 123$tbc'
words =findall('\\w{3}', st3)
print(words)

print(findall('[^^*$]+', st3))
# ====================문자열검사예=======================================
from re import match

jumin ='123456-3234567'
result =match('[0-9]{6}-[1-4][0-9]{6}',jumin)
print(result)

if result :
    print('주민번호 일치')
else :
    print('잘못된 주민번호')


jumin = '123456-523467'
result = match('[0-9]{6}-[1-4][0-9]{6}',jumin)
# match는 매치하고 해당하는지 알아보는 함수
print(result)

if result:
    print('주민번호 일치')
else:
    print('잘못된주민번호')
# ++++++++++++++++문자열 치환====================
from re import sub
st3 ='test^홍길동 abc 대한*민군 123$tbc'

text1 = sub('[\^*$]+','', st3)
# sub은 [업앤것, 뭐로 없앨건지, 해당하는 문자열]
print(text1)

text2 =sub('[0-9]','',text1)
# test1해당하는 문자열의 숫자를 공백으로 만든다
print(text2)
# ===================올바른 문장 선택예================
from re import split, match, compile

multi_line = """http://www.naver.com
http://www.daum.net
www.hongkildong.com"""

web_site = split("\n", multi_line) #엔터로 분리한다
('pattern,string')
print(web_site)

pat = compile("http://")
# 이것을 변수로 선언하여 밑에서 이것이 있는 것을 분리해낸다
sel_site =[site for site in web_site if match(pat, site)]
print(sel_site)
# ===============자연어 전처리 예==================================
from re import findall, sub
texts =['우리나라 대한민국, 우리나라%$ 만세','비아그&라 5000GRAM 정력 최고!','나는 대한민국 사람', '보험료 15000원에 평생 보장 마감 임박','나는 홍길동']

texts_re1 = [t.lower() for t in texts]
print('texts_re1:', texts_re1)

texts_re2 = [sub('[0-9]', '', text)for text in texts_re1]
print('text_re2:', texts_re2)

texts_re3 = [sub('[,.?!:;]', '', text)for text in texts_re2]
print('text_re3:', texts_re3)

spec_str = '[@#$%^&*()]'
texts_re4 = [sub(spec_str, '', text)for text in texts_re3]
print('text_re4:', texts_re4)

texts_re5 = [''.join(findall("[^a-z]", text))for text in texts_re4]
print('text_re5:', texts_re5)

texts_re6 = [''.join(text.split())for text in texts_re5]
print('text_rel6:', texts_re6)
# ====================================전처리 함수예===================
from re import findall, sub

texts=['우리나라 대한민국, 우리나라%$ 만세','비아그&라 5000GRAM 정력 최고!','나는 대한민국 사람', '보험료 15000원에 평생 보장 마감 임박','나는 홍길동']

def clean_text(texts):
    texts_re =texts.lower()
    texts_re2=sub('[0-9]', '', texts_re)
    texts_re3=sub('[,.?!:;]', '', texts_re2)
    texts_re4=sub('[@#$%^&*()]', '', texts_re3)
    texts_re5=sub('[a-z]','',texts_re4)
    texts_re6=' '.join(texts_re5.split())
    return  texts_re6

texts_result =[clean_text(text) for text in texts]
print(texts_result)






