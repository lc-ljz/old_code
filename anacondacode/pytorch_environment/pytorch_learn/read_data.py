# -*- coding: utf-8 -*-
"""
Created on Wed Jan  5 11:01:33 2022

@author: LJZ
"""
from torch.utils.data import Dataset
import os
from PIL import Image

class MyData(Dataset):
    
    def __init__(self, root_dir, label_dir):
        self.root_dir = root_dir
        self.label_dir = label_dir
        self.path = os.path.join(self.root_dir, self.label_dir)
        self.image_path = os.listdir(self.path)
        
    def __getitem__(self, index):
        image_name = self.image_path[index]
        image_item_path = os.path.join(self.path, image_name)
        image = Image.open(image_item_path)
        label = self.label_dir
        return image, label
    
    def __len__(self):
        return len(self.image_path)

root_dir = '../dataset/hymenoptera_data/train'
ants_label_dir = 'ants'
bees_label_dir = 'bees'

ants_dataset = MyData(root_dir, ants_label_dir)
bees_dataset = MyData(root_dir, bees_label_dir)
    
train_dataset = ants_dataset + bees_dataset
