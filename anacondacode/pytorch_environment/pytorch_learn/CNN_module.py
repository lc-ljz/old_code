# -*- coding: utf-8 -*-
"""
Created on Thu Jan 13 21:20:48 2022

@author: LJZ
"""

import torch 
import torchvision 
import torch.nn as nn 
import torch.nn.functional as F

test_data = torchvision.datasets.CIFAR10('../dataset/CIFAR10_set', train=False, 
                                         transform=torchvision.transforms.ToTensor(), download=False)

test_dataloader = torch.utils.data.DataLoader(dataset=test_data, batch_size=64)

class Network(nn.Module):
    def __init__(self):
        super(Network, self).__init__()
        self.conv1 = nn.Conv2d(in_channels=3, out_channels=6, kernel_size=3, stride=1, padding=0)
        self.maxpooling1 = nn.MaxPool2d(kernel_size=2)
        self.fatten = nn.Flatten()
        self.fc1 = nn.Linear(in_features=6*15*15, out_features = 120)
        self.fc2 = nn.Linear(in_features=120, out_features = 10)
        
    def forward(self, x):
        x = self.conv1(x)
        x = self.maxpooling1(x)
        x = self.fatten(x)
        x = F.relu(self.fc1(x))
        x = self.fc2(x)
        return x

net = Network()

for data in test_dataloader:
    images, labels = data
    output = net(images)
    print('input', images.shape)
    print('output', output.shape)
    
    
