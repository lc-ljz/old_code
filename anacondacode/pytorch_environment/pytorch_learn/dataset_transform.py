# -*- coding: utf-8 -*-
"""
Created on Sat Jan  8 11:09:12 2022

@author: LJZ
"""

import torchvision
import matplotlib.pyplot as plt

# %% 下载CIFAR-10数据集
dataset_transform = torchvision.transforms.Compose([
    torchvision.transforms.ToTensor()    
])

train_set = torchvision.datasets.CIFAR10(root = './CIFAR10_set', train = True, transform = dataset_transform, download = True)
test_set = torchvision.datasets.CIFAR10(root = './CIFAR10_set', train = False, transform = dataset_transform, download = True)

# %%
# print(train_set.classes, train_set.class_to_idx)
# index = 0
image_index, label_index = train_set[0]
# print(image_index, label_index, train_set.classes[label_index])
# plt.imshow(image_index)

# %%
