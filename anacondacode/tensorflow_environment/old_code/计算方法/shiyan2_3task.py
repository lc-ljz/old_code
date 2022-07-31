# -*- coding: utf-8 -*-
"""
Created on Fri Nov 29 10:35:09 2019

@author: LJZ
"""
#page166_1_2
import numpy as np

A=[[2,-1,-1],[-1,2,0],[-1,2,1]]
b=[0,1,0]
A=np.array(A)
b=np.array(b)

D=np.diag(A)
D=np.diag(D)
B=D-A
maxiter=30
x=np.zeros(np.size(A,1))
for i in range(maxiter):
    for j in range(len(x)):
        x[j]=(np.dot(B[j,:],x)+b[j])/D[j,j]
        
print(x)

#import numpy as np
#
#A=[[2,-1,-1],[-1,2,0],[-1,2,1]]
#b=[0,1,0]
#A=np.array(A);b=np.array(b)
#D=np.diag(A);D=np.diag(D)
##利用公式7
#B=D-A
#m,n=np.shape(A);x=np.zeros(n)
#maxiter=30
#
#for i in range(maxiter):
#    temp=1*x
#    for j in range(n):
#        x[j]=(np.dot(B[j,:],x)+b[j])/D[j,j]
#    if(max(abs(x-temp))<1e-5):
#        break
#print("x=",x)