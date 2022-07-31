# -*- coding: utf-8 -*-
"""
Created on Sat Apr 18 16:23:45 2020

@author: LJZ
"""

import numpy as np
import matplotlib.pyplot as plt
import scipy
import time
import h5py
from dnn_app_utils_v2 import *



plt.rcParams['figure.figsize'] = (5.0, 4.0) # set default size of plots
plt.rcParams['image.interpolation'] = 'nearest'
plt.rcParams['image.cmap'] = 'gray'

np.random.seed(1)

#dataset
train_x_orig, train_y, test_x_orig, test_y, classes = load_data()

# # Example of a picture
# index = 1
# plt.imshow(train_x_orig[index])
# print("y = " + str(train_y[0,index]) + " it's a " + classes[train_y[0,index]].decode("utf-8") + " picture.")

train_x_flatten = train_x_orig.reshape(train_x_orig.shape[0],-1).T
test_x_flatten = test_x_orig.reshape(test_x_orig.shape[0],-1).T

train_x = train_x_flatten / 255.
test_x = test_x_flatten / 255.

n_x = 12288
n_h = 7
n_y = 1
layers_dims = (n_x,n_h,n_y)

def two_layer_model(X,Y,layers_dims,learning_rate = 0.0075,num_iterations = 3000,print_cost = False):
    np.random.seed(1)
    grads = {}
    costs = []
    m = X.shape[0]
    (n_x, n_h, n_y) = layers_dims
    
    parameters = initialize_parameters(n_h, n_x, n_y)
    
    W1 = parameters["W1"]
    b1 = parameters["b1"]
    W2 = parameters["W2"]
    b2 = parameters["b2"]
    
    for i in range(0,num_iterations):
        A1,cache1 = linear_activation_forward(X, W1, b1, "relu")
        A2,cache2 = linear_activation_forward(A1, W2, b2, "sigmoid")
        
        cost = compute_cost(A2, Y)
        
        dA2 = -(np.divide(Y, A2) - np.divide(1 - Y,1 - A2))
        
        dA1, dW2, db2 = linear_activation_backward(dA2,cache2,activation = "sigmoid")
        dA0, dW1, db1 = linear_activation_backward(dA1,cache1,activation = "relu")
    
        grads['dW1'] = dW1
        grads['db1'] = db1
        grads['dW2'] = dW2
        grads['db2'] = db2
        
        parameters = update_parameters(parameters, grads, learning_rate)
        
        W1 = parameters["W1"]
        b1 = parameters["b1"]
        W2 = parameters["W2"]
        b2 = parameters["b2"]
        
        if print_cost and i % 100 == 0:
            print("Cost after iteration {}:{}".format(i,np.squeeze(cost)))
        if print_cost and i % 100 == 0:
            costs.append(cost)
    
    plt.plot(np.squeeze(costs))
    plt.ylabel('cost')
    plt.xlabel('iterations (per tens)')
    plt.title("Learning rate =" + str(learning_rate))
    plt.show()
    
    return parameters
    
#(train_x, train_y, layers_dims = (n_x, n_h, n_y), num_iterations = 2500, print_cost=True)
parameters = two_layer_model(train_x, train_y, layers_dims = (n_x, n_h, n_y), num_iterations = 2500, print_cost=True)  
    
#%%
predictions_train = predict(train_x, train_y, parameters)

#%%
predictions_test = predict(test_x, test_y, parameters)

#%%
layers_dims = [12288, 20, 7, 5, 1] #  4-layer model

def L_layer_model(X, Y, layers_dims, learning_rate = 0.0075, num_iterations = 3000, print_cost=False):
    np.random.seed(1)
    costs = []
    parameters = initialize_parameters_deep(layers_dims)
    
    for i in range(0,num_iterations):
        AL,caches = L_model_forward(X,parameters)
        cost = compute_cost(AL, Y)
        grads = L_model_backward(AL, Y, caches)
        parameters = update_parameters(parameters, grads, learning_rate)
        
        if print_cost and i % 100 ==0:
            print("Cost after iteration %i: %f" % (i,cost))
        if print_cost and i % 100 ==0:
            costs.append(cost)
    
    plt.plot(np.squeeze(costs))
    plt.ylabel('cost')
    plt.xlabel('iterations (per tens)')
    plt.title("Learning rate =" + str(learning_rate))
    plt.show()
    
    return parameters


parameters = L_layer_model(train_x, train_y, layers_dims, num_iterations = 2500, print_cost = True)


#%%

pred_train = predict(train_x, train_y, parameters)
#%%

pred_test = predict(test_x, test_y, parameters)
#%%
print_mislabeled_images(classes, test_x, test_y, pred_test)  

#%%
num_px = 64

my_image = "my_image.jpg" # change this to the name of your image file 
my_label_y = [1] # the true class of your image (1 -> cat, 0 -> non-cat)


fname = "images/" + my_image

#image = np.array(ndimage.imread(fname, flatten=False))
image = np.array(plt.imread(fname))


#my_image = scipy.misc.imresize(image, size=(num_px,num_px)).reshape((num_px*num_px*3,1))
from skimage.transform import resize
my_image = resize(image, output_shape=(num_px,num_px)).reshape((num_px*num_px*3,1))

my_image = my_image/255.
my_predicted_image = predict(my_image, my_label_y, parameters)

plt.imshow(image)
print ("y = " + str(np.squeeze(my_predicted_image)) + ", your L-layer model predicts a \"" + classes[int(np.squeeze(my_predicted_image)),].decode("utf-8") +  "\" picture.") 
    
    
    
    
    

