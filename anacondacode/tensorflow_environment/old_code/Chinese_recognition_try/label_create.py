# -*- coding: utf-8 -*-
"""
Created on Wed May  6 17:35:21 2020

@author: LJZ
"""
import pickle

#生成目录
fr=open('chinese.txt','r', encoding='UTF-8')
content=fr.read()
label_dict={}
num=1
for line in content:
    label_dict[num] = line  # 添加
    num = num+1


fr.close()


#存储目录
with open('test.pickle','wb')as test1:
    pickle.dump(label_dict,test1)
    
