# -*- coding: utf-8 -*-
"""
Created on Sun May 10 17:14:52 2020

@author: LJZ
"""

import numpy as np
import cv2

def car():
    img = cv2.imread(r"topredict\pred1.PNG")
    grayImage = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY )     #转换颜色空间，转为灰度图
    #img2 = copy.copy(grayImage)
    img2 = grayImage.copy()
    cv2.threshold(grayImage,200,255,cv2.THRESH_BINARY,img2)#二值化  阈值是100，大于100为白色
    cv2.imshow("w", grayImage)
    cv2.waitKey(1000)
    cv2.imshow("w",img2)
    cv2.waitKey(1000)

    black = []#每一列黑点的数量
    white = []#每一行黑点的数量
    row = img2.shape[0]
    col = img2.shape[1]
    for i in range(col):
        blackCnt = 0
        whiteCnt = 0
        for j in range(row):
            if img2[j][i] == 0:
                blackCnt +=1
            else:
                whiteCnt +=1
        black.append(blackCnt)
        white.append(whiteCnt)

    blackMax = max(black)#黑点最大数量
    whiteMax = max(white)#白点最大数量
    #黑底
    is_black_backgroud = True if whiteMax < blackMax else False

    if (sum(black) if is_black_backgroud else sum(white)) == row * col:#都是底色，没有字符
        print('no char')

    #去除字符顶部和底部的空白
    def find_end(row,col):
        black = []
        for i in range(row):
            blackCnt = 0
            for j in range(col):
                if img2[i][j] == 0:
                    blackCnt += 1
            black.append(blackCnt)
        start_row = 0 #字符开始行
        end_row = row #字符结束行

        for i in range(row):
            # 这一行全是底色
            if (black[i] if is_black_backgroud else (col-black[i]) == col):
                continue
            else:
                start_row = i
                break
        for i in range(start_row+1,row):
            # 这一行全是底色
            if (black[i] if is_black_backgroud else (col-black[i]) == col):
                end_row = i
                break
        return start_row,end_row

    #分割字符   缺陷：字符不能重合
    def find_end2(start_col,col):
        end_col = start_col
        #找到字符开始的列
        temp = -1
        for i in range(start_col, col-1):
            if (white[i] if is_black_backgroud else black[i]) > (0.1 * (whiteMax if is_black_backgroud else blackMax)):
                temp = i
                print('start:',i)
                break
        if temp == -1:
            return start_col,end_col
        else:
            start_col = temp

        # 找到字符结束的列
        for i in range(start_col + 1, col - 1):
            # 底部的色彩 占这一列的 色彩的 95%   ---》  分割字符结束
            if (black[i] if is_black_backgroud else white[i]) > (0.9 * (blackMax if is_black_backgroud else whiteMax)):
                #下一列还有字体颜色
                if (white[i+1] if is_black_backgroud else black[i+1]) > (0.1 * (whiteMax if is_black_backgroud else blackMax)):
                    continue
                end_col = i
                print('end:',i)
                break
        return start_col,end_col

    start = 0
    end = 0
    top, botton = find_end(row, col)
    i = 0
    while i < col-1:
        start,end = find_end2(start,col)
        i = end
        if start == end:#没找到字符
            break
        if end - start > 10:
            print("ok")
            imggg = img2[top:botton,start:end]
            cv2.imshow('1',imggg)
            cv2.waitKey(2000)
        else:
            print("error")
        start = end + 1
    cv2.waitKey(999999)

if __name__ == '__main__':
    car()
