%Perceptron.m
clear variables
clc
% 读取数据
load ('../test_images.mat');
load ('../test_labels.mat');
 
% 设定数据量
train_num = 1000;
test_num = 200;
% 临时变量以及各个感知器参数
j = 1;
lr = 0.01;%学习率
epoch = 10;%设定训练多少轮
number = [8,4];%要取的数字组合
 
% 提取数据中标签为任意组合的样本，共计200个
% 由于数据本身打乱过，因此可以直接取200个而不考虑样本不均衡问题
 
for i = 1:10000
    if test_labels1(i)==number(1)|| test_labels1(i)==number(2)
        data(:,:,j) = test_images(:,:,i);
        label(j) = test_labels1(i);%取相应标签
        j=j+1;
     if j>train_num+test_num
         break;
     end
    end
end
 
% 由于感知器输出结果仅为0、1，因此要将标签进行转换
% 本程序中，由于matlab计算不等式相对容易，因此没有对样本进行规范化
% 由于没有进行规范化，后面更新权值w需要借助标签，因此标签需要置-1和1
 
for k = 1:train_num+test_num
    if label(k)==number(1)
        label(k)=-1;
    end
    if label(k)==number(2)
        label(k)=1;
    end
end
 
data_ = mat2vector(data,train_num+test_num);%矩阵转向量
test_data = [data_(train_num+1:train_num+test_num,:),ones(test_num,1)];%这里对测试数据也进行增广变换
% test_data = data_(train_num+1:train_num+test_num,:);
% 训练权值
 
w=perceptionLearn(data_(1:train_num,:),label(1:train_num),lr,epoch);
% 测试（预测）
for k = 1:test_num
    if test_data(k,:)*w'>0
        result(k) = 1;
    else
        result(k) = -1;
    end
end
% 输出预测的准确率
acc = 0.;
for sample = 1:test_num
    if result(sample)==label(train_num+sample)
        acc = acc+1;
    end
end
fprintf('精确度为：%5.2f%%\n',(acc/test_num)*100);
 
