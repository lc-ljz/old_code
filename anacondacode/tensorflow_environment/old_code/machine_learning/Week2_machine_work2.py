# -*- coding: utf-8 -*-
"""
Created on Tue Mar  3 14:22:52 2020

@author: LJZ
"""
#1.
#import numpy as np
#s1=[1,1,1]
#s2=[0,1,1]
#s3=[0,0,1]
#s1=np.array(s1)
#s2=np.array(s2)
#s3=np.array(s3)
#S=np.c_[s1,s2,s3]
#x =[3,4,5]
#b=S@x

#2.
#import numpy as np
#s1=[1,1,1]
#s2=[0,1,1]
#s3=[0,0,1]
#s1=np.array(s1)
#s2=np.array(s2)
#s3=np.array(s3)
#S=np.c_[s1,s2,s3]
#b1=[1,1,1]
#b2=[1,4,9]
#b1=np.array(b1)
#b2=np.array(b2)
#y1=np.linalg.solve(S,b1)
#y2=np.linalg.solve(S,b2)
#
#S=np.round(np.random.rand(5,)*10)*2+1
#n=len(S)
#d=np.triu(np.ones(n));
#d=d.T
#b=d@S

#3.
#import numpy as np
#c=[1,4,9]
#c=np.array(c)
#s1=[1,1,1]
#s2=[0,1,1]
#s3=[0,0,1]
#s1=np.array(s1)
#s2=np.array(s2)
#s3=np.array(s3)
#S=np.c_[s1,s2,s3]
#
#y=np.linalg.solve(S,c)
#S1=np.linalg.inv(S)

#4.
import numpy as np
n=5
D1=np.triu(np.ones(n))
D1=D1.T

d1=np.eye(n)
d2=np.diag(np.ones(n-1),-1)
D2=d1-d2






























