# -*- coding: utf-8 -*-
"""
Created on Thu Mar 26 18:06:22 2020

@author: LJZ
"""

import numpy as np

A = [1,3,5]
B = [2,4,6]
C = A + B
A.extend(B)
print("B:",B)
print("C:",C)
print("A:",A)

A.pop(0)
print(A)
A.pop(-1)
print(A)
A.pop(-2)
print(A)

print("A * 3 :",A * 3)
print("A * 3 :",A * 5)


def f(x):
    return 2*x
B.append("HELLO WORLD!")
B1 = np.arange(5)
B2 = np.array([[1,2],[3,4]])
B.append(B1)
B.append(A)
B.append(B2)
B.append(f)
print("B:",B)
Z = B[-1](5)
print('Z = ',Z)

