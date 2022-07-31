# -*- coding: utf-8 -*-
"""
Created on Thu Jun 11 19:22:32 2020

@author: LJZ
"""

from lr_utils import load_dataset
import matplotlib.pyplot as plt
import tensorflow as tf
gpu = tf.config.experimental.list_physical_devices('GPU')
tf.config.experimental.set_memory_growth(gpu[0], True)

# physical_devices = tf.config.experimental.list_physical_devices('GPU')
# assert len(physical_devices) > 0, "Not enough GPU hardware devices available"
# tf.config.experimental.set_memory_growth(physical_devices[0], True)

import numpy as np

x_train, y_train, x_test, y_test, classes = load_dataset()
index = 0
#plt.imshow(x_train[index])


#%%
x_train = x_train/255.
y_train = y_train/255.
model = tf.keras.Sequential()
model.add(tf.keras.layers.Dense(1,input_shape=(64,64,3),activation = tf.nn.relu))
model.summary()
model.compile(optimizer='sgd', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
y_train = np.squeeze(y_train)
model.fit(x_train,y_train,epochs = 2)
