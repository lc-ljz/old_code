# -*- coding: utf-8 -*-
"""
Created on Wed Nov 24 16:12:55 2021

线性回归

@author: LJZ
"""
import numpy as np
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
# from show_image import linear_1d_images
# from show_image import linear_2d_images

# %%
# b = 0.1

x_data = np.random.rand(10,2) # 均匀分布

# y_data = 0.3 * x_data + 0.1 + (np.random.random()-0.5)
y_data = x_data @ [0.2,0.3] + 0.1 + (np.random.random()-0.5)/2


# %%

# x_data = np.array([5, 15, 25, 35, 45, 55]).reshape((-1, 1))
# y_data = np.array([5, 20, 14, 32, 22, 38])

# x = [[0, 1], [5, 1], [15, 2], [25, 5], [35, 11], [45, 15], [55, 34], [60, 35]]
# y = [4, 5, 20, 14, 32, 22, 38, 43]
# x_data, y_data = np.array(x), np.array(y)

# %%
model = LinearRegression()
model.fit(x_data,y_data)
y_pred = model.predict(x_data)

# %%
r_sp = model.score(x_data,y_data)
print(r_sp)
print('slope(系数):', model.coef_)
print('intercept(截距):', model.intercept_)

# %%
# 一元时画图
# linear_1d_images(x_data,y_data,y_pred)

# 二元
# linear_2d_images(x_data,y_data, model.coef_, model.intercept_)

# 3d图
# fig = plt.figure() # 定义三维坐标轴
# ax = fig.add_subplot(projection='3d')
# y_data = y_data.reshape(10,1)
# ax.scatter(x_data[:,0], x_data[:,1], y_data[:,0],c="red")
# ax.set_xlabel("x1")
# ax.set_ylabel("x2")
# ax.set_zlabel("y1")
# ax.plot(x_data[:,0], x_data[:,1], y_pred[0])
# plt.show()



