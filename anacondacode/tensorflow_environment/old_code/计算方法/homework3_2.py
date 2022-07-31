# -*- coding: utf-8 -*-
"""
Created on Sat Sep 21 12:04:48 2019

@author: LJZ
"""

#2x+1=e^x切线法
import numpy as np
import matplotlib.pyplot as plt
import math
e=math.e
f=lambda x: 2*x+1-e**x
df=lambda x:2-e**x
x=np.linspace(-0.8,2.6,1001)
plt.plot(x,f(x))
#hold on
plt.plot(x,np.zeros(x.shape))

x=0.8
for i in range(1,31):
    t=x-f(x)/df(x)
    
    #hold on
    plt.plot([x,t],[f(x),0])
    #pause(1)
    
    x=t
    
    #hold on
    plt.plot([x,x],[f(x),0],'--')
    #pause(1)
