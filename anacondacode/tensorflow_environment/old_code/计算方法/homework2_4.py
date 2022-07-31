# -*- coding: utf-8 -*-
"""
Created on Sat Sep 14 11:36:29 2019

@author: LJZ
"""
import numpy as np
#除法
y=0.5;
c=1.8343429324;
for i in range(1,8):
    y=y*(2-c*y)

print(y)
print(1/c)
#根号
c=3.424232
x=0.5
for i in range(1,8):
    x=0.5*(x+c/x)

print(np.sqrt(c))
print(x)

y=2
for i in range(1,11):
    y=2+1/y

print('根号2为',y-1)
#整理
