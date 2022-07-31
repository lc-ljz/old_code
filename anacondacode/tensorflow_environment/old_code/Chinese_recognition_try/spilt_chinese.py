# -*- coding: utf-8 -*-
"""
Created on Sun May 10 19:13:49 2020

@author: LJZ
"""
import cv2
import numpy as np
import os
import matplotlib.pyplot as plt


picture = cv2.imread(r'topredict\pred1.PNG')
#picture = cv2.imread(r'topredict\toPredict.png')
# 在处理之前，我们首先应该将图像去RGB，即在它对应的灰度图像上进行处理。
# 我们可以使用opencv python库中的cvtColor函数来实现到灰度图像的转换
grayscaleimg = cv2.cvtColor(picture,cv2.COLOR_BGR2GRAY)

# # 然后，我们需要对图片进行归一化，这样可以减少最后分割出的数字中的噪声
# # 这里我们采取了对每个像素减去图像总像素的平均数，并设置阈值50以下的像素归零来实现归一化
# # 这样基本上背景像素就变成0了
grayscaleimg = grayscaleimg - int(np.mean(grayscaleimg))
grayscaleimg[grayscaleimg < 50] = 0


# counting non-zero value by row , axis y
# 可以得到字符高的边界
row_nz = []
for row in grayscaleimg.tolist():
    row_nz.append(len(row) - row.count(0))
# plt.title("non-zero values on y (by row)")
# plt.plot(row_nz)

# counting non-zero value by column, x axis
# 可以得到字符宽的边界，波形的波谷即间隔
col_nz = []
for col in grayscaleimg.T.tolist():
    col_nz.append(len(col) - col.count(0))
# plt.title("non-zero values on y (by col)")
# plt.plot(col_nz)

##### start split
# first find upper and lower boundary of y (row)


row_boundary = []
for i,x in enumerate(row_nz[:-1]):
    if (row_nz[i] == 0 and row_nz[i+1] != 0) or row_nz[i] != 0 and row_nz[i+1] == 0:
        row_boundary.append(i)

y1 = [ row_boundary[i:i+2] for i in range(0,len(row_boundary),2) ]

sliced_y_img = []
for y in y1:
    sliced_y_img.append(grayscaleimg[y[0]:y[1],:])
#########################################################################
#########################################################################
# then we find left and right boundary of every digital (x, on column)
column_boundary_list = []
#slice all the list without the last one
for i,x in enumerate(col_nz[:-1]):
    if (col_nz[i] == 0 and col_nz[i+1] != 0) or col_nz[i] != 0 and col_nz[i+1] == 0:
        column_boundary_list.append(i+1)
        
img_list = []
# i是所有左边界，[i:i+2]切片得到每个字符的左右边界
xl = [ column_boundary_list[i:i+2] for i in range(0,len(column_boundary_list),2) ]

n = len(sliced_y_img)
for i in range(n):
    s = sliced_y_img[i]
    for x in xl:
        img_list.append(s[:,x[0]:x[1]] )
    
    
# for x in xl:
#     img_list.append(sliced_y_img[:,x[0]:x[1]] )
# del invalid image
# 删去宽度不大于5像素的错误图片
img_list = [ x for x in img_list if x.shape[1] > 5 ]
img_list = [ x for x in img_list if np.all(x == 0) == 0 ]

fig = plt.figure()
for i,img in enumerate(img_list):
    #img = cv2.resize(img,(64,65),interpolation=cv2.INTER_CUBIC)
    img = cv2.resize(img,(int(96/1.5),int(97.5/1.5)),interpolation=cv2.INTER_CUBIC)
    fig.add_subplot(10,10,i+1)
    plt.imshow(img)
    
    # img = img/255
    # im = np.zeros((65,64,3))
    # im[:,:,0] = img
    
    #plt.imsave("test\%s.png"%i,img)

