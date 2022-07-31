# -*- coding: utf-8 -*-
"""
Created on Thu Mar 10 09:42:53 2022

@author: LJZ

 VAE:Variational Auto-Encoder(变分自编码器) 
 变分自编码器
"""

import os 
import torch 
import torchvision 
from torchvision import transforms
import torch.nn as nn 
import torch.nn.functional as F
from torchvision.utils import save_image

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

batch_size = 128 
image_size = 28*28
h_dim = 400 
z_dim = 20 
num_epoches = 2 # 15
learning_rate = 1e-3 

# Create a directory if not exists
sample_dir = 'samples'
if not os.path.exists(sample_dir):
    os.makedirs(sample_dir)

dataset = torchvision.datasets.MNIST('../../dataset/MNIST_set', train=True, transform=transforms.ToTensor()) 

data_loader = torch.utils.data.DataLoader(dataset=dataset, batch_size=batch_size, shuffle=True) 

class VAE(nn.Module):
    
    def __init__(self, image_size, h_dim, z_dim):
        super(VAE, self).__init__()
        self.fc1 = nn.Linear(image_size, h_dim) 
        self.fc2 = nn.Linear(h_dim, z_dim)
        self.fc3 = nn.Linear(h_dim, z_dim) 
        self.fc4 = nn.Linear(z_dim, h_dim)
        self.fc5 = nn.Linear(h_dim, image_size) 
    
    def encode(self, x):
        h = F.relu(self.fc1(x)) 
        return self.fc2(h), self.fc3(h) 
    
    def reparameterize(self, mu, log_var):
        std = torch.exp(log_var/2) 
        eps = torch.randn_like(std) # 一个和输入大小相同的张量，其由均值为0、方差为1的标准正态分布填充
        return mu + eps * std
    
    def decode(self, z):
        h = F.relu(self.fc4(z)) 
        return F.sigmoid(self.fc5(h)) 
    
    def forward(self, x):
        mu, log_var = self.encode(x) 
        z = self.reparameterize(mu, log_var) 
        x_reconst = self.decode(z)
        return x_reconst, mu, log_var 
    
vae = VAE(image_size, h_dim, z_dim).to(device) 
optim = torch.optim.Adam(vae.parameters(), lr=learning_rate)

for epoch in range(num_epoches):
    
    for i,(images,_) in enumerate(data_loader):
        
        x = images.to(device).view(-1, image_size)
        x_reconst, mu, log_var = vae(x) 
        
        reconst_loss = F.cross_entropy(x_reconst, x, size_average=False)
        kl_div = - 0.5 * torch.sum(1 + log_var - mu.pow(2) - log_var.exp()) # 为了让均值为0，方差为1
        # For KL divergence, see Appendix B in VAE paper or http://yunjey47.tistory.com/43
        
        loss = reconst_loss + kl_div
        optim.zero_grad()
        loss.backward()
        optim.step()
        
        if (i+1) % 10 == 0:
           print ("Epoch[{}/{}], Step [{}/{}], Reconst Loss: {:.4f}, KL Div: {:.4f}" 
                  .format(epoch+1, num_epoches, i+1, len(data_loader), reconst_loss.item(), kl_div.item()))
        
        
    with torch.no_grad():
        # Save the sampled images
        z = torch.randn(batch_size, z_dim).to(device)
        out = vae.decode(z).view(-1, 1, 28, 28)
        save_image(out, os.path.join(sample_dir, 'sampled-{}.png'.format(epoch+1)))

        # Save the reconstructed images
        out, _, _ = vae(x)
        x_concat = torch.cat([x.view(-1, 1, 28, 28), out.view(-1, 1, 28, 28)], dim=3)
        save_image(x_concat, os.path.join(sample_dir, 'reconst-{}.png'.format(epoch+1)))