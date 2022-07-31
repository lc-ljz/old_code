# -*- coding: utf-8 -*-
"""
Created on Fri Nov 22 11:27:39 2019

@author: LJZ
"""

import numpy as np
import matplotlib.pyplot as plt
from skimage import data
A=data.coins().astype(np.float64)
#plt.imshow(A)
[m,n]=np.shape(A)
d1=np.ones(m)*2
d2=np.ones(m-1)*(-1)
d1=np.diag(d1)
d2=np.diag(d2,1)
k=d1+d2+d2.T
d2A=np.matmul(k,A)
fig=plt.figure()
plt.subplot(2,2,1);plt.imshow(A)
plt.subplot(2,2,2);plt.imshow(d2A)
print("用外积法实现k*A")
print("用图像举例，直观表示矩阵")
d2A_2=0
for i in range(m):
    d2A_2+=np.tensordot(k[:,i],A[i,:],axes=0)
plt.subplot(2,2,3);plt.imshow(d2A_2)