# -*- coding: utf-8 -*-
"""
Created on Thu Nov 11 18:56:38 2021

@author: LJZ
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# %%
data_txt = pd.read_table("../resource/logit_regression_data/watermelon30a.txt")
data_txt = np.array(data_txt)
m = 17  # 样本数
d = 2   # 特征数
data = np.zeros((m, d))
y = np.zeros((m,1))

# %%

for i in range(m):
    a = np.array(str(data_txt[i][0]).split(","))
    data[i,:] = a[1:3]
    if a[3] == "是":
        y[i] = 1
    elif a[3] == "否":
        y[i] = 0
    
# a = np.array(str(data_txt[0][0]).split(","))
# data[0,:] = a[1:3]

# %%

def initial_parameters():
    w = np.zeros((d,1))
    b = 0
    return w, b

def logstic(w, x, b): 
    return x @ w + b

def sigmoid(z): # 激活函数
    return 1 / (1 + np.exp(-z))

def update_parameters(w, b, data, y, num_iterations, learning_rate):
    for i in range(num_iterations):
        logit = logstic(w, data, b)
        A = sigmoid(logit)
        # print("A = ", A)
        cost = (-1) * np.sum( y * np.log(A) + (1 - y) * np.log(1 - A) )/m
        
        dw = 1/m*(np.dot(data.T,(A - y)))
        db = (1/m)*(np.sum(A - y))
        
        if i == 49:
            print('dw:',dw)
            print('db:',db)
        
        # print(A.shape,y.shape,data.shape)
            
        w -= dw * learning_rate
        b -= db * learning_rate
        
    return w, b, cost


def predict(w,b,x):
    logit = logstic(w, x, b)
    A = sigmoid(logit)
    
    for i in range(A.shape[0]):
        if A[i][0] < 0.5:
            A[i][0] = 0
        elif A[i][0] >= 0.5:
            A[i][0] = 1
    
    return A

def plot_image(w,b,data,y_pred):
    for i in range(m):
        if y[i][0] == 1:
            plt.scatter(data[i,0],data[i,1],c="blue")
        elif y[i][0] == 0:
            plt.scatter(data[i,0],data[i,1],c="red")
        
    x_0 = -b / w[0][0] #(x_0, 0)
    x_1 = -b / w[1][0] #(0, x_1)
    plt.plot([x_0, 0], [0, x_1])
    
    
    # fig = plt.figure() # 定义三维坐标轴
    # ax = fig.add_subplot(projection='3d')
    # ax.scatter(data[:,0], data[:,1], y[:,0])
    # ax.set_xlabel("x1")
    # ax.set_ylabel("x2")
    # ax.set_zlabel("y1")
    # ax.plot(data[:,0], data[:,1], y_pred[0])
    # plt.show()


if __name__ == "__main__":
    w, b = initial_parameters()
    w, b, cost = update_parameters(w, b, data, y, num_iterations = 50, learning_rate = 1)
    
    # print("w=" , w)
    # print("b=" , b)
    
    y_pred = predict(w, b, data)
    
    plot_image(w,b,data,y_pred)
    # print(y_pred)
    # print(cost)




# %%

# 答案:牛顿法
    
# import numpy as np
# import math
# import matplotlib.pyplot as plt

# data_x = [[0.697, 0.460], [0.774, 0.376], [0.634, 0.264], [0.608, 0.318], [0.556, 0.215], [0.403, 0.237],
#           [0.481, 0.149], [0.437, 0.211],[0.666, 0.091], [0.243, 0.267], [0.245, 0.057], [0.343, 0.099], 
#           [0.639, 0.161], [0.657, 0.198],[0.360, 0.370], [0.593, 0.042], [0.719, 0.103]
#           ]
# data_y = [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]

# def combine(beta, x):
#     x = np.mat(x + [1.]).T
#     return beta.T * x

# def predict(beta, x):
#     return 1 / (1 + math.exp(-combine(beta, x)))

# def p1(beta, x):
#     return math.exp(combine(beta, x)) / (1 + math.exp(combine(beta, x)))

# beta = np.mat([0.] * 3).T

# steps = 50

# for step in range(steps):
#     param_1 = np.zeros((3, 1))
#     for i in range(len(data_x)):
#         x = np.mat(data_x[i] + [1.]).T
#         param_1 = param_1 - x * (data_y[i] - p1(beta, data_x[i]))
#     param_2 = np.zeros((3, 3))
#     for i in range(len(data_x)):
#         x = np.mat(data_x[i] + [1.]).T
#         param_2 = param_2 + x * x.T * p1(beta, data_x[i]) * (1 - p1(beta, data_x[i]))
#     last_beta = beta
#     beta = last_beta - param_2.I * param_1
#     if np.linalg.norm(last_beta.T - beta.T) < 1e-6:
#         print(step)
#         break

# for i in range(len(data_x)):
#     if data_y[i] == 1:
#         plt.plot(data_x[i][0], data_x[i][1], 'ob')
#     else:
#         plt.plot(data_x[i][0], data_x[i][1], '^g')
# w_0 = beta[0, 0]
# w_1 = beta[1, 0]
# b = beta[2, 0]
# print(w_0, w_1, b)
# x_0 = -b / w_0 #(x_0, 0)
# x_1 = -b / w_1 #(0, x_1)
# plt.plot([x_0, 0], [0, x_1])
# plt.show()













