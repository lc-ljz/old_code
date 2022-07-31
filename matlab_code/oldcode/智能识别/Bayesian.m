%Bayesian.m
clear 
clc
load ('../test_images.mat');
load ('../test_labels.mat');
load ('../train_images.mat');
load ('../train_labels.mat');
train_num = 2000;
test_num = 200;
%训练数据
data_train = mat2vector(train_images(:,:,1:train_num),train_num);
%图像转向量
data_test = mat2vector(test_images(:,:,1:test_num),test_num);
% 这里对数据进行一次处理。贝叶斯分类器要求输入数据中同类别中一个特征的方差不能为0
% 由公式我们可以知道，计算后验概率时，如果某一列特征全部相同，那么后验概率计算时分母会变为0，
% 为了避免该种情况，需要对数据进行提前处理
[data_train,position] = data_proc(data_train,train_labels1(1:train_num)');
for rows = 1:10
    data_test(:,position{1,rows})=[];
end
%模型部分
% 超参数全部取了默认值，比较重要的，如类别的先验概率，如果不进行修改，则计算输入数据中类别的频率
% 查看nb_model即可确认所使用的超参数
nb_model = fitcnb(data_train,train_labels1(1:train_num));
%训练模型
%测试结果
result = predict(nb_model,data_test);
result = result.';
fprintf('预测结果：');
result(1:20)
%取20个打印出来对比
fprintf('真实分布：');
test_labels1(1:20)
% 整体正确率
acc = 0.;
for i = 1:test_num
    if result(i)==test_labels1(i)
        acc = acc+1;
    end
end
fprintf('精确度为：%5.2f%%\n',(acc/test_num)*100);