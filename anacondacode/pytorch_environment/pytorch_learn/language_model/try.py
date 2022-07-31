# -*- coding: utf-8 -*-
"""
Created on Mon Mar  7 14:35:04 2022

@author: LJZ
"""
a = {}

a[1] = "第一个"
a[2] = "第二个"
a[3] = "第三个"

if not 1 in a:
    print("not 一 in a")
else:
    print("一 in a")