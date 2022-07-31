# -*- coding: utf-8 -*-
"""
Created on Mon Dec 16 16:10:14 2019

@author: LJZ
"""

import numpy as np
x = [1,3,2]
y = [1,2,-1]
x = np.array(x)
y = np.array(y)
def Lagrange(x, y, z):
    p = 0; ptemp = 1
    n = len(x)
    for j in range(n):
        for i in range(j):
            ptemp *= (z - x[i])/(x[j]-x[i])
        for i in range(j+1,n):
            ptemp *= (z - x[i])/(x[j]-x[i])
        p += ptemp * y[j]
        ptemp = 1
    return p
print(Lagrange(x, y, 1.5))
def f(x):
    return x**2
a = 0; b = 1; n = 100
def fuhuaT(a, b, n): #page 91 formula 1
    x = np.linspace(a, b, n+1);  y = f(x)
    s = np.sum(y)*2 - y[0] - y[-1]
    h = (b - a)/n; s = s*h/2.;    return s
def fuhuaS(a, b, n):
    x = np.linspace(a, b, n+1); y = f(x)
    s = 0; m = np.int(n/2)
    for i in range(m):
        s += 4*y[2*i+1]; s += 2*y[2*i]  #多计算了i=0
    s -= y[0]; s += y[-1];h=(b-a)/n; s = s*h/3.; return s

def du(t, u):
    return u - 2 * t/u
t = 0; u = 1; h = 0.1
for i in range(2):
    utemp = u + h * du(t, u)
    u += 0.5 * h*(du(t, u) + du(t+h, utemp))
    t = t + h
    print(u)
    
        
        
    
        
