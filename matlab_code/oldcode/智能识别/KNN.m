%KNN.m
clc 
clear variables
 
load ('../test_images.mat');
load ('../test_labels.mat');
load ('../train_images.mat');
load ('../train_labels.mat');
% 选取数据容量
train_num = 2000;
test_num = 200;
data_train = mat2vector(train_images(:,:,1:train_num),train_num);% 转换为行向量
data_test = mat2vector(test_images(:,:,1:test_num),test_num);
% 参数说明：knn要求在一个范围内选取近邻样本，这个容量需要手动给出，这里我们给20个
% 其他参数如距离计算模式，距离权重均为默认，如欧式距离，等权值等。
% 具体结果可以在运行后查看knn_model来详细观察
knn_model = fitcknn(data_train,train_labels1(1:train_num),'NumNeighbors',20);
result = predict(knn_model,data_test);
acc = 0.;
for i = 1:test_num
    if result(i)==test_labels1(i)
        acc = acc+1;
    end
end
fprintf('精确度为：%5.2f%%\n',(acc/test_num)*100);