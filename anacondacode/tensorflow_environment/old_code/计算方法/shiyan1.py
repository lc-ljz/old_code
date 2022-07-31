# -*- coding: utf-8 -*-
"""
Created on Fri Nov 22 10:18:55 2019

@author: LJZ
"""

a=1;b=2
print(a+b,a-b,a*b,a/b)
#向量运算 array(数组运算)
#clear 清理console
import numpy as np
u=np.arange(1,4)
v=np.arange(2,8,2)
print(u+v,u-v,u*v,u/v)#点运算
print("python里的运算符默认是点运算")
print("相当于matlab里的.*和./")
print("单引号和双引号无区别")
#向量间的运算
import numpy as np
n=5
x=np.arange(1,n)

x1=np.linspace(1,n-1)
x2=np.linspace(1,n-1,4)

print("arange(n),不包括n,注意ones用法")
y=np.ones(n-1)
s1=np.dot(x,y);s2=np.dot(y,x)
s3=x.dot(y);s4=y.dot(x)
print("直接在variable explorer查看结果")
print("dot:内积,inner product")
s5=sum(x*y);s6=sum(y*x)
s7=0;
for i in range(len(x)):
    s7+=x[i]*y[i]
    
#矩阵向量运算
