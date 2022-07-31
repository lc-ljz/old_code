# -*- coding: utf-8 -*-
"""
Created on Wed Sep 25 20:16:37 2019

@author: LJZ
"""
import matplotlib.pyplot as plt
from numpy import pi,linspace,sin,array

x=[-pi/2,pi,5*pi/2]
y=[-1,0,1]
x=array(x)
y=array(y)
plt.scatter(x,y)
x1=linspace(-pi/2,5*pi/2)
plt.plot(x1,sin(x1))


def polynomial(b,x):
    p=b[-1]
    for k in range(b.numel,2,-1):
        p=(x[-1]-x[k-1])*p+b[k-1]
    return p

def newton(x,f):
    b={}
    b[0]=f[0]
    n=len(f)-1
    for k in range(1,n+1):
        p=polynomial(b,x[0:k+1])
        num=f(k)-p
        den=1
        for j in range(0,k-1):
            den=den*(x[k]-x[j])
        b[k]=num/den
    return b
        
b=newton(x,y)

#x=linspace(-pi/2,5*pi/2)
#y=b(1)+b(2).*(x+(pi/2))+b(3).*(x+pi/2).*(x-pi)
#plot(x,y)
