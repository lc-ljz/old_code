# -*- coding: utf-8 -*-
"""
Created on Wed Nov 24 17:12:40 2021

@author: LJZ
"""

import matplotlib.pyplot as plt

def linear_1d_images(x, y, y_pred):
    """
    w: shape = (1,1)
    b: shape = (1,1)
    
    """
    
    plt.scatter(x, y, c = 'red')
    plt.plot(x, y_pred)


def linear_2d_images(x, y, w, b):
    """
    w: shape = (2,1)
    b: shape = (1,1)
    
    """
    
    plt.scatter(x[:,0], x[:,1],c = 'red')
    
#     x_intercept = -b / w[0] # x轴截距
#     y_intercept = -b / w[1] # x轴截距
#     plt.plot([x_intercept, 0], [0, y_intercept])

def Regress_2d_images(w, b, x, y):
    for i in range(len(x)):
        if y[i] == 1:
            plt.scatter(x[i,0],x[i,1],c="blue")
        elif y[i] == 0:
            plt.scatter(x[i,0],x[i,1],c="red")
        
    x_0 = -b[0] / w[0][0] #(x_0, 0)
    x_1 = -b[0] / w[1][0] #(0, x_1)
    plt.plot([x_0, 0], [0, x_1])
    
 
    
    
    
    
    
    
    
    