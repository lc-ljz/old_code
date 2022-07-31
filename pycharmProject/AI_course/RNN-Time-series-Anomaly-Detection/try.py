
# with open("dataset/ecg/raw/chfdbchf15.txt", "r") as f:
#     index = 0
#     labeled_data = []
#     for i, line in enumerate(f):
#         tokens = [float(token) for token in line.split()]
#         tokens.pop(0)
#         tokens.append(1.0)
#         print(line[:-1])
#         # print("i = ", i, "+", "tokens = ", tokens)
#         index = index + 1
#         if index > 5:
#             break
#         labeled_data.append(tokens)
#     print(labeled_data)
#     for i, datapoint in enumerate(labeled_data):
#         for j, channel in enumerate(datapoint[:-1]):
#             print("j = ", j, channel, "A")


# import pickle
# word = pickle.load(open("dataset/ecg/labeled/train/chfdb_chf13_45590.pkl", 'rb'), encoding='utf-8')
# print(word)

# import numpy as np
# import pickle
# import torch
# with open("dataset/ecg/labeled/whole/chfdbchf15.pkl", "rb") as f:
#     data = pickle.load(f)
#     data = np.array(data)
#     print(data.shape)
#     label = data[:, -1]
#     data = data[:, :-1]
#     print(label.shape)
#     print(data.shape)
#     bsz = 32
#     n_batch = data.shape[0] // bsz
#     data = torch.FloatTensor(data)
#     trimmed_data = data.narrow(0, 0, n_batch * bsz)
#     batched_data = trimmed_data.contiguous().view(bsz, -1, trimmed_data.size(-1)).transpose(0, 1)
#     print("A ", trimmed_data.shape)
#     print("B ", batched_data.shape)


# import argparse
# import torch
# import preprocess_data
#
# parser = argparse.ArgumentParser(description='PyTorch RNN Prediction Model on Time-series Dataset')
# parser.add_argument('--data', type=str, default='ecg',
#                     help='type of the dataset (ecg, gesture, power_demand, space_shuttle, respiration, nyc_taxi')
# parser.add_argument('--filename', type=str, default='chfdb_chf13_45590.pkl',
#                     help='filename of the dataset')
# parser.add_argument('--model', type=str, default='LSTM',
#                     help='type of recurrent net (RNN_TANH, RNN_RELU, LSTM, GRU, SRU)')
# parser.add_argument('--augment', type=bool, default=True,
#                     help='augment')
# parser.add_argument('--batch_size', type=int, default=64, metavar='N',
#                     help='batch size')
# parser.add_argument('--eval_batch_size', type=int, default=64, metavar='N',
#                     help='eval_batch size')
# parser.add_argument('--seed', type=int, default=1111,
#                     help='random seed')
# parser.add_argument('--device', type=str, default='cpu',
#                     help='cuda or cpu')
#
# args = parser.parse_args()
# # Set the random seed manually for reproducibility.
# torch.manual_seed(args.seed)
# torch.cuda.manual_seed(args.seed)
#
# ###############################################################################
# # Load data
# ###############################################################################
# TimeseriesData = preprocess_data.PickleDataLoad(data_type=args.data, filename=args.filename,
#                                                 augment_test_data=args.augment)
# train_dataset = TimeseriesData.batchify(args, TimeseriesData.trainData, args.batch_size)
# test_dataset = TimeseriesData.batchify(args, TimeseriesData.testData, args.eval_batch_size)
# gen_dataset = TimeseriesData.batchify(args, TimeseriesData.testData, 1)
#
# print(train_dataset.shape)
# print(test_dataset.shape)
# print(gen_dataset.shape)

# import numpy as np
# import torch
# a = np.array([[1, 2], [3, 4], [5, 6]])
# a = torch.tensor(a)
# print(a[0].unsqueeze(0))
# print(a[0].unsqueeze(0).shape)

import pickle

recall = pickle.load(open("result/ecg/chfdb_chf13_45590/recall.pkl", 'rb'), encoding='utf-8')
f1 = pickle.load(open("result/ecg/chfdb_chf13_45590/f_beta.pkl", 'rb'), encoding='utf-8')
precision = pickle.load(open("result/ecg/chfdb_chf13_45590/precision.pkl", 'rb'), encoding='utf-8')

# print(recall[0].shape)
# print(f1[0].shape)
# print(precision[0].shape)

print(f1[1][recall[1] == precision[1]])
# print(recall[0] == f1[0])
