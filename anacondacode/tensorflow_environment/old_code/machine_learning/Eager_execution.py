#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu May 14 13:34:52 2020

@author: guzhenghong
"""


import tensorflow as tf
import numpy as np
gpu = tf.config.experimental.list_physical_devices('GPU')
tf.config.experimental.set_memory_growth(gpu[0], True)
# print(tf.executing_eagerly())
# x = np.array([[2.]])
# m = tf.matmul(x, x)
# print("hello. {}".format(m))
# a = tf.constant([[1, 2], [3, 4]])
# print(a)
# b = tf.add(a, 1)
# print(b)
# w = tf.Variable()
# with tf.GradientTape() as tape:
#     loss = tf.sin(w)

# grad = tape.gradient(loss, w)
# print(grad)
# (x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()
# dataset = tf.data.Dataset.from_tensor_slices((
#     tf.cast(x_train[..., tf.newaxis]/255., tf.float32),
#     tf.cast(y_train, tf.int64)))
# dataset = dataset.shuffle(1000).batch(32)


x = [[1, 2], [3, 4]]
x = tf.data.Dataset.from_tensor_slices(x)
tf.print(list(x.as_numpy_iterator()))

a = 1.0
b = 2.0
d = {"a":(2,2), "b":3}
import collections
point = collections.namedtuple("Point", ["x", "y"])
e = point(1, 2)
f = tf.data.Dataset.range(10)
g = f.take(3)
tf.print(list(g.as_numpy_iterator()))