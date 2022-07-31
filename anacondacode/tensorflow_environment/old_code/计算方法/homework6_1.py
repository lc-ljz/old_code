# -*- coding: utf-8 -*-
"""
Created on Tue Oct 29 22:18:34 2019

@author: LJZ
"""
import numpy as np
A = [[np.exp(-16), 1],[1, 1]]
b = [[1],[2]]
A=np.array(A)
b=np.array(b)
#A = A[[1,0],:]
#b = b[[1,0]]
x=np.linalg.solve(A,b)
print("使用 A\\b 求解: x={}\n".format(x.T))
#Ab = [A, b];
Ab=np.column_stack((A,b))
Ab[1, :] = Ab[1, :] - Ab[1,0]/Ab[0,0] * Ab[0,:]
x2 = Ab[1, 2]/Ab[1, 1]
x1 = (Ab[0, 2] - Ab[0,1]*x2)/Ab[0, 0];

print("使用高斯消元法: x=[{},{}].\n".format(x1, x2))