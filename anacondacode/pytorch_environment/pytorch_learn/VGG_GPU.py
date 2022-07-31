# -*- coding: utf-8 -*-
"""
Created on Tue Jan 18 20:44:52 2022

@author: LJZ
"""

import torch 
import torchvision 
import torch.nn as nn 

# cpu/gpu
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu') 

# 数据
train_data = torchvision.datasets.CIFAR10('../dataset/CIFAR10_set', train=True, 
                                          transform=torchvision.transforms.ToTensor())

test_data = torchvision.datasets.CIFAR10('../dataset/CIFAR10_set', train=False, 
                                          transform=torchvision.transforms.ToTensor())

# 加载数据
train_dataloader = torch.utils.data.DataLoader(dataset=train_data, batch_size=64)
test_dataloader = torch.utils.data.DataLoader(dataset=train_data, batch_size=64)

# 神经网络
class VGG(nn.Module):
    def __init__(self):
        super(VGG, self).__init__()
        self.model = nn.Sequential(
                nn.Conv2d(in_channels=3, out_channels=32, kernel_size=5, padding=2),
                nn.MaxPool2d(2),
                nn.Conv2d(in_channels=32, out_channels=32, kernel_size=5, padding=2),
                nn.MaxPool2d(2),
                nn.Conv2d(in_channels=32, out_channels=64, kernel_size=5, padding=2),
                nn.MaxPool2d(2),
                nn.Flatten(),
                nn.Linear(64*4*4, 64),
                nn.Linear(64, 10)
            )
        
    def forward(self, x):
        x = self.model(x)
        return x

vgg = VGG()
vgg = vgg.to(device)

# 迭代次数
epoch = 5
# 训练样本数
train_num = len(train_data)
# 测试样本数
test_num = len(test_data)
# 训练次数
train_num = 0
# 损失函数
loss_fn = nn.CrossEntropyLoss()
# 优化器
learning_rate = 1e-2
optim = torch.optim.SGD(params=vgg.parameters(), lr = learning_rate)

for i in range(epoch):
    print('-----------第{}次迭代：-----------'.format(i+1)) 
    # 训练
    # vgg.train()
    for images, labels in train_dataloader:
        images = images.to(device)
        labels = labels.to(device)
        output = vgg(images)
        loss = loss_fn(output, labels)
        
        optim.zero_grad()
        loss.backward()
        optim.step()
        
        train_num = train_num + 1
        if train_num % 100 == 0:
            print('第{}次训练：'.format(train_num))
            print('loss:', loss.item())
    
    # 测试
    # vgg.eval()
    test_total_loss = 0.0
    test_total_accuracy = 0.0
    with torch.no_grad():
        for images, labels in test_dataloader:
            images = images.to(device)
            labels = labels.to(device)
            output = vgg(images)
            loss = loss_fn(output, labels)
            
            test_total_loss = test_total_loss + loss.item() 
            accuracy = (output.argmax(1) == labels).sum()
            test_total_accuracy = test_total_accuracy + accuracy
        print('第{}次迭代的测试总误差：{}'.format(i+1,test_total_loss))
        print('第{}次迭代的测试准确率：{}'.format(i+1,test_total_accuracy))

