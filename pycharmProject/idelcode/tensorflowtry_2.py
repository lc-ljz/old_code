

#tensorflow1.12.0版本


import tensorflow as tf
import numpy as np
import tensorflow.contrib.slim as slim
#print(tf.__version__)

#占位符
images=tf.placeholder(tf.float32,shape=[64,64],name='images_batch')

#第一个卷积层
#conv = slim.conv2d(images, 64, [3, 3], 1, padding='SAME', scope='conv')
#inputs=tf.Variable(conv)
#max_pool = slim.max_pool2d(conv, [2, 2], [2, 2], padding='SAME', scope='pool')
#flatten = slim.flatten(max_pool)

input = tf.Variable(tf.round(10 * tf.random_normal([1, 7, 7, 1])))
#filter = tf.Variable(tf.round(5 * tf.random_normal([3, 3, 1, 1])))
#op2 = tf.nn.conv2d(input, filter, strides=[1, 1, 1, 1], padding='VALID')
slim_max_pool2d = slim.max_pool2d(input, [3, 3], [1, 1], scope='pool1')
#slim_conv2d_SAME = slim.conv2d(input, 1, [3, 3], [1, 1], weights_initializer=tf.ones_initializer, padding='SAME')
with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    slim_max_pool2d_value = \
        sess.run(slim_max_pool2d)
    print(slim_max_pool2d_value.shape)