# -*- coding: utf-8 -*-
"""
Created on Mon Apr 13 09:51:16 2020
callback 用于控制训练何时结束，比如这份脚本中， 当训练样本集上识别率达到85%时停止
@author: Lloyd
"""

import tensorflow as tf
# gpu = tf.config.experimental.list_physical_devices('GPU')
# tf.config.experimental.set_memory_growth(gpu[0], True)

print(tf.__version__)

class myCallback(tf.keras.callbacks.Callback):
    def on_epoch_end(self, epoch, logs={}):
        if(logs.get('accuracy')>0.85):
            print("\nReached 85% accuracy so cancelling training!")
            self.model.stop_training = True

callbacks = myCallback()

mnist = tf.keras.datasets.fashion_mnist
(training_images, training_labels), (test_images, test_labels) = mnist.load_data() 

training_images = training_images/255.0
test_images = test_images/255.0

model = tf.keras.models.Sequential([
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dense(512, activation=tf.nn.relu),
    tf.keras.layers.Dense(10, activation=tf.nn.softmax)
  ])
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
model.fit(training_images, training_labels, epochs=5, callbacks=[callbacks])
#model.evaluate(test_images, test_labels)


# history = model.fit(train_images, train_labels, epochs=50, validation_data=(test_images, test_labels), callbacks=[callback])
#%%
class myCallback(tf.keras.callbacks.Callback):
    def on_epoch_end(self,epoch,logs = {}):
        if(logs.get('accuracy') > 0.85):
            print("\nReached 85% accuracy so cancelling training!")
            self.model.stop_training = True
            
callbacks = myCallback()