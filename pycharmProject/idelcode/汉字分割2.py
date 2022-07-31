# -*- coding: utf-8 -*-
"""
Created on Sun May 10 17:18:34 2020

@author: LJZ
"""

import cv2
import numpy as np
 
path = 'topredict\pred1.PNG'
root = 'topredict\\'
# 图像resize
dsize = 36
img = cv2.imread(path)
data = np.array(img)
height = data.shape[0]
width = data.shape[1]
# 设置最小的文字像素高度
min_val = 10
 
start_i = -1
end_i = -1
# 存放每行的起止坐标
rowinfo = []
 
# 行分割
for i in range(height):
 
    # 行中有字相关信息
    if (not data[i].all()):
        end_i = i
        if(start_i < 0):
            start_i = i
            pass
    # 行中无字相关信息
    elif (data[i].all() and start_i >= 0):
        if(end_i - start_i >= min_val):
            rowinfo.append((start_i, end_i))
            pass
        start_i, end_i = -1, -1
print(rowinfo)
 
# 列分割
start_j = -1
end_j = -1
# 最小文字像素宽度
min_val_word = 5
# 分割后保存编号
number = 0
for start, end in rowinfo:
    for j in range(width):
        # 列中有字相关信息
        if(not data[start: end, j].all()):
             end_j = j
             if(start_j < 0):
                 start_j = j
                 pass
        # 列中无字信息
        elif(data[start: end, j].all() and start_j >= 0):
            if(end_j - start_j >= min_val_word):
                img = data[start:end, start_j: end_j]
                im2save = cv2.resize(img, (dsize, dsize)) #归一化处理
                cv2.imwrite(root + '%d.jpg' % number, im2save)
                number += 1
                pass
            start_j, end_j = -1, -1
