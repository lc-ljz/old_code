# -*- coding: utf-8 -*-
"""
Created on Mon Sep 16 10:05:22 2019

@author: LJZ
"""

import numpy as np
import matplotlib.pyplot as plt

f=lambda x:np.sin(x)-x**2/4
n=101
x=np.linspace(1.5,2,n)
plt.plot(x,f(x))
y=np.zeros(x.shape)
plt.plot(x,y)
plt.draw
a=x[0]
b=x[-1]
c=(a+b)/2
tol=1e-6
plt.ion
while(np.abs(f(c))>tol):
    if(f(c)>0):
        a=c
    else:
        b=c
    plt.plot(c,f(c),'*')
    plt.draw
    #plt.pause(1)
    
    c=(a+b)/2