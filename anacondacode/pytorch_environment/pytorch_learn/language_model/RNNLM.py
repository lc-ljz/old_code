# -*- coding: utf-8 -*-
"""
Created on Sat Mar  5 20:01:13 2022

@author: LJZ
"""

import torch 
import torch.nn as nn 
import numpy as np 
from data_utils import Corpus
from torch.nn.utils import clip_grad_norm_


# 设备定义
device = torch.device("cuda" if torch.cuda.is_available() else "cpu") 

# 关键参数
batch_size = 20
num_epoches = 5
embed_size = 128
hidden_size = 1024 
num_layers = 1 
seq_length = 30
num_samples = 1000
learning_rate = 0.002 
# %%
# 加载 "Penn Treebank" 数据集
corpus = Corpus() 
ids = corpus.get_data("data/train.txt", batch_size)
vocab_size = len(corpus.dictionary) # 字典长度
num_batches = ids.size(1) // seq_length 

class RNNLM(nn.Module):
    
    def __init__(self, vocab_size, embed_size, hidden_size, num_layers):
        super(RNNLM, self).__init__() 
        self.embed = nn.Embedding(vocab_size, embed_size) 
        self.lstm = nn.LSTM(embed_size, hidden_size, num_layers, batch_first=True)  
        self.linear = nn.Linear(hidden_size, vocab_size)
        
    def forward(self, x, h):
        # 嵌入层
        x = self.embed(x)
        # lstm层
        out, (h, c) = self.lstm(x, h)
        # Reshape output to (batch_size*sequence_length, hidden_size) 
        out = out.reshape(out.size(0)*out.size(1), out.size(2)) 
        # 解码所有时间步骤的隐藏状态
        out = self.linear(out)
        return out, (h, c)
    
rnnlm = RNNLM(vocab_size, embed_size, hidden_size, num_layers).to(device)

# loss and optim
loss_fn = nn.CrossEntropyLoss() 
optim = torch.optim.Adam(rnnlm.parameters(), learning_rate)

# 截断反向传播
def detach(states):
    return [state.detach() for state in states] 

# train
for epoch in range(num_epoches):
    
    # 初始化 hidden 和 cell
    states = (torch.zeros(num_layers, batch_size, hidden_size).to(device),
              torch.zeros(num_layers, batch_size,hidden_size).to(device))
    
    for i in range(0, ids.size(1)-seq_length, seq_length):
    
        # Get mini-batch inputs and targets 
        inputs = ids[:,i:i+seq_length].to(device)
        targets = ids[:,(i+1):(i+1)+seq_length].to(device) 
        
        states = detach(states) 
        outputs, states = rnnlm(inputs, states) 
        # print(inputs.shape)
        # print(outputs.shape)
        loss = loss_fn(outputs, targets.reshape(-1)) 
        
        # print("outputs:", outputs.shape) 
        # print("targets:", targets.reshape(-1).shape) 
        # print("loss:", loss.item()) 
        # break
    
        optim.zero_grad() 
        loss.backward() 
        clip_grad_norm_(rnnlm.parameters(), 0.5) # 梯度裁剪，最大0.5
        optim.step() 
        
        step = (i + 1) // seq_length 
        if step % 100 == 0:
            print('Epoch[{}/{}], Step[{}/{}], Loss:{:.4f}, Perplexity:{:5.2f}'
                  .format(epoch+1, num_epoches, step, num_batches, loss.item(), np.exp(loss.item())))

# %%
# test the model
with torch.no_grad():
    with open('sample.txt', 'w') as f:
        state = (torch.zeros(num_layers, 1, hidden_size).to(device),
                 torch.zeros(num_layers, 1, hidden_size).to(device))
        
        prob = torch.ones(vocab_size) 
        input = torch.multinomial(prob, num_samples=1).unsqueeze(1).to(device) # 取下标,unsqueeze升维
        
        for i in range(num_samples):
            output, state = rnnlm(input, state) 
            
            prob = output.exp() 
            word_id = torch.multinomial(prob, num_samples=1).item() 
            
            input.fill_(word_id) # 填充为指定的value
            word = corpus.dictionary.idx2word[word_id] 
            word = '\n' if word == '<eos>' else word + ' '
            f.write(word) 
            
            if (i + 1) % 100 == 0:
                print("Sampled [{}/{}], words and save to {}".format(i+1,num_samples,"sample.txt"))
            
# Save the model checkpoints
# torch.save(rnnlm.state_dict(), 'model.ckpt')       
