# -*- coding: utf-8 -*-
"""
Created on Fri Nov 22 10:46:53 2019

@author: LJZ
"""
#########内积
import numpy as np
n=5
x=np.ones(n)
A=np.arange(n*n).reshape([n,n])
y=A.dot(x)
print("验证y的每一个元素")
for i in range(n):
    print(A[i,:].dot(x))
#######################
print("在python中，A是数组,x也是数组")
print("在MATLAB中，A是矩阵，x是向量")
##########################
y3=x.dot(A);y4=np.dot(x,A)
for i in range(n):
    print(np.dot(x,A[:,i]))
#矩阵相乘(default:内积，inner product)
C=np.array([[1,2],[3,4]])
D=np.array([[-1,1],[1,-1]])
r1=C.dot(D)
r2=np.matmul(C,D)
print("matmul:matrix multiplication")