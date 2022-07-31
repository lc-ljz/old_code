# -*- coding: utf-8 -*-
"""
Created on Wed Apr  1 16:26:29 2020

@author: LJZ
"""
#from numpy import eye,diag,ones,convolve,dot
#a = [1,-1]
#b = [1,2,3,4,5,6,7,8,9]
#c1 = convolve(a,b)
#
#n = len(b)
#d = eye(n) - diag(ones(n - 1),-1)
#c2 = dot(d,b)
#
#print("c1 = ",c1)
#print("c2 = ",c2)

import scipy
#import cv2
from scipy.signal import convolve2d
import numpy as np

#A = cv2.imread("c.tif")
#m,n,k = A.shape
#cv2.imshow('imag',A)

# A = cv2.imread("c.tif",0)
# m,n = A.shape
# a = [1,-1]
# cv2.imshow("A",A)

A = np.array([[1,2],[3,4],[5,6]])
B = np.array([[3,4],[5,6],[7,8]])
#C = scipy.signal.convolve2d(B,A)
C = convolve2d(A,B)

print(C)




















