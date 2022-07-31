# -*- coding: utf-8 -*-
"""
Created on Fri Feb 28 21:12:34 2020

@author: LJZ
"""
#import numpy as np
#import matplotlib.pyplot as plt
#from numpy import cos, sin, pi
#u = np.array([1, 0])
#P = [[cos(pi/6), sin(pi/6)], [-sin(pi/6), cos(pi/6)]]
#P = np.array(P)

#U=1*u
#for i in range(12):
#    u = P@u
#    U = np.c_[U, u]
#    plt.quiver(0, 0, u[0], u[1]+1)
#    plt.axis([-1, 1.5, -1.5, 2])
#    plt.pause(0.2)

#画圆
#alpha = np.arange(-pi, pi, 0.01*pi)
#x = cos(alpha)
#y = sin(alpha)
#plt.plot(x, y+1)
#plt.show()

#u = np.array([cos(pi/6), sin(pi/6)])
#U = 1*u
#for i in range(12):
#    u = P@u
#    U = np.c_[U, u]
#    plt.quiver(0,0,u[0],u[1]+1)
#    plt.axis([-1, 1.5, -1.5, 2])
#    plt.pause(0.2)
#U=np.delete(U,0,axis=1)

 
#U=u
#for i in range(12):
#    u = P@u
#    U = np.c_[U, u]
#plt.scatter(U[0,:], U[1,:])
#plt.show()
## 矩阵的加法运算
#a = [[1, 2], [3, 4]]
#a = np.array(a)
#s = np.sum(a)
#s2 = np.sum(a, axis=1)
#s3 = np.sum(a, axis=0)

#13_a
import numpy as np
import matplotlib.pyplot as plt
from numpy import cos, sin, pi
u = np.array([1, 0])
P = [[cos(pi/6), sin(pi/6)], [-sin(pi/6), cos(pi/6)]]
P = np.array(P)
U = 1*u
for i in range(12):
    u = P@u
    U = np.c_[U, u]
    plt.quiver(0,0,u[0],u[1])
    plt.axis([-1, 1.5, -1.5, 2])
    plt.pause(0.2)
U=np.delete(U,0,axis=1)

alpha = np.arange(-pi, pi, 0.01*pi)
x = cos(alpha)
y = sin(alpha)
plt.plot(x, y)
plt.show()



#13_b
#import numpy as np
#import matplotlib.pyplot as plt
#from numpy import cos, sin, pi
#P = [[cos(pi/6), sin(pi/6)], [-sin(pi/6), cos(pi/6)]]
#P = np.array(P)
#u = np.array([cos(pi/6), sin(pi/6)])
#U = 1*u
#for i in range(11):
#    u = P@u
#    U = np.c_[U, u]
#    plt.quiver(0,0,u[0],u[1])
#    plt.axis([-1, 1.5, -1.5, 2])
#    plt.pause(0.2)
#U=np.delete(U,0,axis=1)
#
#alpha = np.arange(-pi, pi, 0.01*pi)
#x = cos(alpha)
#y = sin(alpha)
#plt.plot(x, y)
#plt.show()


