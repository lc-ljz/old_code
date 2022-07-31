# -*- coding: utf-8 -*-
"""
Created on Tue Nov  2 17:25:07 2021

@author: LJZ
"""

import tensorflow as tf
from tensorflow import keras

import numpy as np
import matplotlib.pyplot as plt

print(tf.__version__)
#%%
fash_mnist = keras.datasets.fashion_mnist
(train_images,train_labels),(test_images,test_labels) = fash_mnist.load_data()

train_images,test_images = train_images/255.0,test_images/255.0

class_names = ['T-shirt/top', 'Trouser', 'Pullover', 'Dress', 'Coat',
               'Sandal', 'Shirt', 'Sneaker', 'Bag', 'Ankle boot']

#%%
# plt.imshow(train_images[0])
# plt.colorbar()

#%%
# plt.figure(figsize=(10,10))
# for i in range(25):
#     plt.subplot(5, 5, i+1)
#     plt.xticks([])
#     plt.yticks([])
#     plt.imshow(train_images[i],plt.cm.binary)
#     plt.xlabel(class_names[train_labels[i]])
    
    
#%%

model = keras.models.Sequential([
    keras.layers.Flatten(input_shape=(28,28)),
    keras.layers.Dense(128,activation="relu"),
    keras.layers.Dense(10)
    ])

model.compile(optimizer="adam",loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              metrics=["accuracy"])

model.fit(train_images,train_labels,epochs=10)

#%%

test_loss,test_acc = model.evaluate(test_images,test_labels,verbose=2)
print('\nTest accuracy:', test_acc)
#%%

probability_model = keras.models.Sequential([model,keras.layers.Softmax()])
predictions = probability_model.predict(test_images)

#%%
def plot_image(i,predictions_array,true_label,image):
    true_label,image = true_label[i],image[i]
    plt.grid(False)  #不显示网格线
    plt.xticks([])
    plt.yticks([])
    
    plt.imshow(image,cmap=plt.cm.binary)
    
    predict_label = np.argmax(predictions_array)
    color = ""
    if predict_label == true_label:
        color = "blue"
    else:
        color = "red"
    
    plt.xlabel("{} {:2.0f}% ({})".format(class_names[predict_label],
                                         100*np.max(predictions_array),
                                         class_names[true_label]),color=color)
    
def plot_value_array(i,predictions_array,true_label):
    true_label = true_label[i]
    plt.grid(False)
    plt.xticks(range(10)) # x轴具体值
    plt.yticks([])
    
    this_plot = plt.bar(range(10),predictions_array,color="#777777") #柱状图
    plt.ylim([0,1]) #y轴范围
    
    predict_label = np.argmax(predictions_array)
    this_plot[predict_label].set_color('red')
    this_plot[true_label].set_color('blue')

#%%
# i = 12
# plt.figure(figsize = (6,3))
# plt.subplot(1,2,1)
# plot_image(i,predictions[i],test_labels,test_images)
# plt.subplot(1,2,2)
# plot_value_array(i,predictions[i],test_labels)

#%%
num_rows = 5
num_cols = 3
num_images = num_rows*num_cols
plt.figure(figsize=(2*2*num_cols, 2*num_rows))
for i in range(num_images):
  plt.subplot(num_rows, 2*num_cols, 2*i+1)
  plot_image(i, predictions[i], test_labels, test_images)
  plt.subplot(num_rows, 2*num_cols, 2*i+2)
  plot_value_array(i, predictions[i], test_labels)
plt.tight_layout()
plt.show()


    