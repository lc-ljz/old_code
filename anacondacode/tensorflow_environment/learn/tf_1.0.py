# -*- coding: utf-8 -*-
"""
Created on Tue Nov  2 17:01:51 2021

@author: LJZ
"""

import tensorflow as tf
import numpy as np

#%%
#随机生成100个点
x_data = np.float32(np.random.rand(2,100))
y_data = np.dot([0.100,0.200],x_data) + 0.300

#%%
#构造线性模型
b = tf.Variable(tf.zeros([1]))
w = tf.Variable(tf.random.uniform([1,2],-1.0,1.0))
y = tf.matmul(w,x_data) + b
tf.compat.v1.disable_eager_execution()
#最小化方差
loss = tf.reduce_mean(tf.square(y - y_data))
optimizer = tf.compat.v1.train.GradientDescentOptimizer(0.5) #参数为学习率,原始梯度下降法
train = optimizer.minimize(loss)

#初始化变量
init = tf.compat.v1.initialize_all_variables()

#启动图
session = tf.compat.v1.Session()
session.run(init)

#拟合平面
for step in range(0,201):
    session.run(train)
    if step % 20 == 0:
        print(step,session.run(w),session.run(b))
