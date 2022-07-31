# -*- coding: utf-8 -*-
"""
Created on Fri May 15 09:14:17 2020

@author: LJZ
"""

import tensorflow as tf

(x_train,y_train),(x_test,y_test) = tf.keras.datasets.fashion_mnist.load_data()
x_train, x_test = x_train/255. ,x_test/255.

#%%
batch_size = 32
dataset = tf.data.Dataset.from_tensor_slices(x_train).shuffle(3000) #shuffle打乱数据
