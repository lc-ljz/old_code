# -*- coding: utf-8 -*-
"""
Created on Tue Mar 22 15:02:06 2022

@author: LJZ
"""

import torch.utils.data as data 
from pycocotools.coco import COCO 
from PIL import Image 
import os 
import nltk 
import torch 

class CocoDataset(data.Dataset):
    
    def __init__(self, root, json, vocab, transform=None):
        
        self.root = root
        self.coco =  COCO(json) 
        self.ids = list(self.coco.anns.keys()) 
        self.vocab = vocab 
        self.transform = transform 
    
    def __getitem__(self, index):
        """ Returns one data pair (image and caption). """ 
        coco = self.coco 
        vocab = self.vocab 
        ann_id = self.ids[index] 
        caption = coco.anns[ann_id]['caption'] 
        img_id = coco.anns[ann_id]['image_id'] 
        path = coco.loadImgs(img_id)[0]['file_name'] 
        
        image = Image.open(os.path.join(self.root, path)).convert('RGB') 
        if self.transform is not None:
            image = self.transform(image) 
            
        tokens = nltk.tokenize.word_tokenize(str(caption).lower()) 
        caption = []
        caption.append(vocab('<start>'))
        caption.extend([vocab(token) for token in tokens]) 
        caption.append(vocab('<end>'))
        target = torch.Tensor(caption) 
        return image, target 
    
    def __len__(self):
        return len(self.ids)  
    

def collate_fn(data):
    """
    Creates mini-batch tensors from the list of tuples (image, caption)
    Args:
        data: list of tuple (image, caption). 
            - image: torch tensor of shape (3, 256, 256).
            - caption: torch tensor of shape (?); variable length.
    Returns:
        images: torch tensor of shape (batch_size, 3, 256, 256).
        targets: torch tensor of shape (batch_size, padded_length).
        lengths: list; valid length for each padded caption.
    """
    
    # Sort a data list by caption length (descending order).
    data.sort(key=lambda x:len(x[1]), reverse=True) 
    images, captions = zip(*data) # zip(*) 可理解为解压，返回二维矩阵式
    # Merge images (from tuple of 3D tensor to 4D tensor).
    images = torch.stack(images, 0) # 在维度上连接（concatenate）若干个张量
    
    lengths = [len(cap) for cap in captions] 
    targets = torch.zeros(len(captions), max(lengths)).long() # self.long() is equivalent to self.to(torch.int64)
    for i, cap in enumerate(captions):
        end = lengths[i] 
        targets[i, :end] = cap[:end] 
    return images, targets, lengths


def get_loader(root, json, vocab, transform, batch_size, shuffle, num_workers):
    """Returns torch.utils.data.DataLoader for custom coco dataset."""
    coco = CocoDataset(root, json, vocab, transform) 
    data_loader = torch.utils.data.DataLoader(dataset=coco, 
                                              batch_size=batch_size,
                                              shuffle=shuffle,
                                              num_workers=num_workers,
                                              collate_fn=collate_fn) 
    return data_loader 
