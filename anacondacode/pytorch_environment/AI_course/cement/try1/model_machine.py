# -*- coding: utf-8 -*-
"""
Created on Sat Mar 26 20:43:59 2022

@author: LJZ
"""

import pandas as pd 
import numpy as np
import matplotlib.pyplot as plt 
import seaborn as sns 

from sklearn.model_selection import train_test_split 
from sklearn.linear_model import LinearRegression 
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import PowerTransformer
from sklearn.ensemble import RandomForestRegressor

from sklearn import metrics 

concrete_df = pd.read_csv("data/conc2.csv")

X = concrete_df.drop(['strength'], axis=1) 
Y = concrete_df['strength'] 

X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.30, random_state=1) 
# %%
def train_test_model(model, method, X_train, X_test, Y_train, Y_test, of_type, index, scale):
    print(model) 
    print("*****************") 
    
    if scale == 'yes':
        pipeline = Pipeline([('scaler',PowerTransformer()),('model',model)]) 
    elif scale == 'no':
        pipeline = Pipeline([('model',model)]) 
    
    pipeline.fit(X_train, Y_train) 
    prediction = pipeline.predict(X_test) 
    
    r2 = metrics.r2_score(Y_test, prediction)  # 回归模型评价指标R2_score 
    rmse = np.sqrt(metrics.mean_squared_error(Y_test, prediction)) 
    
    coefn = {}
    if of_type == 'coef':
        print("The intercept for our model is {}".format(model.intercept_), "\n") 
        
        for idx, col_name in enumerate(X_train.columns):
            print("The coefficient for {} is {}".format(col_name, model.coef_.ravel()[idx])) 
            coefn[col_name] = model.coef_.ravel()[idx]
    
    # 训练集的准确率
    train_accuracy_score = pipeline.score(X_train, Y_train) 
    # 测试集的准确率
    test_accuracy_score = pipeline.score(X_test, Y_test) 
    
    print("***************************************************************************") 
    # 画图
    if of_type == 'coef':
        plt.figure(figsize=(8,8)) 
        plt.subplot(211) 
        
        c = pd.DataFrame(sorted(coefn.items(),key=lambda x:x[1], reverse=True))
        # print(c)
        ax1 = sns.barplot(x=c[0], y=c[1], palette="jet_r", linewidth=2) 
        
        ax1.set_facecolor("lightgrey") 
        ax1.axhline(0,color="k",linewidth=2)
        plt.ylabel("coefficients")
        plt.xlabel("features")
        plt.title(method + ' ' + 'FEATURE IMPORTANCES')
    
    resultsDF = pd.DataFrame({'Method': method, 'R_Squared': r2, 'RMSE': rmse, 
                              'Train Accuracy': train_accuracy_score, 
                              'Test Accuracy': test_accuracy_score}, index=[index])
    
    return resultsDF 

LR = LinearRegression() 
RFR = RandomForestRegressor() 

LR_resultsDF = train_test_model(LR, 'LinearRegression',X_train, X_test, Y_train, Y_test, 
                             'none', 1, 'no') 
RFR_resultsDF = train_test_model(LR, 'RandomForestRegressor',X_train, X_test, Y_train, Y_test, 
                             'none', 2, 'no') 
RFR_resultsDF2 = train_test_model(LR, 'RandomForestRegressor',X_train, X_test, Y_train, Y_test, 
                             'none', 3, 'yes') 

resultsDF = pd.concat([LR_resultsDF, RFR_resultsDF, RFR_resultsDF2]) 

print(resultsDF) 





