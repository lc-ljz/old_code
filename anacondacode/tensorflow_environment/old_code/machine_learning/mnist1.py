# -*- coding: utf-8 -*-
"""
Created on Fri Apr 17 21:42:27 2020

@author: LJZ
"""

import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

mnist = tf.keras.datasets.mnist
(train_images,train_labels),(test_images,test_labels) = mnist.load_data()



def display(h,w):
    m = 28
    A = np.ones((m*h+h+1,m*w+w+1))*255
    for i in range(h):
        for j in range(w):
            A[i*(m+1)+1:(i+1)*(m+1),j*(m+1)+1:(j+1)*(m+1)] = test_images[i*h+j, :, :]     
    plt.imshow(A)


display(5,5)

