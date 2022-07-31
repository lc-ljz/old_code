import requests 
import re 

url='https://www.37zw.net/3/3468/'
res=requests.get(url)
res.encoding='gbk'
html=res.text
#章节目录和连接
dl=re.findall(r'<dl>.*?</dl>',html,re.S)[0] 
#print(dl)
#书名
tit=re.findall(r'<meta property="og:title" content="(.*?)"/>',html)[0] 
#print(title)
fb=open('%s.text'%tit,'w',encoding='utf-8')
#各个章节信息名称
chapter_info_list=re.findall(r'href="(.*?)">(.*?)<',dl,re.S)
#print(chapter_info_list)
for chapter_info in chapter_info_list:
    #chapter_title=chapter_info[1];#chapter_url=chapter_info[0]
    chapter_url,chapter_title=chapter_info
    chapter_url="https://www.37zw.net/3/3468/%s" % chapter_url
    #print(chapter_url,chapter_title)
    chapter_res=requests.get(chapter_url)
    chapter_res.encoding='gbk'
    chapter_html=chapter_res.text
    #提取章节内容
    chapter_content=re.findall(r'<div id="content">(.*?)</div>',chapter_html,re.S)
    #清洗数据
    chapter_content=str(chapter_content)
    chapter_content=chapter_content.replace(' ','')
    chapter_content=chapter_content.replace('&nbsp;','')
    chapter_content=chapter_content.replace('<br/>','')
    #写入文档  数据持久化
    fb.write(chapter_title)
    fb.write(chapter_content)
    fb.write("\n")
    print(chapter_url)
    exit()
print("下载成功！")
