# -*- coding: utf-8 -*-
"""
Created on Mon Mar 21 11:15:26 2022

@author: LJZ
"""
import argparse 
import nltk
import pickle 
from pycocotools.coco import COCO 
from collections import Counter

class Vocabulary(object):
    
    def __init__(self):
        self.word2idx = {}
        self.idx2word = {}
        self.idx = 0
        
    def add_word(self, word):
        if not word in self.word2idx:
            self.word2idx[word] = self.idx
            self.idx2word[self.idx] = word
            self.idx += 1
            
    def __call__(self, word):
        if not word in self.word2idx:
            return self.word2idx['<unk>']
        return self.word2idx[word]

    def __len__(self):
        return len(self.word2idx)


def build_vocab(json, threshold):
    """ 建立词汇包装器 """
        
    coco = COCO(json) # 为实例注释初始化COCO的API
    counter = Counter() # 计数器
    ids = coco.anns.keys() 
    for i, id in enumerate(ids):
        caption = str(coco.anns[id]['caption']) # 得到图片标注
        tokens = nltk.tokenize.word_tokenize(caption.lower()) # lower大写字符变小写,word_tokenize单词分词
        counter.update(tokens) 
        
        if (i+1) % 1000 == 0:
            print("[{}/{}] Tokenized the captions.".format(i+1, len(ids))) 
    
    # 如果单词的频率少于阈值，单词会被丢弃
    words = [word for word, cnt in counter.items() if cnt >= threshold] 
    
    # 创造一个词汇包装器
    vocab = Vocabulary() 
    vocab.add_word('<pad>') 
    vocab.add_word('<start>') 
    vocab.add_word('<end>') 
    vocab.add_word('<unk>') 
    
    for i, word in enumerate(words):
        vocab.add_word(word) 
    return vocab 

def main(args):
    vocab = build_vocab(args.caption_path, args.threshold) 
    vocab_path = args.vocab_path 
    with open(vocab_path, 'wb') as f:
        pickle.dump(vocab, f) 
    print("Total vocabulary size:{}".format(len(vocab))) 
    print("Saved the vocabulary wrapper to '{}'".format(vocab_path)) 

if __name__ == "__main__":
    parser = argparse.ArgumentParser() 
    parser.add_argument("--caption_path", type=str, 
                        default="data/annotations/captions_train2014.json",
                        help="path for train annotation file") # 训练标注文件的路径
    parser.add_argument('--vocab_path', type=str, default='data/vocab.pkl', 
                        help='path for saving vocabulary wrapper')
    parser.add_argument('--threshold', type=int, default=4, 
                        help='minimum word count threshold') # 最小字数阈值
    args = parser.parse_args()
    main(args)
    