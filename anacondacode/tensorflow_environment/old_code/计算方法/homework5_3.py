# -*- coding: utf-8 -*-
"""
Created on Sat Oct 19 19:02:13 2019

@author: LJZ
"""

#最小二乘法

import numpy as np
import matplotlib.pyplot as plt

n=11
x=[20,40,60,80,100]
y=[4.35,7.55,10.40,13.80,16.80]
x=np.array(x)
y=np.array(y)
n=len(x)
plt.scatter(x,y)
X=np.zeros([n,2])
X[:,0]=np.ones(n)
X[:,1]=x
den=np.matmul(X.T,X)
num=np.dot(X.T,y)
theta=np.linalg.solve(den,num)
plt.plot(x,np.dot(X,theta))
