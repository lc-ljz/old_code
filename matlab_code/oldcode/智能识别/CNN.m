%CNN.m
clear variables
clc
 
% matlab自带搭建cnn的模板
% 这里matlab工具箱里有集成好的对mnist的接口，和之前我们使用的数据一致，可以直接调用
digitDatasetPath = fullfile(matlabroot,'toolbox','nnet', ...
    'nndemos','nndatasets','DigitDataset');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
numTrainingFiles = 0.6;
[imdsTrain,imdsTest] = splitEachLabel(imds,numTrainingFiles,'randomize');%自动分配测试集
% 在这里来调整我们的网络结构，目前为单层cnn，输入层28*28*1，然后20个5*5卷积核的卷积层，加上
% 一个2*2的池化层，用relu函数做激活函数，最后加一个全连接层作为输出。其中卷积部分可以设置padding，
% 如果设置为same，那么卷积前后图像大小不变
% layers = [ ...
%     imageInputLayer([28 28 1])
%     convolution2dLayer(5,10,'Stride',1,'Padding','same')
%     maxPooling2dLayer(2,'Stride',2)
%     reluLayer
%     fullyConnectedLayer(10)
%     softmaxLayer
%     classificationLayer];
% % 下面则是lenet5的网络结构，在卷积层对padding进行了设置
layers = [ ...
    imageInputLayer([28 28 1])
    convolution2dLayer(5,20,'Stride',1,'Padding','same')
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(5,16,'Stride',1,'Padding','same')
    reluLayer
    maxPooling2dLayer(2,'Stride',2,'Padding','same')
    fullyConnectedLayer(120)
    reluLayer
    fullyConnectedLayer(84)
    reluLayer
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];
% 该部分为训练超参数设置，训练轮次，精度，是否显示等等，具体可以参照文档
options = trainingOptions('adam', ...
    'ExecutionEnvironment','gpu', ...
    'MaxEpochs',50,...
    'InitialLearnRate',1e-4, ...
    'Verbose',false, ...
    'Plots','training-progress');
% 训练部分
net = trainNetwork(imdsTrain,layers,options);
% 预测
YPred = classify(net,imdsTest);
YTest = imdsTest.Labels;
accuracy = sum(YPred == YTest)/numel(YTest);
fprintf('精确度为：%5.2f%%\n',accuracy*100);%打印精度结果