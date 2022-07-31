# -*- coding: utf-8 -*-
"""
Created on Thu Jun 11 18:49:27 2020

@author: LJZ
"""
import numpy as np
import matplotlib.pyplot as plt

x = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5]
x = np.array(x)
y =2 * x + np.random.randn(11)
plt.scatter(x,y)


def sigmoid(z):
    return 1/(1 + np.exp(-z))

m = 11
w = 0
b = 0
learning_rate = 0.01
for i in range(10):
    A = sigmoid(np.dot(w,x) + b)
    #cost = -(1.0/m) * (np.sum(y * np.log(A) + (1 - y) * np.log(1 - A)))
    dw = 1/m*(np.dot(x,(A - y).T))
    db = (1/m)*(np.sum(A - y))
    w = w - learning_rate*dw
    b = b - learning_rate*db
print(w)
print(b)

y1 = w * x + b
plt.plot(x,y1)
plt.show()