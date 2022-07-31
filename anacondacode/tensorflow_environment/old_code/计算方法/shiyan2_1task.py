# -*- coding: utf-8 -*-
"""
Created on Fri Nov 29 10:33:01 2019

@author: LJZ
"""

import numpy as np
#import matplotlib.pyplot as plt
#p219
#习题1
def f(t,u):
    return t**2-u**2
u=1;h=0.05;T=0.2;
###-----p196公式3折线法-----#
U1=np.zeros(np.int32(T/h+1));i=0;U1[i]=u;
for t in np.arange(0,T,h):#0,0.05,0.01,0.15,不包括0.2
    u+=h*f(t,u)
    i+=1
    U1[i]=u
print(U1)

###-----p196公式10，14预估校正法-----#
u=1;
U2=np.zeros(np.int32(T/h)+1);i=0;U2[i]=u;
for t in np.arange(0,T,h):
    utmp=u+h*f(t,u)
    f1=f(t,u)
    f2=f(t+h,utmp)
    u+=0.5*h*(f1+f2)
    i+=1
    U2[i]=u
print(U2)


###-----p205公式10 龙格库塔法2阶-----#
u=1;U3=np.zeros(np.int32(T/h)+1);i=0;U3[i]=u
for t in np.arange(0,T,h):
    k1=f(t,u)
    k2=f(t+0.5*h,u+0.5*h*k1)
    u+=h*k2
    i+=1
    U3[i]=u
print(U3)

###-----p205公式18 龙格库塔法4阶-----#
u=1;U4=np.zeros(np.int32(T/h)+1);i=0;U4[i]=u
for t in np.arange(0,T,h):
    k1=f(t,u)
    k2=f(t+h/2,u+h*k1/2)
    k3=f(t+h/2,u+h*k2/2)
    k4=f(t+h/2,u+h*k3)
    u+=h*(k1+2*k2+2*k3+k4)/6
    i+=1
    U4[i]=u
print(U4)