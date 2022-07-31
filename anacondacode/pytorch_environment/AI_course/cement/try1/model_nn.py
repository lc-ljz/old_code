# -*- coding: utf-8 -*-
"""
Created on Thu May  5 20:19:55 2022

@author: LJZ
"""

import torch 
import torch.nn as nn 
from torch.utils.data import Dataset, DataLoader, random_split 

import pandas as pd 

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

class Net(nn.Module):
    
    def __init__(self):
        super(Net, self).__init__() 
        self.fc1 = nn.Linear(8, 8)
        # self.relu1 = nn.ReLU() 
        self.fc2 = nn.Linear(8, 1) 
        
    def forward(self, x):
        x = self.fc1(x) 
        # x = self.relu1(x) 
        x = self.fc2(x) 
        
        return x


class Mydata(Dataset):
    
    def __init__(self, data_dir):
        self.data_dir = data_dir 
        self.data = pd.read_csv(self.data_dir) 
        self.data = self.data.to_numpy() 
    
    def __len__(self):
        return len(self.data) 
        
    def __getitem__(self, index):
        return self.data[index] 


data = Mydata('data/conc2.csv')

data_size = len(data) 
train_size, test_size = int(data_size * 0.7), data_size - int(data_size * 0.7) 

train_data, test_data = random_split(data, [train_size, test_size]) 

train_dataloader = DataLoader(dataset=train_data, batch_size=64) 
test_dataloader = DataLoader(dataset=test_data, batch_size=64) 

net = Net()
net = net.to(device)   

loss_fn = nn.MSELoss() 
optim = torch.optim.Adam(net.parameters(), lr = 0.1) 

# %%

epoch = 100 

for i in range(epoch):
    train_total_loss = 0.0
    for d in train_dataloader:
        # print(d.size()) # [64, 9]
        d = d.to(torch.float32)
        label = d[:,-1] 
        label = label.reshape(label.shape[0], 1) 
        d = d[:,0:8] 
        
        d = d.to(device) 
        label = label.to(device) 
        
        target = net(d) 
        loss = loss_fn(target, label) 
        
        optim.zero_grad() 
        loss.backward() 
        optim.step() 
        
        train_total_loss = train_total_loss + loss.item()
        
    # print("epoch:[{}]/[{}],误差:{}".format(i+1, epoch, train_total_loss)) 
        
test_total_loss = 0.0
test_total_accuracy = 0.0
with torch.no_grad():
    for d in test_dataloader:
        d = d.to(torch.float32)
        label = d[:,-1] 
        label = label.reshape(label.shape[0], 1) 
        d = d[:,0:8] 
        d = d.to(device) 
        label = label.to(device) 
        target = net(d) 
        loss = loss_fn(target, label) 
    
        test_total_loss = test_total_loss + loss.item() 
        accuracy = (target == label).sum() 
        test_total_accuracy = test_total_accuracy + accuracy
        
    print("测试总误差:{}，测试准确率：{}".format(test_total_loss, test_total_accuracy)) 





























