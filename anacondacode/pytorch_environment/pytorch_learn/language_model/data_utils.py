# -*- coding: utf-8 -*-
"""
Created on Sat Mar  5 20:16:19 2022

@author: LJZ
"""

import torch 
import os 

# 建立文字字典
class Dictionary(object):
    def __init__(self):
        self.word2idx = {}
        self.idx2word = {}
        self.idx = 0
        
    def add_word(self, word):
        if not word in self.word2idx: # 不会重复，以第一次为准,查找的是key
            self.word2idx[word] = self.idx 
            self.idx2word[self.idx] = word 
            self.idx += 1
            
    def __len__(self): # len(Dictionary)时调用
        return len(self.word2idx) 
    
class Corpus(object):
    
    def __init__(self):
        self.dictionary = Dictionary() 
        
    def get_data(self, path, batch_size=20):
        # 把文字添加到字典中
        with open(path, "r") as f:
            tokens = 0
            for line in f:
                # print("line:", line) # line为一行
                words = line.split() + ['<eos>'] # words为这一行的字符串集合+<eos>,<class 'list'> 
                # print("words:", words)
                tokens += len(words) # 所有单词数，包括重复的单词和<eos>,929589
                for word in words: # word为一个单词
                    self.dictionary.add_word(word) 
        # print(self.dictionary.idx2word[1]) # banknote
        
        # 标记文件内容
        ids = torch.LongTensor(tokens)
        # print(ids.size(0))
        token = 0
        with open(path, "r") as f:
            for line in f:
                words = line.split() + ['<eos>']
                for word in words:
                    ids[token] = self.dictionary.word2idx[word] 
                    token += 1
        # ids中key为序号,value为单词第一次出现的标号
        num_batches = ids.size(0) // batch_size # 一个batch内单词的数量, //去一法
        ids = ids[:num_batches*batch_size]
        return ids.view(batch_size, -1) # x为batchsize，y为numbatchs , 20x46479

# a = Corpus()
# ids = a.get_data('data/train.txt')
# id = ids.data.numpy()