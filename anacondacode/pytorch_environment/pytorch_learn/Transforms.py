# -*- coding: utf-8 -*-
"""
Created on Thu Jan  6 15:49:31 2022

@author: LJZ
"""

from torchvision import transforms
from PIL import Image

image_path = '../dataset/hymenoptera_data/train/ants/0013035.jpg'
image_PIL = Image.open(image_path)

trans_tensor = transforms.ToTensor()
tensor_image = trans_tensor(image_PIL)


