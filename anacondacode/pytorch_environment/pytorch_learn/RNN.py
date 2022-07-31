# -*- coding: utf-8 -*-
"""
Created on Mon Feb  7 11:02:58 2022

@author: LJZ
"""

import torch 
import torch.nn as nn 
import torchvision 

# 相关参数
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu') # cuda or cpu

sequence_length = 28
epochs = 2
batch_size = 100
input_size = 28
hidden_size = 128
num_layers = 2
num_classes = 10 # 类别数量
learning_rate = 0.01 

# mnist数据集
train_data = torchvision.datasets.MNIST('../dataset/MNIST_set',train=True, 
                                        transform=torchvision.transforms.ToTensor(), download=False) 
test_data = torchvision.datasets.MNIST('../dataset/MNIST_set', train=False,
                                       transform=torchvision.transforms.ToTensor(), download=False) 

train_dataloader = torch.utils.data.DataLoader(dataset=train_data, batch_size=batch_size,shuffle=True) 
test_dataloader = torch.utils.data.DataLoader(dataset=test_data, batch_size=batch_size,shuffle=False) 

# RNN神经网络 
class RNN(nn.Module):
    
    def __init__(self, input_size, hidden_size, num_layers, num_classes):
        super(RNN, self).__init__() 
        self.hidden_size = hidden_size 
        self.num_layers = num_layers 
        self.lstm = nn.LSTM(input_size, hidden_size, num_layers, batch_first=True) 
        self.fc = nn.Linear(in_features=hidden_size, out_features=num_classes) 
        
    def forward(self, x):
        h0 = torch.zeros(self.num_layers, x.size(0), self.hidden_size).to(device) # hidden初始状态
        c0 = torch.zeros(self.num_layers, x.size(0), self.hidden_size).to(device) # cell初始状态
        
        out, _ = self.lstm(x, (h0, c0)) # out: tensor of shape (batch_size, seq_length, hidden_size) 
        # print('h0:', h0.shape) # torch.Size([2, 100, 128])
        # print('out1:', out.shape) # torch.Size([100, 28, 128])
        ## 解码上一个时间步骤的隐藏状态 
        out = self.fc(out[:, -1, :]) # output[:, -1, :]: torch.Size([100, 128]) 
        # print('out2:', out.shape) # torch.Size([100, 10])
        return out

rnn = RNN(input_size, hidden_size, num_layers, num_classes) 
rnn = rnn.to(device) 

loss_fn = nn.CrossEntropyLoss() 
optim = torch.optim.Adam(rnn.parameters(), learning_rate) 

total_step = len(train_dataloader) 

for epoch in range(epochs):
    for i, (images, labels) in enumerate(train_dataloader):
        # print('images1:', images.shape) # torch.Size([100, 1, 28, 28])
        images = images.reshape(-1, sequence_length, input_size) 
        images, labels = images.to(device), labels.to(device) 
        output = rnn(images) 
        
        # print('images:', images.shape)  # torch.Size([100, 28, 28]) 
        # print('labels:', labels.shape) # torch.Size([100]) 
        
        loss = loss_fn(output, labels) 
        
        optim.zero_grad() 
        loss.backward() 
        optim.step() 
        
        if i % 100 == 0:
            print('epoch:[{}/{}],step:[{}/{}],loss:[{:.4f}]'.format(epoch+1,epochs,i+1,total_step,loss.item()))
                
    
rnn.eval() 
with torch.no_grad():
    correct = 0
    total = 0
    for i,(images, labels) in enumerate(test_dataloader):
        images = images.reshape(-1, sequence_length, input_size) 
        images, labels = images.to(device), labels.to(device) 
        outputs = rnn(images) 
        _, predicted = torch.max(outputs.data, 1) 
        correct += (predicted == labels).sum().item() 
        total += labels.size(0) 
        
    print('Accuracy of the model on the test images:{} %'.format(100 * correct / total))