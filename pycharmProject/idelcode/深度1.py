import tensorflow as tf
import pandas as pd
import matplotlib.pyplot as plt

data1=pd.read_csv('F:\实1.csv')
#print(data1)
#plt.scatter(data1.Education,data1.Income)
#plt.show()
x=data1.Education
y=data1.Income
model=tf.keras.Sequential()#顺序模型 线性回归
model.add(tf.keras.layers.Dense(1,input_shape=(1,)))#添加层 初始化模型
#print(model.summary())
model.compile(optimizer='adam',loss='mse')#编译 优化方法:optimizer,损失函数:loss
history=model.fit(x, y, epochs=5000)#训练 训练次数:epochs
#model.predict(x)
#model.predict(pd.Series([20]))