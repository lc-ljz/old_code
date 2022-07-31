# -*- coding: utf-8 -*-
"""
Created on Fri Nov 29 10:09:20 2019

@author: LJZ
"""

import numpy as np
d1=np.arange(1,6)#1,2,3,4,5
d2=np.ones(4)
A=np.diag(d1)+np.diag(d2,1)+np.diag(d2,-1)

def slu(A):#只处理方阵
    m,n=np.shape(A)
    if(m!=n):
        print("A is not square")
        return 0
    else:
        L=np.eye(m)
        for k in range(m):
            L[k+1:,k]=A[k+1:,k]/A[k,k]
            a=L[k+1:,k];b=A[k,:]
            temp=np.tensordot(a,b,axes=0)
            A[k+1:,:]-=temp
    U=A
    return L,U
           
#d=np.ones([4,2])
#d=slu(d)
L,U=slu(A)
A2=np.matmul(L,U)