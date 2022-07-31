# -*- coding: utf-8 -*-
"""
Created on Mon Mar  2 11:33:47 2020

@author: LJZ
"""
#1.
#import numpy as np
#u=[-6,8]
#v=[4,3]
#w=[1,2]
#u=np.array(u)
#v=np.array(v)
#w=np.array(w)
#print("u*v = ",u@v)
#print("u*w = ",u@w)
#print("u*(v+w) = ",u@(v+w))
#print("w*v = ",w@v)


#4.
#import numpy as np
#v=np.random.randn(2,)
#w=np.random.randn(2,)
#print("v*(-v) = ",v@(-v))
#print("(v+w)*(v-w) = ",(v+w)@(v-w))
#print("(v-2*w)*(v+2*w) = ",(v-2*w)@(v+2*w))


#5
import numpy as np
from numpy import sqrt
v=[1,3]
w=[2,1,2]
v=np.array(v)
w=np.array(w)
u1=v/(sqrt(v@v))
u2=w/(sqrt(w@w))

v1=[3,-1]
w1=[1,0,-1]
v1=np.array(v1)
w1=np.array(w1)
U1=v1/(sqrt(v1@v1))
U2=w1/(sqrt(w1@w1))
#a=(0-u1[0]*0.01)/u1[1]
#U1=[0.01,a]
#U1=np.array(U1)
#U1=U1/(sqrt(U1@U1))
#b=(0-u2[0]*0.01-u2[1]*0.01)/u2[2]
#U2=[0.01,0.01,b]
#U2=np.array(U2)
#U2=U2/(sqrt(U2@U2))
print("u1 = ",u1)
print("u2 = ",u2)
print("U1 = ",U1)
print("U2 = ",U2)

#补1
#import matplotlib.pyplot as plt
#A=plt.imread("plane.png")
#B=A.reshape(1,-1)
#n = len(A.flatten())

#补2
#画 y = x^2 + 2x + 1,x 设在区间 [-2, 2]之间
#import numpy as np
#import matplotlib.pyplot as plt
#X = np.c_[x**0, x**1,x**2]
#theta = np.array([1, 2,1])
#y = X@theta
#plt.plot(x, y)

















