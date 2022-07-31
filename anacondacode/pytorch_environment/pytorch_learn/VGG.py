# -*- coding: utf-8 -*-
"""
Created on Sat Jan 15 21:20:25 2022

@author: LJZ
"""
import torch
import torchvision 
import torch.nn as nn 

data_test = torchvision.datasets.CIFAR10('../dataset/CIFAR10_set', train=False, 
                                         transform=torchvision.transforms.ToTensor(), download=False)

dataloader = torch.utils.data.DataLoader(dataset=data_test, batch_size=64, drop_last=False)

class NetWork(nn.Module):
    
    def __init__(self):
        super(NetWork, self).__init__()
        self.conv1 = nn.Conv2d(in_channels=3, out_channels=32, kernel_size=5, padding=2)
        self.maxpooling1 = nn.MaxPool2d(2)
        self.conv2 = nn.Conv2d(in_channels=32, out_channels=32, kernel_size=5, padding=2)
        self.maxpooling2 = nn.MaxPool2d(2)
        self.conv3 = nn.Conv2d(in_channels=32, out_channels=64, kernel_size=5, padding=2)
        self.maxpooling3 = nn.MaxPool2d(2)
        self.fatten = nn.Flatten()
        self.fc1 = nn.Linear(64*4*4, 64)
        self.fc2 = nn.Linear(64, 10)
        
    def forward(self, x):
        x = self.conv1(x)
        x = self.maxpooling1(x)
        x = self.conv2(x)
        x = self.maxpooling2(x)
        x = self.conv3(x)
        x = self.maxpooling3(x)
        x = self.fatten(x)
        x = self.fc1(x)
        x = self.fc2(x)
        return x

network = NetWork()
loss = nn.CrossEntropyLoss()  # 损失函数
optim = torch.optim.SGD(network.parameters(), lr=0.01) # 优化器

for epoch in range(2):
    running_loss = 0.0
    for data in dataloader:
        images, labels = data 
        output = network(images)
        # print(output.shape, labels.shape) # torch.Size([16, 10]) torch.Size([16])
        # print(images.shape) # torch.Size([64, 3, 32, 32])
        image_loss = loss(output, labels) # 计算损失函数
        optim.zero_grad() # 参数清零
        image_loss.backward() # 反向传播
        optim.step() # 更新参数
        running_loss = running_loss + image_loss
    print(epoch, ':', running_loss)


