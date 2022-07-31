# -*- coding: utf-8 -*-
"""
Created on Fri Sep 20 23:03:39 2019

@author: LJZ
"""
import numpy as np
import matplotlib.pyplot as plt
import math
#双点弦法
e=math.e
f=lambda x:2*x+1-e**x
x=np.linspace(-0.8,2.5,101)
plt.plot(x,f(x))
plt.plot(x,np.zeros(x.shape))
plt.draw
a=0.5
b=2

for i in range(1,11):
    plt.plot([a,b],[f(a),f(b)])
#    plt.pause(1)
    
    x=a-(b-a)*f(a)/(f(b)-f(a))
    
    plt.plot([x,x],[0,f(x)])
 #   plt.pause(1)
 #   
    if(abs(f(x))<1e-8):
        break
    
    
    if(f(x)>0):
        a=x
    else:
        b=x
print(x)