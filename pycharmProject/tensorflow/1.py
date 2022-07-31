import matplotlib
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers, datasets
import os


def preprocess(x, y):
    x = tf.cast(x, tf.float32)/255
    x = tf.reshape(x, [-1, 28*28])
    y = tf.cast(y, tf.int32)
    y = tf.one_hot(y, depth=10)
    return x, y


def load_data():
    (x, y), (x_test, y_test) = datasets.mnist.load_data()
    train_data = tf.data.Dataset.from_tensor_slices((x, y))
    test_data = tf.data.Dataset.from_tensor_slices((x_test, y_test))
    train_data = train_data.batch(512).shuffle(1000).map(preprocess)
    train_data = train_data.repeat(20)
    test_data = test_data.batch(512).shuffle(1000).map(preprocess)
    return train_data, test_data


def init_parameter():
    w1, b1 = tf.Variable(tf.random.normal([784, 256], stddev=0.01)), tf.Variable(tf.zeros([256]))
    w2, b2 = tf.Variable(tf.random.truncated_normal([256, 128], stddev=0.01)), tf.Variable(tf.zeros([128]))
    w3, b3 = tf.Variable(tf.random.truncated_normal([128, 10], stddev=0.01)), tf.Variable(tf.zeros([10]))
    return w1, b1, w2, b2, w3, b3


def epoch_train(epoch, train_data, test_data, w1, b1, w2, b2, w3, b3, lr=0.001):
    losses = []
    acc = []
    total_acc = 0
    total = 0
    for step, (x, y) in enumerate(train_data):
        with tf.GradientTape() as tape:
            h1 = x@w1+b1
            h1 = tf.nn.relu(h1)
            h2 = h1@w2+b2
            h2 = tf.nn.relu(h2)
            out = h2@w3+b3
            loss = tf.square(y-out)
            loss = tf.reduce_mean(loss)
            grads = tape.gradient(loss,[w1,b1,w2,b2,w3,b3])
        w1.assign_sub(lr*grads[0])
        b1.assign_sub(lr * grads[1])
        w2.assign_sub(lr * grads[2])
        b2.assign_sub(lr * grads[3])
        w3.assign_sub(lr * grads[4])
        b3.assign_sub(lr * grads[5])
        if step % 80 == 0:
            # print(f"w1参数:{w1}")
            total, total_correct = 0, 0
            for x_test, y_test in test_data:
                h1 = x_test @ w1 + b1
                h1 = tf.nn.relu(h1)
                h2 = h1 @ w2 + b2
                h2 = tf.nn.relu(h2)
                out = h2 @ w3 + b3
                pred = tf.argmax(out, axis=1)
                # convert one_hot y to number y
                y = tf.argmax(y_test, axis=1)
                # bool type
                correct = tf.equal(pred, y)
                # bool tensor => int tensor => numpy
                total_correct += tf.reduce_sum(tf.cast(correct, dtype=tf.int32)).numpy()
                total += x_test.shape[0]
            print(f"epoch:{epoch},step:{step},loss:{loss.numpy()},Evaluate: acc {total_correct/total}")
    return total_acc, total, losses, acc


def train(epochs):
    losses_0 = []
    acc_0 = []
    train_data, test_data = load_data()
    w1, b1, w2, b2, w3, b3 = init_parameter()
    for epoch in range(epochs):
        total_correct, total, losses, acc = epoch_train(epoch,train_data,test_data,w1,b1,w2,b2,w3,b3, lr=0.01)
        losses_0.append(losses)
        acc_0.append(acc)


if __name__ == '__main__':

    epochs = 10
    train(epochs)