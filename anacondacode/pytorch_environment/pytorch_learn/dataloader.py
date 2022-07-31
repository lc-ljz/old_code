# -*- coding: utf-8 -*-
"""
Created on Tue Jan 11 20:59:16 2022

@author: LJZ
"""

import torchvision 
from torch.utils.data import DataLoader 
from torch.utils.tensorboard import SummaryWriter

test_data = torchvision.datasets.CIFAR10('./CIFAR10_set', train = False, transform = torchvision.transforms.ToTensor())
test_loader = DataLoader(dataset = test_data, batch_size=64, shuffle=False, num_workers=0, drop_last=False)

# %%
writer = SummaryWriter('logs_dataloader')
step = 0
for data in test_loader:
    images, labels = data 
    writer.add_images('test_loader', images, step)
    step = step + 1
    
writer.close()
