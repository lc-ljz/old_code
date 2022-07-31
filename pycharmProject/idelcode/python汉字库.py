import codecs
start,end = (0x4E00,0x9FA5)#汉字编码的范围
with codecs.open("chinese.txt", "wb", encoding="utf-8") as f:
    for codepoint in range(int(start),int(end)):
        f.write(chr(codepoint))  #写出汉字
