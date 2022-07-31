# -*- coding: utf-8 -*-
"""
Created on Fri Nov 29 10:41:47 2019

@author: LJZ
"""

import numpy as np
import matplotlib.pyplot as plt
n=512
#A=np.zeros([n,n])
#plt.imshow(A)

#a=np.zeros(n)
#a[100:200]=1
#a=np.array(a)
#b=np.ones(n)
#B=np.tensordot(a,b,axes=0)
#plt.imshow(B)

t=np.arange(-3,3,0.1)
r=np.ones(len(t))
x=np.tensordot(t,r,axes=0)
y=np.tensordot(r,t,axes=0)
z=x**2+y**2
plt.imshow(z)