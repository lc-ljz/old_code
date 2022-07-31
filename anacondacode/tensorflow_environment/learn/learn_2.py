# -*- coding: utf-8 -*-
"""
Created on Wed Nov 24 17:10:15 2021

@author: LJZ
"""

from sklearn.linear_model import LogisticRegression
import pandas as pd
import numpy as np
from show_image import Regress_2d_images

# %%
data_txt = pd.read_table("./resource/logit_regression_data/watermelon30a.txt")
data_txt = np.array(data_txt)

m = data_txt.shape[0]
d = 2

x = np.zeros((m, d))
y = np.zeros(m)

for i in range(m):
    a = np.array(str(data_txt[i][0]).split(","))
    x[i,:] = a[1:3]
    if a[3] == "是":
        y[i] = 1
    elif a[3] == "否":
        y[i] = 0
    
# %%

model = LogisticRegression()
model.fit(x,y)

y_pred = model.predict(x)

# %%
w = model.coef_.T
b = model.intercept_
# print(y_pred)
Regress_2d_images(w, b, x, y)
















