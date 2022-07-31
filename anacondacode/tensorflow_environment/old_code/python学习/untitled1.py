# -*- coding: utf-8 -*-
"""
Created on Mon Mar  8 20:29:43 2021

@author: LJZ
"""

# 例子1-1

x = input('请输入一个三位自然数:')
if x.isdigit() is True:
    if len(x) == 3:
        x = int(x)
        print('百位:',x//100,end=' ')
        print('十位:',x%100//10,end=' ')
        print('个位:',x%100%10)
    else:
        print('请输入三位数字')
else:
    print('请输入数字!')

#%%
# 例子1-2

import math
x = input('请输入两边长，及其夹角:')
a, b, thera = map(float, x.split())
c = math.sqrt(a**2 + b**2 - 2*a*b*math.cos(thera*math.pi/180))
print('c = ',c)

#%%
# 例子1-3

s = input('请输入3个英文字母:')
a, b, c = s.split(',')

#if a > b:
#    a, b = b, a
#if a > c:
#    a, c = c, a
#if b > c:
#    b, c = c, b

a, b, c = sorted([a,b,c])

print('字典顺序: ',a,b,c)

#%%





























