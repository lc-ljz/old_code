# -*- coding: utf-8 -*-
"""
Created on Fri Mar 11 09:50:57 2022

@author: LJZ

 NST： Neural Style Transfer（神经风格迁移）
 
"""

import torch 
import torch.nn as nn 
import torchvision 
from torchvision import transforms 
from torchvision import models 
from PIL import Image 
import numpy as np 
import argparse 

device = torch.device("cuda" if torch.cuda.is_available() else "cpu") 

def load_image(image_path, transform=None, max_size=None, shape=None):
    """   加载图片并转变为一个Tensor   """
    image = Image.open(image_path) # 2维
    
    if max_size:  # 图像尺寸缩放
        scale = max_size / max(image.size) 
        size = np.array(image.size) * scale # 最大边界为max_size
        # Image.ANTIALIAS 重新取样过滤器 LANCZOS = ANTIALIAS = 1 
        image = image.resize(size.astype(int), Image.ANTIALIAS) # resize image with high-quality
    
    if shape:
        image = image.resize(shape, Image.LANCZOS) # 2维
    
    if transform:
        image = transform(image).unsqueeze(0)  # (1, 3, 272, 400) 
    
    return image.to(device) # 3_d_image


class VGGNet(nn.Module):
    
    def __init__(self):
        super(VGGNet, self).__init__()
        self.select = ['0','5','10','19','28'] 
        self.vgg = models.vgg19(pretrained=True).features
    
    def forward(self, x):
        features = []
        for name, layer in self.vgg._modules.items():
            x = layer(x) 
            if name in self.select:
                features.append(x) 
        return features 

def main(config):
    
    transform = transforms.Compose([
        transforms.ToTensor(),
        transforms.Normalize(mean=(0.485, 0.456, 0.406), std=(0.229, 0.224, 0.225))]) # (3,272,400) 
    
    # 获取图像
    content = load_image(config.content, transform, max_size=config.max_size) 
    style = load_image(config.style, transform, shape=[content.size(2), content.size(3)]) 
    
    # 用 content image 初始化 一个 target image
    # 在不共享数据内存的同时支持梯度梯度传递与叠加,requires_grad__表梯度回传
    target = content.clone().requires_grad_(True) # clone 深拷贝
    
    optim = torch.optim.Adam([target], lr = config.lr, betas=[0.5, 0.999])
    vgg = VGGNet().to(device).eval()  # model.eval()的作用是不启用 Batch Normalization 和 Dropout
    
    for step in range(config.total_step):
        target_features = vgg(target)
        content_features = vgg(content)
        style_features = vgg(style) 
        
        style_loss = 0
        content_loss = 0
        for f1, f2, f3 in zip(target_features, content_features, style_features):
            # Compute content loss with target and content images
            content_loss += torch.mean((f1 - f2)**2) 
            # Reshape convolutional feature maps
            _, c, h, w = f1.size() 
            f1 = f1.view(c, h * w)
            f3 = f3.view(c, h * w) 
            
            # Compute gram matrix 矩阵相乘
            f1 = torch.mm(f1, f1.t())  
            f3 = torch.mm(f3, f3.t()) 
            
            style_loss += torch.mean((f1 - f3)**2) / (c * h * w) 
            
        loss = content_loss + config.style_weight * style_loss 
        optim.zero_grad() 
        loss.backward()
        optim.step() 
        
        if (step+1) % config.log_step == 0:
           print ('Step [{}/{}], Content Loss: {:.4f}, Style Loss: {:.4f}' 
                  .format(step+1, config.total_step, content_loss.item(), style_loss.item()))

        if (step+1) % config.sample_step == 0:
           # Save the generated image
           denorm = transforms.Normalize((-2.12, -2.04, -1.80), (4.37, 4.46, 4.44))
           img = target.clone().squeeze()
           img = denorm(img).clamp_(0, 1)
           torchvision.utils.save_image(img, 'output-{}.png'.format(step+1))


if __name__ == "__main__":
    parser = argparse.ArgumentParser() 
    parser.add_argument("--content", type=str, default="png/content.png") 
    parser.add_argument("--style", type=str, default="png/style.png") 
    parser.add_argument("--max_size", type=int, default=400) 
    parser.add_argument('--total_step', type=int, default=2000) # 2000
    parser.add_argument('--log_step', type=int, default=10)
    parser.add_argument('--sample_step', type=int, default=500)
    parser.add_argument('--style_weight', type=float, default=100)
    parser.add_argument('--lr', type=float, default=0.003)
    config = parser.parse_args() 
    print(config)
    main(config)  
    
    
