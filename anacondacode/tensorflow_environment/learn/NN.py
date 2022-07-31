# -*- coding: utf-8 -*-
"""
Created on Tue Nov  2 15:15:42 2021

@author: LJZ
"""

import tensorflow as tf

#%%
mnist = tf.keras.datasets.mnist
(train_images,train_labels),(test_images,test_labels) = mnist.load_data()

train_images,test_images = train_images/255.0,test_images/255.0

#%%
model = tf.keras.models.Sequential([
    tf.keras.layers.Flatten(input_shape=(28,28)),
    tf.keras.layers.Dense(128,activation="relu"),
    tf.keras.layers.Dropout(0.2),
    tf.keras.layers.Dense(10,activation="softmax")
    ])

model.compile(optimizer='adam',loss="sparse_categorical_crossentropy",metrics=['accuracy'])

model.fit(train_images,train_labels,epochs=5)
model.evaluate(test_images,test_labels,verbose=2)

#%%
model.summary()

# %%
import matplotlib.pyplot as plt

for i in range(25):
    plt.subplot(5,5,i+1)
    plt.xticks([])
    plt.yticks([])
    plt.xlabel(train_labels[i])
    plt.imshow(train_images[i,:,:])
    
    
    