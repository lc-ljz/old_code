# -*- coding: utf-8 -*-
"""
Created on Sat Sep 14 14:28:18 2019

@author: LJZ
"""
#反例
import numpy as np

v=1-np.exp(-1)
v=v+0.0001
for i in range(1,13):
    v=1-i*v

print(v)
