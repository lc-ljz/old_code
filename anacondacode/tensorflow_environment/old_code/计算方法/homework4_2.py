# -*- coding: utf-8 -*-
"""
Created on Wed Sep 25 19:31:48 2019

@author: LJZ
"""
import matplotlib.pyplot as plt
from numpy import pi
x=[-pi/2,pi,5*pi/2]
y=[-1,0,1]
import numpy as np
x=np.array(x)
y=np.array(y)
plt.scatter(x,y)
from numpy.matlib import repmat
A=repmat(x,3,1)
A=A.T
p=range(3)
v=A**p
b=np.linalg.solve(v,y)
x=np.linspace(x[0],x[2])
plt.plot(x,b[0]+b[1]*x+b[2]*x**2)