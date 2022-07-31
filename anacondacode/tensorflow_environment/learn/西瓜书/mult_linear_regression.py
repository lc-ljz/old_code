# -*- coding: utf-8 -*-
"""
Created on Tue Nov  9 14:16:10 2021

@author: LJZ
"""

import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# %%
# 随机生成三维数据
x_data = np.random.rand(100, 2) # 默认生成一个0到1之间，符合均匀分布的浮点数
y_data = [0.1, 0.2] @ x_data.T + 0.3

# %%
# 显示
def plot_image(x_data, y_pred):
    fig = plt.figure() # 定义三维坐标轴
    ax = fig.add_subplot(projection='3d')
    ax.scatter(x_data[:,0], x_data[:,1], y_data[0])
    ax.set_xlabel("x1")
    ax.set_ylabel("x2")
    ax.set_zlabel("y1")
    ax.plot(x_data[:,0], x_data[:,1], y_pred[0])
    plt.show()

    # plt.scatter(x_data[:,0],x_data[:,1], c="blue")
    # x_0 = -b / w[0][0] #(x_0, 0)
    # x_1 = -b / w[1][0] #(0, x_1)
    # plt.plot([x_0, 0], [0, x_1])


# %%

m = x_data.shape[0] # 样本数
d = x_data.shape[1] # 维度

w = np.zeros((d,1))
b = np.zeros(1)

# %%

def count_y_prediction(w,b,x):
    y_pred = w.T @ x.T + b
    return y_pred

def cost_function(y_pred, y):
    error = (y_pred - y).T @ (y_pred - y)/m
    return error

def update_grad(x, w, b, y, y_pred, learning_rate):
    dw = np.zeros((d,1))
    db = 0
    
    
    y = y.reshape(1,m)
    
    cost = np.sum((y_pred - y)**2)/(2*m)
    
    dw = np.sum( (y_pred - y).T*x )/m
    dw = dw.T
    
    db = np.sum( (y_pred - y).T )/m
    
    # print(y_pred.shape,y.shape,x.shape)
    # print(dw)
    
    w -= learning_rate * dw
    b -= learning_rate * db
    return w,b,cost

def linearRegression(w,b,x,y,learning_rate = 0.1):
    y_pred = count_y_prediction(w,b,x) # 预期值
    w, b, cost = update_grad(x, w, b, y, y_pred, learning_rate)
    return w,b,cost


if __name__ == "__main__":
    for i in range(100):
        w,b,cost = linearRegression(w, b, x_data, y_data)
    print(w,b,cost)
    y_pred = count_y_prediction(w,b,x_data)
    
    # plt.scatter(x_data[:,0],x_data[:,1], c="blue")
    # plot_image(x_data, y_pred)
    
    
# %%
#



# import numpy as np
# import matplotlib.pyplot as plt

# def get_fake_data(iter,show=False):
#     X = np.random.rand(iter)*20
#     noise = np.random.randn(iter)
#     y = 0.5 * X + noise
#     if show:
#         plt.scatter(X,y)
#         plt.show()
#     return X,y

# def count_y_prediction(X, w, b):
#     y_pred = w*X + b
#     # print(y_pred)
#     return y_pred

# def compete_error_for_given_points(y, y_pred):
#     error = (y - y_pred) ** 2
#     error = error.sum() / len(y)
#     # print(error)
#     return error

# def compete_gradient_and_update(X, w, b, lr):
#     w_gradient = 0
#     b_gradient = 0
#     N = len(X)
#     for i in range(N):
#         w_gradient += 2 * (w * X[i] + b - y[i]) * X[i]
#         b_gradient += 2 *(w * X[i] + b - y[i])
#     w -= lr * w_gradient / N
#     b -= lr * b_gradient / N
#     return w,b

# def linaerRegression(X, y, w, b, i, lr = 0.001):
#     # print(w,b)
#     y_pred = count_y_prediction(X, w, b)
#     error = compete_error_for_given_points(y, y_pred)
#     print("loss:", error)
#     w, b = compete_gradient_and_update(X, w, b, lr)
#     # print(w,b)
#     y_pred = count_y_prediction(X, w, b)
#     draw(X, y, y_pred)

# def draw(X, y, y_pred,final=True):
#     # plt.ion()
#     plt.clf()  # 清除当前 figure 的所有axes，但是不关闭这个 window
#     plt.scatter(X, y, c="blue")
#     plt.plot(X, y_pred, c="blue")
#     if final:
#         plt.pause(0.2) 
#         # plt.close()
#     else:
#         plt.show()

# if __name__ == "__main__":
#     iter = 50
#     X,y = get_fake_data(iter)
#     w = np.random.randn(1)
#     b = np.zeros(1)
#     plt.ion() 
#     for i in range(30):
#         linaerRegression(X, y, w, b, i)
#     plt.ioff()
#     y_pred = count_y_prediction(X, w, b)
#     draw(X,y,y_pred,0)
    
