#tensorflow2版本

import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
import tensorflow as tf
from tensorflow.keras import models,layers

model=models.Sequential()
#第一层卷积层,卷积核大小为3*3，32个，28*28为待训练图片的大小
model.add(layers.Conv2D(32,(3,3),activation='relu',input_shape=(28,28,1)))
model.add(layers.MaxPooling2D((2,2)))
model.summary()

    
          