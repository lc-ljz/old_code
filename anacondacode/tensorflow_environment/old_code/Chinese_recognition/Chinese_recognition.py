# -*- coding: utf-8 -*-
"""
Created on Wed May  6 16:37:05 2020

@author: LJZ
"""
#import sklearn
#import matplotlib.pyplot as plt
from datasets import load_data,load_test_data
from sklearn.naive_bayes import MultinomialNB ##GaussianNB

clf = MultinomialNB()
train_datas,train_labels = load_data()
clf = clf.fit(train_datas, train_labels.ravel())


#%%
#预测
test_datas = load_test_data()
test_label = clf.predict(test_datas)
print("贝叶斯分类器，样本总数： %d " % (test_datas.shape[0]) )

#%%
#输出预测结果
import pickle
test1 = open(r'train.pickle','rb')
label_dict = pickle.load(test1)
test1.close()
n = len(test_label)
print("得到的汉字为：")
s = []
for i in range(n):
    sy = label_dict[test_label[i]]
    s.append(sy)
s=''.join(s)
print(s)
#%%
with open('result.txt','w',encoding = 'utf-8') as f:
    f.write(s)
f.close()


















