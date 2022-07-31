# -*- coding: utf-8 -*-
"""
Created on Wed May  6 16:37:05 2020

@author: LJZ
"""
import os
import pygame
import pickle


chinese_dir = 'chinese'
if not os.path.exists(chinese_dir):
    os.mkdir(chinese_dir)


test1= open(r'test.pickle','rb')
label_dict=pickle.load(test1)
test1.close()

num = 0
pygame.init()
for i in range(1,len(label_dict)+1):
    num = num + 1
    word = str(label_dict[i])
    font = pygame.font.Font("simsun.ttc", 64)
    rtext = font.render(word, True, (0, 0, 0), (255, 255, 255))
    pygame.image.save(rtext, os.path.join(chinese_dir, str(num) + ".png"))
