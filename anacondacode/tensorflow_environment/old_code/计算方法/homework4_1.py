# -*- coding: utf-8 -*-
"""
Created on Wed Sep 25 16:57:36 2019

@author: LJZ
"""
import matplotlib.pyplot as plt
from numpy import linspace,ones,trapz,arange

x=linspace(-1,1,101)
p0=ones(x.shape)
p1=x
p2=(3/2)*(x**2)-1/2
p3=(5/2)*(x**3)-x/2
plt.plot(x,p0)
plt.plot(x,p1)
plt.plot(x,p2)
plt.plot(x,p3)


#from sympy import integrate,symbols
#    x = symbols("x")
#    return integrate(x^0,(x,-1,1)

def f0(m,n):
    x=arange(-1,2)
    y1=(m*x)**0
    y2=(m*x)**0
    return trapz(y1,y2)

def f1(m,n):
    x=arange(-1,2)
    y1=x*m
    y2=n*x
    return trapz(y1,y2)

def f2(m,n):
    x=arange(-1,2)
    y1=(3/2)*((m*x)**2)-1/2
    y2=(3/2)*((n*x)**2)-1/2
    return trapz(y1,y2)

def f3(m,n):
    x=arange(-1,2)
    y1=(3/2)*((m*x)**2)-1/2
    y2=(3/2)*((n*x)**2)-1/2
    return trapz(y1,y2)

m=2
n=3
print(f0(m,n))
print(f1(m,n))
print(f2(m,n))
print(f3(m,n))