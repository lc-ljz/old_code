# -*- coding: utf-8 -*-
"""
Created on Fri Jan 28 15:49:25 2022

@author: LJZ
"""

import torch 
import torchvision 
import torch.nn as nn 

# 设备配置 
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu') 

# 相关参数
batch_size = 64
epochs = 5
learning_rate = 0.01
#
# 训练数据使用时，测试集准确率下降
# transforms = torchvision.transforms.Compose([
#     torchvision.transforms.Pad(4),
#     torchvision.transforms.RandomHorizontalFlip(),  # 依据概率p对PIL图片进行水平翻转，p默认0.5
#     torchvision.transforms.RandomCrop(32), # 随机长宽比裁剪
#     torchvision.transforms.ToTensor()
#     ])

# 数据集 32x32x3
data_train = torchvision.datasets.CIFAR10('../dataset/CIFAR10_set', train=True, transform=torchvision.transforms.ToTensor())
data_test = torchvision.datasets.CIFAR10('../dataset/CIFAR10_set', train=False, transform=torchvision.transforms.ToTensor())

# 加载数据集
data_trainloader = torch.utils.data.DataLoader(dataset=data_train, batch_size=batch_size, shuffle=True) 
data_testloader = torch.utils.data.DataLoader(dataset=data_train, batch_size=batch_size, shuffle=False)


# 3x3的卷积
def conv3x3(in_channel, out_channel, stride=1):
    return nn.Conv2d(in_channels=in_channel, out_channels=out_channel, kernel_size=3, 
                     stride=stride, padding=1,bias=False) 

# 残差块
class ResidualBlock(nn.Module):
    def __init__(self, in_channel, out_channel, stride=1, downsample=None):
        super(ResidualBlock, self).__init__() 
        self.conv1 = conv3x3(in_channel, out_channel, stride)
        self.bn1 = nn.BatchNorm2d(out_channel)
        self.relu = nn.ReLU(inplace=True) 
        self.conv2 = conv3x3(out_channel, out_channel)
        self.bn2 = nn.BatchNorm2d(out_channel)
        self.downsample = downsample 
        
    def forward(self, x):
        residual = x
        out = self.conv1(x)
        out = self.bn1(out)
        out = self.relu(out)
        out = self.conv2(out)
        out = self.bn2(out) 
        
        if self.downsample:
            residual = self.downsample(x) 
        
        out += residual
        out = self.relu(out) 
        
        return out 

# 神经网络定义
class ResNet(nn.Module):
    
    def __init__(self, block, layers, num_classes=10):
        super(ResNet, self).__init__() 
        
        self.in_channels = 16
        
        self.conv = conv3x3(3, 16)
        self.bn = nn.BatchNorm2d(16) 
        self.relu = nn.ReLU(inplace=True) 
        self.layer1 = self.make_layer(block, 16, layers[0]) # stride为1
        self.layer2 = self.make_layer(block, 32, layers[1], 2) # stride为2
        self.layer3 = self.make_layer(block, 64, layers[2], 2) # stride为2
        self.avg_pool = nn.AvgPool2d(8) 
        self.fc = nn.Linear(64, num_classes) 
        
    def make_layer(self, block, out_channel, blocks, stride=1):
        downsample = None
        if (stride != 1) or (self.in_channels != out_channel):
            downsample = nn.Sequential(
                conv3x3(self.in_channels, out_channel, stride=stride),
                nn.BatchNorm2d(out_channel)) 
        layers = [] 
        # block为残差块
        layers.append(block(self.in_channels, out_channel, stride, downsample)) 
        self.in_channels = out_channel 
        for i in range(1, blocks):
            layers.append(block(out_channel, out_channel)) 
        return nn.Sequential(*layers) # 加* 表示转为元组turple
        
    def forward(self, x):
        out = self.conv(x) 
        out = self.bn(out) 
        out = self.relu(out)
        out = self.layer1(out) 
        out = self.layer2(out) 
        out = self.layer3(out) 
        out = self.avg_pool(out) 
        out = out.view(out.size(0), -1) 
        out = self.fc(out) 
        return out
    
resnet = ResNet(ResidualBlock, [2,2,2]) # 神经网络
resnet = resnet.to(device)

loss_func = nn.CrossEntropyLoss() # 交叉熵损失函数
optim = torch.optim.Adam(resnet.parameters(), learning_rate)  # 优化器

# 更新学习速率
def update_lr(optim, lr):
    for param_group in optim.param_group:
        param_group['lr'] = lr 

total_step = len(data_trainloader) # 训练总步数
curr_lr = learning_rate  # 现有的学习速率
# 训练模型
for epoch in range(epochs):
    print("------第{}次迭代------".format(epoch+1))
    for i, (images, labels) in enumerate(data_trainloader):
        images, labels = images.to(device), labels.to(device) 
        
        # forward
        outputs = resnet(images)
        loss = loss_func(outputs, labels)
        
        # backward and optimize
        optim.zero_grad()
        loss.backward()
        optim.step()
        
        if i % 100 == 0:
            print("Epoch[{}/{}],Step[{}/{}],loss[{:.4f}]".format(epoch+1,epochs,i+1,total_step,loss.item()))
    
    if (epoch + 1) % 20 == 0:
        curr_lr /= 3
        update_lr(optim, curr_lr) 
    
resnet.eval()
with torch.no_grad():
    total = 0
    correct = 0
    for images, labels in data_testloader:
        images, labels = images.to(device), labels.to(device) 
        outputs = resnet(images)              
        _, predicted = torch.max(outputs.data, 1) # 1是每行最大值的索引
        total += labels.size(0)
        correct += (predicted == labels).sum().item() 
    
    print('Accuracy of the model on the test images:{} %'.format(100 * correct/total)) 


