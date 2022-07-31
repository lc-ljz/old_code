# -*- coding: utf-8 -*-
"""
Created on Sun Oct 20 14:20:20 2019

@author: LJZ
"""

import numpy as np
import matplotlib.pyplot as plt

n=101
x=np.linspace(-3,3,n)
delta=(3+3)/(n-1)
y=x**4
d1=np.eye(n-1)
d2=np.ones(n-2)
d2=np.diag(d2,-1)
d=d1-d2
left=np.append(-1,np.zeros(n-2))
d=np.column_stack((left,d))
dy=(np.matmul(d,y.T))/delta
plt.plot(x[0:n-1],dy)
plt.plot(x,4*x**3)