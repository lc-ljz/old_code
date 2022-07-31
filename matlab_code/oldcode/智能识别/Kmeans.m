%Kmeans.m
clc
clear variables
 
load ('../train_images.mat');
load ('../train_labels.mat');
train_num = 300;
 
show_result = cell(1,10);%建立cell容器存储聚类结果
data_train = mat2vector(train_images(:,:,1:train_num),train_num);%图像转向量
 
% 参数10为聚类类别总数，start为选取初始中心的方式，这里选择随机选取，其他方式可以参照文档
% 此外可以选取距离计算方式，设置Distance为各个值，默认为欧拉距离平方
result = kmeans(data_train,10,'Start','cluster');
 
% 按聚类结果将数据从原集中抽取出来，重新拼成一个图片
for num = 1:train_num
   show_result{1,result(num)} = [show_result{1,result(num)},train_images(:,:,num)];
end
max_len = 0;
for i = 1:10
    len = size(show_result{1,i},2);
    if len>max_len
        max_len = len;
    end
end
image = [];
for j = 1:10
    len = size(show_result{1,j},2);
    if len<max_len
        show_result{1,j} = [show_result{1,j},zeros(28,max_len-len)];
    end
    image = [image;show_result{1,j}];
end
imtool(image);