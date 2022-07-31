# -*- coding: utf-8 -*-
"""
Created on Sun Apr 12 22:03:15 2020

@author: LJZ
"""

import numpy as np
from tensorflow import keras

model = keras.Sequential([keras.layers.Dense(units=1,input_shape=[1])])
model.compile(optimizer = 'sgd',loss = 'mean_squared_error')
# xs = np.arange(-1,5).astype(np.float)
# ys = np.arange(-3,9,2).astype(np.float)
x = np.arange(-1,5).astype(np.float)
y = 2*x+1+np.random.randn()
model.fit(x,y,epochs = 500)#epochs：训练多少轮。（小批量）
print(model.predict([10.0]))
#%%
import matplotlib.pyplot as plt
z = model.predict(x)
plt.scatter(x,y)
plt.plot(x,z)


