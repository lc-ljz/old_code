# -*- coding: utf-8 -*-
"""
Created on Tue Jan  4 22:30:51 2022

@author: LJZ
"""

import torch
import torch.nn as nn
import torch.nn.functional as F

# print(torch.__version__)
# print('gpu:',torch.cuda.is_available())

class Net(nn.Module):
    
    def __init__(self):
        super(Net, self).__init__() #使用钻石继承，确保不会冲突
        
        self.conv1 = nn.Conv2d(1, 6, 5) # 5*5的卷积核 输入通道：1 输出通道：6
        self.conv2 = nn.Conv2d(6, 16, 5)
        self.fc1 = nn.Linear(16 *5 *5, 120) # 图像大小5*5 输出通道120
        self.fc2 = nn.Linear(120, 84)
        self.fc3 = nn.Linear(84, 10)
    
    def forward(self, x):
        x = F.max_pool2d(F.relu(self.conv1(x)), (2, 2))  # 池化核2*2
        x = F.max_pool2d(F.relu(self.conv2(x)), 2)
        x = torch.flatten(x, 1)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x

net = Net()
print(net)

# %%
params = list(net.parameters())
print(len(params))
print(params[0].size())

# %%
input = torch.randn(1, 1, 32, 32)
out = net(input)
print(out)











