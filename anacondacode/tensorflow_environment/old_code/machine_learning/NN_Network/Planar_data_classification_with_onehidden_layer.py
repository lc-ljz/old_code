# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt
import sklearn
import sklearn.datasets
import sklearn.linear_model

from testCases_v2 import *
from planar_utils import sigmoid, load_planar_dataset, plot_decision_boundary 

np.random.seed(1) # set a seed so that the results are consistent 固定随机数

X,Y = load_planar_dataset()

#Visualize  Dataset
#plt.scatter(X[0, :].reshape(1, -1), X[1, :].reshape(1, -1), c=Y, s=40, cmap=plt.cm.Spectral)

###
shape_X = X.shape
shape_Y = Y.shape
m = X.shape[1]  # training set size

##Simple Logistic Regression
# Train the logistic regression classifier
clf = sklearn.linear_model.LogisticRegressionCV()
clf.fit(X.T, np.reshape(Y, [-1,]))

# Plot the decision boundary for logistic regression
plot_decision_boundary(lambda x: clf.predict(x), X, Y)
plt.title("Logistic Regression")

# Print accuracy
LR_predictions = clf.predict(X.T)
print ('Accuracy of logistic regression: %d ' % float((np.dot(Y,LR_predictions) + np.dot(1-Y,1-LR_predictions))/float(Y.size)*100) +
       '% ' + "(percentage of correctly labelled datapoints)")

###Neural Network model

#Defining the neural network structure
def layer_sizes(X, Y):
    n_x = X.shape[0] # size of input layer
    n_h = 4
    n_y = Y.shape[0] # size of output layer
    return (n_x, n_h, n_y)

#Initialize the model's parameters
def initialize_parameters(n_x, n_h, n_y):
    np.random.seed(2) # we set up a seed so that your output matches ours although the initialization is random.
    
    ### START CODE HERE ### (≈ 4 lines of code)
    W1 = np.random.randn(n_h,n_x)*0.01
    b1 = np.zeros((n_h,1))
    W2 = np.random.randn(n_y,n_h)*0.01
    b2 = np.zeros((n_y,1))
    ### END CODE HERE ###
    
    assert (W1.shape == (n_h, n_x))
    assert (b1.shape == (n_h, 1))
    assert (W2.shape == (n_y, n_h))
    assert (b2.shape == (n_y, 1))
    
    parameters = {"W1": W1,
                  "b1": b1,
                  "W2": W2,
                  "b2": b2}
    
    return parameters

#The Loop
def forward_propagation(X, parameters):
    # Retrieve each parameter from the dictionary "parameters"
    W1 = parameters["W1"]
    b1 = parameters["b1"]
    W2 = parameters["W2"]
    b2 = parameters["b2"]
    # Implement Forward Propagation to calculate A2 (probabilities)
    Z1 = np.dot(W1,X) + b1
    A1 = np.tanh(Z1)
    Z2 = np.dot(W2,A1) + b2
    A2 = sigmoid(Z2)
    assert(A2.shape == (1, X.shape[1]))
    cache = {"Z1": Z1,
             "A1": A1,
             "Z2": Z2,
             "A2": A2}
    
    return A2, cache

# GRADED FUNCTION: compute_cost

def compute_cost(A2, Y, parameters):
    m = Y.shape[1] # number of example
    # Compute the cross-entropy cost
    logprobs = Y*np.log(A2) + (1 - Y)*np.log(1 - A2)
    cost = -1/m * np.sum(logprobs)
    
    cost = float(np.squeeze(cost))  # makes sure cost is the dimension we expect. 
    assert(isinstance(cost, float))
    
    return cost

def backward_propagation(parameters, cache, X, Y):
    m = X.shape[1]
    # First, retrieve W1 and W2 from the dictionary "parameters".
    W1 = parameters["W1"]
    W2 = parameters["W2"]
        
    # Retrieve also A1 and A2 from dictionary "cache".
    A1 = cache["A1"]
    A2 = cache["A2"]
    
    # Backward propagation: calculate dW1, db1, dW2, db2. 
    dZ2 = A2 - Y
    dW2 = 1 / m * np.dot(dZ2,A1.T)
    db2 = 1 / m * np.sum(dZ2,axis=1,keepdims=True)
    dZ1 = np.dot(W2.T,dZ2) * (1-np.power(A1,2))
    dW1 = 1 / m * np.dot(dZ1,X.T)
    db1 = 1 / m * np.sum(dZ1,axis=1,keepdims=True)
    
    grads = {"dW1": dW1,
             "db1": db1,
             "dW2": dW2,
             "db2": db2}
    
    return grads

def update_parameters(parameters, grads, learning_rate = 1.2):
    # Retrieve each parameter from the dictionary "parameters"
    W1 = parameters["W1"]
    b1 = parameters["b1"]
    W2 = parameters["W2"]
    b2 = parameters["b2"]
    
    # Retrieve each gradient from the dictionary "grads"
    dW1 = grads["dW1"]
    db1 = grads["db1"]
    dW2 = grads["dW2"]
    db2 = grads["db2"]
    
    # Update rule for each parameter
    W1 = W1 -  learning_rate * dW1
    b1 = b1 -  learning_rate * db1
    W2 = W2 -  learning_rate * dW2
    b2 = b2 -  learning_rate * db2
    
    parameters = {"W1": W1,
                  "b1": b1,
                  "W2": W2,
                  "b2": b2}
    
    return parameters


# Integrate parts 4.1, 4.2 and 4.3 in nn_model()

def nn_model(X, Y, n_h, num_iterations = 10000, print_cost=False):    
    np.random.seed(3)
    n_x = layer_sizes(X, Y)[0]
    n_y = layer_sizes(X, Y)[2]
    
    # Initialize parameters
    parameters = initialize_parameters(n_x, n_h, n_y)
    
    # Loop (gradient descent)
    for i in range(0, num_iterations):
         
        # Forward propagation. Inputs: "X, parameters". Outputs: "A2, cache".
        A2, cache = forward_propagation(X, parameters)
        
        # Cost function. Inputs: "A2, Y, parameters". Outputs: "cost".
        cost = compute_cost(A2, Y, parameters)
 
        # Backpropagation. Inputs: "parameters, cache, X, Y". Outputs: "grads".
        grads = backward_propagation(parameters, cache, X, Y)
 
        # Gradient descent parameter update. Inputs: "parameters, grads". Outputs: "parameters".
        parameters = update_parameters(parameters, grads, learning_rate = 1.2)
        
        # Print the cost every 1000 iterations
        if print_cost and i % 1000 == 0:
            print ("Cost after iteration %i: %f" %(i, cost))

    return parameters

def predict(parameters, X):
    # Computes probabilities using forward propagation, and classifies to 0/1 using 0.5 as the threshold.
    A2, cache = forward_propagation(X, parameters)
    predictions = np.round(A2)
    
    return predictions


# Build a model with a n_h-dimensional hidden layer
parameters = nn_model(X, Y, n_h = 4, num_iterations = 10000, print_cost=True)

# Plot the decision boundary
plot_decision_boundary(lambda x: predict(parameters, x.T), X, Y)
plt.title("Decision Boundary for hidden layer size " + str(4))

# Print accuracy
predictions = predict(parameters, X)
print ('Accuracy: %d' % float((np.dot(Y,predictions.T) + np.dot(1-Y,1-predictions.T))/float(Y.size)*100) + '%')


##tuning hidden layer size (optional/ungraded exercise)
# This may take about 2 minutes to run
#plt.figure(figsize=(16, 32))
#hidden_layer_sizes = [1, 2, 3, 4, 5, 20, 50]
#for i, n_h in enumerate(hidden_layer_sizes):
#    plt.subplot(5, 2, i+1)
#    plt.title('Hidden Layer of size %d' % n_h)
#    parameters = nn_model(X, Y, n_h, num_iterations = 5000)
#    plot_decision_boundary(lambda x: predict(parameters, x.T), X, Y)
#    predictions = predict(parameters, X)
#    accuracy = float((np.dot(Y,predictions.T) + np.dot(1-Y,1-predictions.T))/float(Y.size)*100)
#    print ("Accuracy for {} hidden units: {} %".format(n_h, accuracy))



#####Performance on other datasets
## Datasets
#noisy_circles, noisy_moons, blobs, gaussian_quantiles, no_structure = load_extra_datasets()
#
#datasets = {"noisy_circles": noisy_circles,
#            "noisy_moons": noisy_moons,
#            "blobs": blobs,
#            "gaussian_quantiles": gaussian_quantiles}
#
#### START CODE HERE ### (choose your dataset)
#dataset = "noisy_moons"
#### END CODE HERE ###
#
#X, Y = datasets[dataset]
#X, Y = X.T, Y.reshape(1, Y.shape[0])
#
## make blobs binary
#if dataset == "blobs":
#    Y = Y%2
#
## Visualize the data
#plt.scatter(X[0, :].reshape(1, -1), X[1, :].reshape(1, -1), c=Y, s=40, cmap=plt.cm.Spectral);











