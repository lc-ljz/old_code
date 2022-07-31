# -*- coding: utf-8 -*-
"""
Created on Wed May  6 19:07:07 2020

@author: LJZ
"""

import pickle
import cv2
import numpy as np
import os

def load_data():
    test1 = open(r'test.pickle','rb')
    label_dict = pickle.load(test1)
    test1.close()
    
    num = len(label_dict)
    train_datas = np.zeros((num,65,64,3))
    train_labels = np.zeros((num,1))
    for i in range(1,num+1):
        r = cv2.imread(r'chinese1/%0.1d.png'%i)
        r = r/255.
        train_datas[i-1,:,:,:] = r
        train_labels[i-1,:] = i
    
    train_datas = train_datas.reshape(train_datas.shape[0],-1)
    return train_datas,train_labels

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



