# -*- coding: utf-8 -*-
"""
Created on Mon Nov  8 13:57:42 2021

@author: LJZ
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# %%
# data = pd.read_csv("./resource/linear_data/train_true.csv") # 有离群点和缺失值
data = pd.read_csv("../resource/linear_data/train.csv")

# print(data.isnull().sum()) # 查看各个特征缺失的情况

# %%
# 缺失值处理
data_null = data.isnull().sum()
data_null = np.array(data_null)
if 1 in data_null:  # 有缺失值
    print("有缺失值")
    data_copy = data.copy()
    data_copy["y"].fillna(data["y"].median(skipna=True),inplace=True) #特征缺失，用中位数代替
    data = data_copy
else:
    print("无缺失值")
# print(data.isnull().sum()) # 查看各个特征缺失的情况

# %%
# 离群点处理 (可以聚类)


# %%
train_x = np.array(data["x"])
train_y = np.array(data["y"])

# %%
# plt.scatter(train_x,train_y,s=5)
# plt.errorbar(train_x, train_y, fmt='ok', ecolor='gray')

# %%
# 数据性质
d = 1 # 属性数
m = train_x.shape[0]  # 样本数

# 参数初始化
w = 0
b = 0

train_x = train_x.reshape(m,d)
train_y = train_y.reshape(m,1)

# 均值
train_x_aver = ( sum(train_x) )/m

# 最小二乘法求参数
w1 = train_y.T @ (train_x - train_x_aver)
w2 = train_x.T @ train_x - ( sum(train_x) * sum(train_x) )/m
w = w1 / w2

b = sum( train_y - w * train_x ) / m

# %%
plt.scatter(train_x, train_y, s=5)
plt.plot(train_x, w * train_x + b)


# %%
# 测试

test = pd.read_csv("./resource/linear_data/test.csv")
test_x = np.array(test["x"])
test_y = np.array(test["y"])

# 格式
test_x = test_x.reshape(test_x.shape[0],d)
test_y = test_y.reshape(test_y.shape[0],1)

# 画图

plt.scatter(test_x, test_y, s=5)
plt.plot(test_x, w * test_x + b)



