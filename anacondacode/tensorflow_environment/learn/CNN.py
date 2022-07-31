# -*- coding: utf-8 -*-
"""
Created on Sun Oct 31 17:28:42 2021

@author: LJZ
"""

import tensorflow as tf

mnist = tf.keras.datasets.mnist
(train_images,train_labels),(test_images,test_labels) = mnist.load_data()

train_images = train_images.reshape(60000, 28, 28, 1)/255.
test_images = test_images.reshape(10000, 28, 28, 1)/255.

#%%
model = tf.keras.models.Sequential([
    tf.keras.layers.Conv2D(64, (3,3), activation = "relu", input_shape = (28,28,1)),
    tf.keras.layers.MaxPool2D(2,2),
    tf.keras.layers.Conv2D(32, (3,3),activation = "relu"),
    tf.keras.layers.MaxPool2D(2,2),
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dense(128, activation="relu"),
    tf.keras.layers.Dense(10,activation = "softmax")
    ])

model.summary()
#%%
model.compile(optimizer = "adam", loss = "sparse_categorical_crossentropy", metrics = ["accuracy"])
model.fit(train_images, train_labels, epochs = 5)

#%%
import matplotlib.pyplot as plt
#%%
index = 2000
image = train_images[index,:,:,0]
plt.imshow(image)

#%%
layer_outputs = [layer.output for layer in model.layers]  #提取所有层的输出
activation_model = tf.keras.models.Model(inputs = model.input, outputs = layer_outputs)
#%%
index_test= 2000
img = train_images[index,:,:,0].reshape(1,28,28,1)
forward_propagation = activation_model.predict(img)
data7 = forward_propagation[6]
print("预测数字为：" ,data7.ravel().tolist().index(max(data7.ravel().tolist())))

#%%
model.evaluate(test_images, test_labels)
















