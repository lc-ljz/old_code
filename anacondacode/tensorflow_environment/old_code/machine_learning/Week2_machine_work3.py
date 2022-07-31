# -*- coding: utf-8 -*-
"""
Created on Wed Mar  4 12:15:23 2020

@author: LJZ
"""

import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(-5,5,25)
n = len(x)
y = 2*x+np.random.rand(n,)*3
plt.scatter(x,y)

X = np.ones(n)
X = np.c_[X,x]

theta = np.random.randn(2,)
maxiter = 100
alpha = 0.001
for i in range(1,maxiter+1):
    theta -= alpha * X.T @(X @ theta - y)
    
plt.plot(x,X@theta)