# -*- coding: utf-8 -*-
"""
Created on Sat Sep 21 12:11:54 2019

@author: LJZ
"""

#二分法
import numpy as np
import matplotlib.pyplot as plt
import math
e=math.e
f=lambda x:2*x+1-e**x
x=np.linspace(-0.8,2.5,101)
plt.plot(x,f(x))
#hold on
plt.plot(x,np.zeros(x.shape))
plt.draw
a=x[0]
b=x[-1]
c=(a+b)/2
while(abs(f(c))>1e-4):
    if(f(c)>0):
        a=c
    else:
        b=c
    plt.plot(c,f(c),'*')
    plt.draw
    #pause(1)
    
    c=(a+b)/2

