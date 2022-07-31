# -*- coding: utf-8 -*-
"""
Created on Fri Nov 29 10:54:19 2019

@author: LJZ
"""

import numpy as np
import matplotlib.pyplot as plt
n=1024
A=np.zeros([n,n])
t=np.arange(-512,512)
m=np.ones(n)

x=np.tensordot(m,t,axes=0)
y=np.tensordot(t,m,axes=0)
#x,y=np.meshgrid(t,t)

distance=300;p=3#p范数
D=abs(x)**p+abs(y)**p
D=pow(D,1.0/p)
logic=D-distance
logic=abs(logic)<2
A[logic]=1
plt.imshow(A)