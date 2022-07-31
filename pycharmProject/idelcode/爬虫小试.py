import requests
import re


url='https://www.37zw.net/3/3468/'
response=requests.get(url)
response.encoding='gbk'
html=response.text
dl=re.findall(r'<dl>.*?</dl>',html,re.S)[0]
tit=re.findall(r'<meta property="og:title" content="(.*?)"/>',html)[0]
#print(tit)
file=open('%s.txt'%tit,'w',encoding='utf-8')

