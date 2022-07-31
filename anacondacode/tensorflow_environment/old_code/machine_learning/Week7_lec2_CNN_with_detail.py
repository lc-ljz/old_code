# -*- coding: utf-8 -*-
"""
Created on Sun Apr 12 22:32:03 2020

@author: LJZ
"""

import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

mnist = tf.keras.datasets.fashion_mnist
(train_images,train_labels),(test_images,test_labels) = mnist.load_data()

#%%
def display(h,w):
    m = 28
    A = np.ones((m*h+h+1,m*w+w+1))*255
    for i in range(h):
        for j in range(w):
            A[i*(m+1)+1:(i+1)*(m+1),j*(m+1)+1:(j+1)*(m+1)] = test_images[i*h+j, :, :]     
    plt.imshow(A)
display(5,5)
#%%

train_images,test_images = train_images/255.,test_images/255.

train_images = train_images.reshape(60000,28,28,1)
test_images = test_images.reshape(10000,28,28,1)

#%%
def relu(x):
    return x * (x >= 0)
x = np.linspace(-5,5)
plt.plot(x,relu(x))
#%%
model = tf.keras.models.Sequential([
    tf.keras.layers.Conv2D(64,(3,3),activation="relu",input_shape=(28,28,1)),
    tf.keras.layers.MaxPooling2D(2,2),
    tf.keras.layers.Conv2D(32,(3,3),activation='relu'),
    tf.keras.layers.MaxPooling2D(2,2),
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dense(128,activation='relu'),
    tf.keras.layers.Dense(10,activation='softmax')
    ])
model.compile(optimizer='adam',loss='sparse_categorical_crossentropy',metrics=['accuracy'])
model.fit(train_images, train_labels, epochs=5)
#%%
model.summary()

#%%
w0 = model.layers[0].get_weights()[0]
print(w0[:,:,0,0])
#%%
index = 0
img = train_images[index,:,:,0].reshape(1,28,28,1)
plt.imshow(img[0,:,:,0])

#%%
layer_outputs = [layer.output for layer in model.layers]
activation_model = tf.keras.models.Model(inputs = model.input,outputs = layer_outputs)
forward_propagation_result = activation_model.predict(img)

#%%
def show(h, w, m, data):  # 1<n<8
    A = np.ones((m*h+(h+1), m*w+(w+1)))
    for i in range(h):
        for j in range(w):
            A[i*(m+1)+1:(i+1)*(m+1),j*(m+1)+1:(j+1)*(m+1)] = data[0,:,:,i*h+j]
    plt.imshow(A, cmap='inferno')
    return A
data = forward_propagation_result[0]
A = show(8, 8, 26, data)
#%%
data2 = forward_propagation_result[1]
B = show(8, 8, 13, data2)
#%%
data3 = forward_propagation_result[2]
C = show(4, 8, 11, data3)
#%% 
data4 = forward_propagation_result[3]
D = show(4, 8, 5, data4)
#%%
w3 = model.layers[2].get_weights()[0]
b3 = model.layers[2].get_weights()[1]
#%%
data2 = np.squeeze(data2)
#%%
"""
理解 w3: 即32个卷积核  每个卷积核是(3, 3, 64) 
因为上面输入: 图像是 (26, 26, 64) 64 是Channel
比如彩色图像(R,G,B)三个Channel,  每个卷积需要是(3, 3, 3)
我们在MATLAB里做的卷积实际是 (3, 3) 复制成了 (3, 3, 3), 三个Channel里用的卷积是一样的
imfilter(A1, F), imfilter(A2, F), imfilter(A3, F)
这里的64个卷积是不一样的，每个卷积核是64个信道
conv2(A1, F1), conv2(A2, F2), conv2(A3, F3), ...., conv2(A64, F64) 这是单个卷积
"""
img = np.zeros([64,11,11])
def conv2d(filt, img):
    m, n = np.shape(img)
    A = np.zeros((m-2, n-2))
    for i in range(1, m-1):
        for j in range(1, n-1):
            temp = img[i-1:i+2,j-1:j+2]
            A[i-1,j-1] = np.sum(temp*filt)
    return A
for i in range(64):
    img[i, :, :] = conv2d(w3[:, :, i, 0], data2[:, :, i])

output = np.sum(img, axis=0) # 64个卷积按信道叠加在一起，

Z = output + b3[0]# 相当于wx + b
relu_Z = Z * (Z >= 0)
#%%
# relu_Z 和model_Z 相等， 可以自己查看
model_Z = data3[0, :, :, 0]











