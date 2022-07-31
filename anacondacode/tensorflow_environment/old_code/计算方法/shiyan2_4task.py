# -*- coding: utf-8 -*-
"""
Created on Fri Nov 29 10:34:37 2019

@author: LJZ
"""

#p154 压缩影像原理
import numpy as np
B=[[0.3,0.8],[0.7,0.2]]
#B的元素大于等于0，B案列相加=1，谱半径==1
B=np.array(B)
u=np.array([1,0])##改变初值，元素大于等于0，相加=1
u=np.array([0.01,0.99])#例子
U=u
for i in range(30):
    u=np.dot(B,u)
    U=np.c_[U,u]

print("双击Variable explorer中的U，观测U的值，趋向于不变")