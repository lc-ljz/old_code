%CNN.m
clear variables
clc
 
% matlab�Դ��cnn��ģ��
% ����matlab���������м��ɺõĶ�mnist�Ľӿڣ���֮ǰ����ʹ�õ�����һ�£�����ֱ�ӵ���
digitDatasetPath = fullfile(matlabroot,'toolbox','nnet', ...
    'nndemos','nndatasets','DigitDataset');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
numTrainingFiles = 0.6;
[imdsTrain,imdsTest] = splitEachLabel(imds,numTrainingFiles,'randomize');%�Զ�������Լ�
% ���������������ǵ�����ṹ��ĿǰΪ����cnn�������28*28*1��Ȼ��20��5*5����˵ľ���㣬����
% һ��2*2�ĳػ��㣬��relu�����������������һ��ȫ���Ӳ���Ϊ��������о�����ֿ�������padding��
% �������Ϊsame����ô���ǰ��ͼ���С����
% layers = [ ...
%     imageInputLayer([28 28 1])
%     convolution2dLayer(5,10,'Stride',1,'Padding','same')
%     maxPooling2dLayer(2,'Stride',2)
%     reluLayer
%     fullyConnectedLayer(10)
%     softmaxLayer
%     classificationLayer];
% % ��������lenet5������ṹ���ھ�����padding����������
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
% �ò���Ϊѵ�����������ã�ѵ���ִΣ����ȣ��Ƿ���ʾ�ȵȣ�������Բ����ĵ�
options = trainingOptions('adam', ...
    'ExecutionEnvironment','gpu', ...
    'MaxEpochs',50,...
    'InitialLearnRate',1e-4, ...
    'Verbose',false, ...
    'Plots','training-progress');
% ѵ������
net = trainNetwork(imdsTrain,layers,options);
% Ԥ��
YPred = classify(net,imdsTest);
YTest = imdsTest.Labels;
accuracy = sum(YPred == YTest)/numel(YTest);
fprintf('��ȷ��Ϊ��%5.2f%%\n',accuracy*100);%��ӡ���Ƚ��