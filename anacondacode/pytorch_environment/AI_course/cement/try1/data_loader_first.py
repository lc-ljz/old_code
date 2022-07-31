# -*- coding: utf-8 -*-
"""
Created on Fri Mar 25 20:02:05 2022

@author: LJZ


data:
    8 input element
    1 output element
    1030 rows

"""

import pandas as pd
import matplotlib.pyplot as plt 
import seaborn as sns 

# %%
csv = pd.read_csv("data/concrete.csv") 

# %%
# print(csv.head()) # head --> 默认前五行
# print("csv info:", csv.info) 
print("csv shape:", csv.shape) 
print("csv null:") 
print(csv.isnull().sum())

# %% 
# strength的直方图
plt.figure(figsize=(20, 10)) 
plt.title("Histogram of strength") # 直方图
sns.histplot(data=csv, x="strength", kde=True) # kde 表示 用核密度估计直方图平滑

# %%
# 箱型图
plt.figure(figsize=(20, 10)) 
plt.title("Boxplot of Dataset") 
sns.boxplot(data=csv)  

# %%
################################### 找离群点
plt.figure(figsize=(20, 10)) 
plt.title("Boxplot of slag") 
sns.boxplot(data=csv, x='slag') 

# %%
print(csv[csv["slag"] > 350]) 

# %%
csv.drop(csv[csv["slag"]>350].index, inplace=True) 

# %%
plt.figure(figsize=(20, 10)) 
plt.title("Boxplot of water") 
sns.boxplot(data=csv, x='water') 

# %%
print(csv[(csv["water"] > 230) | (csv["water"] < 122)])

# %%
print(csv["water"].describe()) 

# %%
csv.drop(csv[(csv["water"] > 230) | (csv["water"] < 122)].index, inplace=True) 

# %%
plt.figure(figsize=(20, 10)) 
plt.title("Boxplot of superplastic") 
sns.boxplot(data=csv, x='superplastic') 

# %%
print(csv["superplastic"].describe()) 
print(csv[csv["superplastic"] > 25]) 

# %%
csv.drop(csv[csv["superplastic"] > 25].index, inplace=True) 

# %%
plt.figure(figsize=(20, 10)) 
plt.title("Boxplot of fineagg") 
sns.boxplot(data=csv, x='fineagg') 

# %%
print(csv[(csv["fineagg"] > 950) | (csv["fineagg"] < 600)]) 
    
# %%
csv.drop(csv[csv["fineagg"] > 950].index, inplace=True) 

# %%
print(csv.shape) 

# %%
plt.figure(figsize=(20, 10)) 
plt.title("Boxplot of age") 
sns.boxplot(data=csv, x='age') 

# %%
csv.drop(csv[csv["age"] > 150].index, inplace=True) 

# %%
plt.figure(figsize=(20, 10)) 
plt.title("Boxplot of strength") 
sns.boxplot(data=csv, x='strength') 

# %%
csv.drop(csv[csv["strength"] > 78].index, inplace=True) 

# %%
#############################
plt.figure(figsize=(20, 10)) 
plt.title("Plot of cement vs strength") 
sns.scatterplot(data=csv, x='cement', y='strength')  

# %%
plt.figure(figsize=(20, 10)) 
plt.title("Plot of slag vs strength") 
sns.scatterplot(data=csv, x='slag', y='strength') 

# %%
plt.figure(figsize=(20,10))
plt.title('Plot of ash vs strength')
sns.scatterplot(data=csv, x='ash', y= 'strength') 

# %%
plt.figure(figsize=(20,10))
plt.title('Plot of water vs strength')
sns.scatterplot(data=csv, x='water', y= 'strength') 

# %%
plt.figure(figsize=(20,10))
plt.title('Plot of superplastic vs strength')
sns.scatterplot(data=csv, x='superplastic', y= 'strength') 

# %%
plt.figure(figsize=(20,10))
plt.title('Plot of coarseagg vs strength')
sns.scatterplot(data=csv, x='coarseagg', y= 'strength') 


# %%
plt.figure(figsize=(20,10))
plt.title('Plot of fineagg vs strength')
sns.scatterplot(data=csv, x='fineagg', y= 'strength') 

# %%
plt.figure(figsize=(20,10))
plt.title('Plot of age vs strength')
sns.scatterplot(data=csv, x='age', y= 'strength') 

# %%
#####################################################
plt.figure(figsize=(20, 20)) 
sns.heatmap(data=csv.corr(), annot=True) # 热力图,corr相关系数矩阵

# %%
print(csv.corr()['strength'].sort_values()[:-1]) 

# %%
csv.to_csv("./data/conc.csv") 













