# -*- coding: utf-8 -*-
"""
Created on Wed May  6 19:07:07 2020

@author: LJZ
"""

import pickle
import cv2
import numpy as np
import os


def load_test_data():
    dir = 'test'
    list = os.listdir(dir) #列出文件夹下所有的目录与文件
    n = len(list)
    test_datas = np.zeros((n,65,64,3))
    for i in range(n):
        r = cv2.imread(r'test/%0.1d.png'%i)
        test_datas[i,:,:,:] = r   
    test_datas = test_datas.reshape(test_datas.shape[0],-1)
    return test_datas

def load_data(): 
    dir = 'train'
    list = os.listdir(dir)
    
    test1= open(r'lab.pickle','rb')
    lab = pickle.load(test1)
    test1.close()
    
    fr = open(r'pred.txt','r', encoding='UTF-8')
    content=fr.read()
    s = []
    for line in content:
        s.append(lab[line])
    fr.close()
    
    n = len(list)
    train_datas = np.zeros((n,65,64,3))
    train_labels = np.zeros((n,1))
    for i in range(n):
        r = cv2.imread(r'train/%0.1d.png'%i)
        r = r/255.
        train_datas[i,:,:,:] = r
        train_labels[i,:] = s[i]
    train_datas = train_datas.reshape(train_datas.shape[0],-1)
   
    return train_datas,train_labels
    










