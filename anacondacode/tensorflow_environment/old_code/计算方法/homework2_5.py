# -*- coding: utf-8 -*-
"""
Created on Sat Sep 14 11:47:20 2019

@author: LJZ
"""

##error
import matplotlib.animation as plt
import numpy as np
pi=np.pi

#-u''=u的动态图
h=animatedline
v=[0,1]
delta=2*pi/128
axis([-8,8,-8,8])
n=2000
for i in range(1,n+1):
    addpoints(h,v(1),v(2))
    v=[1,delta,-delta,1]*v
    #v = [1,-delta;delta,1]\v;#内旋
    drawnow
