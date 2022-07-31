# -*- coding: utf-8 -*-
"""
Created on Wed Mar 18 09:24:50 2020

@author: LJZ
"""
import numpy as np
import matplotlib.pyplot as plt
from lr_utils import load_dataset


# Loading the data (cat/non-cat)
train_set_x_orig, train_set_y, test_set_x_orig, test_set_y, classes = load_dataset()

# Example of a picture
#index = 25
#plt.imshow(train_set_x_orig[index])
#print("y = " + str(train_set_y[:,index])+",it's a '" + classes[np.squeeze(train_set_y[:, index])].decode("utf-8") + "' picture.")

m_train = train_set_x_orig.shape[0] #训练样本的数量
m_test = test_set_x_orig.shape[0] #测试样本的数量
num_px = train_set_x_orig.shape[1] #训练图像的横宽

train_set_x_flatten = train_set_x_orig.reshape(train_set_x_orig.shape[0],-1).T
test_set_x_flatten = test_set_x_orig.reshape(test_set_x_orig.shape[0],-1).T

train_set_x = train_set_x_flatten/255 #标准化
test_set_x = test_set_x_flatten/255 #标准化

#辅助函数
def sigmoid(z):
    s = 1/(1+np.exp(-z))
    return s

#初始化参数
def initialize_with_zeros(dim):
    w = np.zeros([dim,1])
    b = 0
    
    assert(w.shape == (dim,1))
    assert(isinstance(b, float) or isinstance(b, int))
    
    return w,b


#def propagate(w, b, X, Y):
#前向和反向传播  Forward and Backward propagation
#计算梯度 和 代价函数calculate the cost function
def propagate(w,b,X,Y):
    m = X.shape[1] #样本数量
    
    # FORWARD PROPAGATION (FROM X TO COST)
    A = sigmoid(np.dot(w.T,X) + b)  #compute activation
    cost = -1.0/m*(np.sum(Y*np.log(A) + (1 - Y)*np.log(1 - A)))  # compute cost function
    
    # BACKWARD PROPAGATION (TO FIND GRAD)
    dw = 1/m*(np.dot(X,(A - Y).T))
    db = (1/m)*(np.sum(A - Y))
    
    assert(dw.shape == w.shape)
    assert(db.dtype == float)
    cost = np.squeeze(cost)
    assert(cost.shape == ())
    
    grads = {"dw": dw,
             "db": db}
    return grads, cost


#Optimization 优化
def optimize(w, b, X, Y, num_iterations, learning_rate, print_cost = False):
    costs=[]
    for i in range(num_iterations):
        #Cost and gradient calculation
        grads,cost = propagate(w,b,X,Y)
        dw = grads["dw"]
        db = grads["db"]
        
        # update rule
        w = w - learning_rate*dw
        b = b - learning_rate*db
        # Record the costs
        if i%100 == 0:
            costs.append(cost)
        # Print the cost every 100 training iterations
        if print_cost and i%100 == 0:
            print("Cost after iteration %i: %f" %(i, cost))
    params = {"w": w,
              "b": b}
    
    grads = {"dw": dw,
             "db": db}
    return params,grads,costs

def predict(w,b,X):
    m = X.shape[1]
    Y_prediction = np.zeros((1,m))
    w = w.reshape(X.shape[0],1)
    # Compute vector "A" predicting the probabilities of a cat being present in the picture
    A = sigmoid(np.dot(w.T,X)+b)
    
    for i in range(A.shape[1]):#m
        # Convert probabilities A[0,i] to actual predictions p[0,i]
        if(A[0][i] <= 0.5):
            Y_prediction[0][i] = 0
        else:
            Y_prediction[0][i] = 1
    
    assert(Y_prediction.shape == (1,m))
    return Y_prediction

#Merge all functions into a model 将所有函数合并到模型中
    
def model(X_train,Y_train,X_test,Y_test,num_iterations = 2000, learning_rate = 0.5, print_cost = False):
    # initialize parameters with zeros 
    w,b = initialize_with_zeros(X_train.shape[0])
    # Gradient descent
    parameters, grads, costs = optimize(w,b,X_train,Y_train,num_iterations,learning_rate,print_cost)
    # Retrieve parameters w and b from dictionary "parameters"
    w = parameters["w"]
    b = parameters["b"]
    # Predict test/train set examples
    Y_prediction_train = predict(w,b,X_train)
    Y_prediction_test = predict(w,b,X_test)
    # Print train/test Errors
    print("train accuracy:{}%".format(100 - np.mean(np.abs(Y_prediction_train - Y_train)) * 100))
    print("test accuracy:{}%".format(100 - np.mean(np.abs(Y_prediction_test - Y_test)) * 100))
    
    d = {"costs":costs,
         "Y_prediction_train":Y_prediction_train,
         "Y_prediction_test":Y_prediction_test,
         "w":w,
         "b":b,
         "learning_rate" : learning_rate,
         "num_iterations": num_iterations}
    return d
#1.  
d = model(train_set_x, train_set_y, test_set_x, test_set_y, num_iterations = 2000, learning_rate = 0.005, print_cost = True)

costs = np.squeeze(d['costs'])
plt.plot(costs)
plt.ylabel('cost')
plt.xlabel('iterations (per hundreds)')
plt.title("Learning rate =" + str(d["learning_rate"]))
plt.show()
    

#2.
#learning_rates = [0.01, 0.001, 0.0001]
#models = {}
#for i in learning_rates:
#    print ("learning rate is: " + str(i))
#    models[str(i)] = model(train_set_x, train_set_y, test_set_x, test_set_y, num_iterations = 1500, learning_rate = i, print_cost = False)
#    print ('\n' + "-------------------------------------------------------" + '\n')
#
#for i in learning_rates:
#    plt.plot(np.squeeze(models[str(i)]["costs"]), label= str(models[str(i)]["learning_rate"]))
#
#plt.ylabel('cost')
#plt.xlabel('iterations (hundreds)')
#
#legend = plt.legend(loc='upper center', shadow=True)
#frame = legend.get_frame()
#frame.set_facecolor('0.90')
#plt.show()

#3
from scipy import ndimage   
import scipy

#my_image = "kitten.jpg"    
my_image = "img2.jpg"
# We preprocess the image to fit your algorithm.
fname = "images/" + my_image
image = np.array(ndimage.imread(fname, flatten=False))
image = image/255.
my_image = scipy.misc.imresize(image, size=(num_px,num_px)).reshape((1, num_px*num_px*3)).T

my_predicted_image = predict(d["w"], d["b"], my_image)


plt.imshow(image)
print("y = " + str(np.squeeze(my_predicted_image)) + ", your algorithm predicts a \"" + classes[int(np.squeeze(my_predicted_image)),].decode("utf-8") +  "\" picture.")











