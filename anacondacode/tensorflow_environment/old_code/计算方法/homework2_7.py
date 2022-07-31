# -*- coding: utf-8 -*-
"""
Created on Sat Sep 14 14:34:34 2019

@author: LJZ
"""
import numpy as np

v=1-np.exp(-1)
v=v+1e-8
j=20
for i in range(1,j+1):
    v=1-i*v

print(v)
