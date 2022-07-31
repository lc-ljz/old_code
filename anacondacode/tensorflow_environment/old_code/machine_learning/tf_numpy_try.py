# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 20:10:43 2020

@author: LJZ
"""
import tensorflow as tf
import numpy as np

x = np.arange(10).reshape(5,2)
L = tf.keras.layers.Dense(1,activation = 'sigmoid')
y = L(x).numpy()
print(x)

w = L.get_weights()[0]
b = L.get_weights()[1]

z = np.dot(w.T,x.T) + b[0]
z = 1/(1+np.exp(-z))

print(y)
print(z)

#%%
L2 = tf.keras.layers.Dense(10,activation = 'softmax')
y2 = L2(x).numpy()

w2 = L2.get_weights()[0]
b2 = L2.get_weights()[1]

z2 = x@w2 + b2
a2 = np.exp(z2)

den = np.sum(a2, axis=1)

softmax = a2.T/den
print(y2.T)
print(softmax)
