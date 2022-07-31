# -*- coding: utf-8 -*-
"""
Created on Fri Nov 29 10:33:57 2019

@author: LJZ
"""

import numpy as np
#1.1 p166
A=[[7,1,2],[2,8,2],[2,2,9]]
b=[10,12,13]
##补充：列表与数组的不同 python默认为列表模式
#temp=[1,2,3]
#b2=b+temp
#print(b2)
#b=np.array(b)
#temp=np.array(temp)
#b3=b+temp
#print(b3)

A=np.array(A)
b=np.array(b)
#-----jacobi方法姐方程组 p166 公式（9，10，12）-----#
U=np.triu(A,1)##上三角
L=np.triu(A.T,1);L=L.T##下三角
print('U:\n',U);print('L:\n',L);
D=np.diag(A);print("向量D：\n",D)
D=1/D;D=np.diag(D);print('矩阵D的逆:\n',D)
#公式（12）中的b,g
B=np.matmul(D,(-L-U))
g=np.dot(D,b)
#开始迭代,最多30次
matiter=30;m,n=np.shape(A)
x=np.zeros(n)
#x元素个数与A的列数相等
for i in range(matiter):
    #x=np.dot(B,x)+g
    temp=np.dot(B,x)+g
    if(max(abs(x-temp))<1e-8):
        break
    x=temp
print("x=",x)