# -*- coding: utf-8 -*-
"""
Created on Sun Apr 19 18:43:49 2020

@author: LJZ
"""

import tensorflow as tf
import matplotlib.pyplot as plt

mnist = tf.keras.datasets.mnist
(train_images,train_labels),(test_images,test_lables) = mnist.load_data()

train_images,test_images = train_images/255.,test_images/255.

train_images = train_images.reshape(60000,28,28,1)
test_images = test_images.reshape(10000,28,28,1)

model = tf.keras.models.Sequential([
    tf.keras.layers.Conv2D(64,(3,3),activation = 'relu',input_shape = (28,28,1)),
    tf.keras.layers.MaxPooling2D(2,2),
    tf.keras.layers.Conv2D(32,(3,3),activation = 'relu'),
    tf.keras.layers.MaxPooling2D(2,2),
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dense(128,activation = 'relu'),
    tf.keras.layers.Dense(10,activation= 'softmax')
     ])

model.compile(optimizer = 'adam', loss = 'sparse_categorical_crossentropy', metrics = ['accuracy'])
model.fit(train_images,train_labels,epochs = 5)
#%%
model.summary()
#%% 
index = 0
img = train_images[index,:,:,0].reshape(1,28,28,1)
#%%
index = 0
plt.imshow(train_images[index,:,:,0]) #显示图像
#%%
layer_outputs = [layer.output for layer in model.layers]  #提取所有层的输出
activation_model = tf.keras.models.Model(inputs = model.input,outputs = layer_outputs)
forward_propagation = activation_model.predict(img)
#%%
import numpy as np
def conv2d(filt, img):
    m,n = np.shape(img)
    A = np.zeros((m-2, n-2))
    for i in range(1, m-1):
        for j in range(1, n-1):
            temp = img[i-1:i+2,j-1:j+2]
            A[i-1,j-1] = np.sum(temp*filt)
    return A
#%%
from numpy.lib.stride_tricks import as_strided

def pool2d(A, padding):
    A = np.pad(A, padding, mode='constant')

    output_shape = ((A.shape[0] - 2)//2 + 1,
                    (A.shape[1] - 2)//2 + 1)
    kernel_size = (2, 2)
    A_w = as_strided(A, shape = output_shape + kernel_size, 
                        strides = (2*A.strides[0],
                                   2*A.strides[1]) + A.strides)
    A_w = A_w.reshape(-1, *kernel_size)

    return A_w.max(axis=(1,2)).reshape(output_shape)

#%%
data1 = forward_propagation[0]  #第一层输出
data2 = forward_propagation[1]  #第二层输出
data3 = forward_propagation[2]  #第三层输出
data4 = forward_propagation[3]  #第四层输出
data5 = forward_propagation[4]  #第五层输出
data6 = forward_propagation[5]  #第六层输出
data7 = forward_propagation[6]  #第七层输出
#%%
w1 = model.layers[0].get_weights()[0]
b1 = model.layers[0].get_weights()[1]
w3 = model.layers[2].get_weights()[0]
b3 = model.layers[2].get_weights()[1]
w6 = model.layers[5].get_weights()[0]
b6 = model.layers[5].get_weights()[1]
w7 = model.layers[6].get_weights()[0]
b7 = model.layers[6].get_weights()[1]
#%%

img1 = np.zeros([64,26,26])
for i in range(64):
    img1[i,:,:] = conv2d(w1[:,:,0,i],train_images[0,:,:,0])
output1 = np.sum(img1, axis=0)
Z1 = output1 + b1[0]
relu_Z1 = Z1 * (Z1 >= 0)
model_Z1 = data1[0,:,:,0]
#%%

pooling1 = pool2d(data1[0,:,:,0], padding=0)
model_Z2 = data2[0,:,:,0]
#%%

img3 = np.zeros([64,11,11])
for i in range(64):
    img3[i, :, :] = conv2d(w3[:, :, i, 0], data2[0,:, :, i])
output3 = np.sum(img3, axis=0)  
Z3 = output3 + b3[0]
relu_Z3 = Z3 * (Z3 >= 0)
model_Z3 = data3[0, :, :, 0]
#%%

pooling2 = pool2d(data3[0,:,:,0], padding=0)
model_Z4 = data4[0,:,:,0]
#%%

def softmax(x):
    return np.exp(x)/np.sum(np.exp(x))
#%%
Z6 = np.dot(w6.T, data5.T) + b6[0]
relu_Z6 = Z6 * (Z6 >= 0)
relu_Z6 = relu_Z6.T
#%%
Z7 = np.dot(w7.T, data6.T) + b7[0]
Z7 = softmax(Z7).T





