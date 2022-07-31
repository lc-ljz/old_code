# -*- coding: utf-8 -*-
"""
Created on Sat Jun  6 17:25:37 2020

@author: LJZ
"""


import pickle

#生成目录
fr=open('pred.txt','r', encoding='UTF-8')
content=fr.read()
label_dict={}
lab = {}
num=1
for line in content:  
    lab[line] = num
    # label_dict[num] = line
    num = num+1
    

label_dict = dict(zip(lab.values(), lab.keys()))

## func = lambda z: dict([(x, y) for y, x in z.items()])
## lab = func(func(label_dict))
   

fr.close()

#存储目录
# with open('train.pickle','wb')as test1:
#     pickle.dump(label_dict,test1)

# with open('lab.pickle','wb')as test1:
#     pickle.dump(lab,test1)   











