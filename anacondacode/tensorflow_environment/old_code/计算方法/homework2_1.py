# -*- coding: utf-8 -*-
"""
Created on Fri Sep 13 14:09:51 2019

@author: LJZ
"""

#求(根号a)+(根号b)=p

N=10
a=2.2
b=3.4

p=max(a,b)
q=min(a,b)
for i in(1,N+1):
    r=(q/p)**2
    s=r/(4+r)
    p=p+2*s*p
    q=s*q
print(q)
print(p)