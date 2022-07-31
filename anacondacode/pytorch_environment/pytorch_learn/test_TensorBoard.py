# -*- coding: utf-8 -*-
"""
Created on Thu Jan  6 11:50:45 2022

@author: LJZ
"""

from torch.utils.tensorboard import SummaryWriter
import numpy as np
from PIL import Image


writer = SummaryWriter("logs")


image_path = '../dataset/hymenoptera_data/train/ants/0013035.jpg'
image_PIL = Image.open(image_path)
image_nrray = np.array(image_PIL)

writer.add_image("test", image_nrray, 1, dataformats="HWC")

# 绘制y = 2x
for i in range(100):
    writer.add_scalar("y = 2x", 2*i, i)

writer.close()
