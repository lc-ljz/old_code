% Template_hand.m
% 手写数字模板匹配
clear all
clc
%读取模板
image = cell(1,10);%生成十个cell保存模板
for i = 0:9
    filename = sprintf('../手写/%d/2.bmp',i);
    image{1,i+1} = mat2vector(imresize(imread(filename),[28,28]),1);%与车牌数据处理相同
end
%待匹配样本
correct_num = 0;
for index = 0:9%每个数字测试一次
    distance = zeros(1,10);%保存计算得到的距离值
    fname = sprintf('../手写/%d/4.bmp',index);
    sample = mat2vector(imresize(imread(fname),[28,28]),1);%图片转换为行向量
    for j  = 1:10%共十个模板，计算与每个模板的距离
        distance(j) = pdist2(sample,image{1,j},'euclidean');
        %计算欧式距离，这里可以更改‘euclidean’为其他距离
    end
    [m,p] = min(distance);%计算距离最小值，并给出索引
    if p-1 == index
        correct_num = correct_num+1;
    end
    fprintf('数字%d到模板的最小距离为：%d,匹配到的类别为：%d\n',[index,m,p-1]);%打印匹配结果
end
fprintf('共测试10个样本，正确匹配个数为%d个\n',[correct_num]);