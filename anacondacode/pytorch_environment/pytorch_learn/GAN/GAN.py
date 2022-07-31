# -*- coding: utf-8 -*-
"""
Created on Wed Mar  9 13:17:58 2022

@author: LJZ

生成对抗网络
"""

import os
import torch 
import torchvision 
import torch.nn as nn
from torchvision import transforms

# 设备
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# 参数
sample_dir = 'sample'
batch_size = 100 
image_size = 28*28 
hidden_size = 256
latent_size = 64
num_epochs = 2 # 200 

# 创建样本目录
if not os.path.exists(sample_dir):
    os.makedirs(sample_dir) 

transform = transforms.Compose([
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.5], std=[0.5])]) 

# dataset
mnist = torchvision.datasets.MNIST('../../dataset/MNIST_set', train=True, transform=transform)

# dataloader
data_loader = torch.utils.data.DataLoader(dataset=mnist, batch_size=batch_size, shuffle=True) 

# 判别模型(Discriminator) D 
D = nn.Sequential(
    nn.Linear(image_size, hidden_size),
    nn.LeakyReLU(0.2),
    nn.Linear(hidden_size, hidden_size),
    nn.LeakyReLU(0.2),
    nn.Linear(hidden_size, 1),
    nn.Sigmoid())

# 生成模型(Generator) G
G = nn.Sequential(
    nn.Linear(latent_size, hidden_size),
    nn.ReLU(),
    nn.Linear(hidden_size, hidden_size),
    nn.ReLU(),
    nn.Linear(hidden_size, image_size),
    nn.Tanh()) 

D = D.to(device) 
G = G.to(device) 

# 二分loss   and  optim
loss_fn = nn.BCELoss() 
D_optim = torch.optim.Adam(D.parameters(), lr=0.0002) 
G_optim = torch.optim.Adam(G.parameters(), lr=0.0002) 


def denorm(x):
    out = (x + 1) / 2
    return out.clamp(0, 1)


def resetgrad():
    D_optim.zero_grad() 
    G_optim.zero_grad() 

total_step = len(data_loader) 
for epoch in range(num_epochs):
    for i,(images, _) in enumerate(data_loader):
        images = images.reshape(batch_size, -1).to(device) 
        
        real_labels = torch.ones(batch_size, 1).to(device) 
        fake_labels = torch.zeros(batch_size, 1).to(device) 

        # ##  train the discriminator
        outputs = D(images) 
        D_loss_real = loss_fn(outputs, real_labels) 
        real_score = outputs
        
        z = torch.randn(batch_size, latent_size).to(device) 
        fake_images = G(z) 
        outputs = D(fake_images) 
        D_loss_fake = loss_fn(outputs, fake_labels) 
        fake_score = outputs 
        
        # backward
        D_loss = D_loss_real + D_loss_fake 
        resetgrad() 
        D_loss.backward() 
        D_optim.step() 
        
        # ##  train the generator
        
        z = torch.randn(batch_size, latent_size).to(device) 
        fake_images = G(z) 
        outputs = D(fake_images) 
        G_loss = loss_fn(outputs, real_labels)
        
        resetgrad() 
        G_loss.backward()
        G_optim.step() 
        
        if (i+1) % 100 == 0:
            print('Epoch[{}/{}], step[{}/{}], D_loss:{:.4f}, G_loss:{:.4f}, D(x):{:.2f}, D(G(z)): {:.2f}'
                  .format(epoch+1,num_epochs, i+1, total_step, D_loss.item(), G_loss.item(), 
                          real_score.mean().item(), fake_score.mean().item())) 
        
    # ###    
    # Save real images
    from torchvision.utils import save_image
    if (epoch+1) == 1:
        images = images.reshape(images.size(0), 1, 28, 28)
        save_image(denorm(images), os.path.join(sample_dir, 'real_images.png'))
    
    # Save sampled images
    fake_images = fake_images.reshape(fake_images.size(0), 1, 28, 28)
    save_image(denorm(fake_images), os.path.join(sample_dir, 'fake_images-{}.png'.format(epoch+1)))

# Save the model checkpoints 
torch.save(G.state_dict(), 'G.ckpt')
torch.save(D.state_dict(), 'D.ckpt')        
        

