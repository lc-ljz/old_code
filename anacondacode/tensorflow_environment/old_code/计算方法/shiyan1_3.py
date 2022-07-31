# -*- coding: utf-8 -*-
"""
Created on Fri Nov 22 11:12:58 2019

@author: LJZ
"""

###外积
print("tensor product;outer product;外积")
import numpy as np
import matplotlib.pyplot as plt
n=5
a=np.arange(n)
b=np.ones(n)
print("axb,bxa in figure 1")
r1=np.tensordot(a,b,axes=0)
fig=plt.figure()
ax1=plt.subplot(1,2,1)
plt.imshow(r1)
r2=np.tensordot(b,a,axes=0)
ax2=plt.subplot(1,2,2)
plt.imshow(r2)
plt.show()