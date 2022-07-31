% Template_car.m
% 车牌数字模板匹配
% 读取10张模板0-9，由于本身是bmp，读到之后矩阵元素为uint8
% 需要转换为double方便计算
% 原图像大小不一致，并且维度较高，这里将所有的模板均重置为25*25
clear all
clc
image = cell(1,10);%生成十个cell保存模板
for i = 0:9
    filename = sprintf('../车牌/%d.bmp',i);%读取模板文件
    image{1,i+1} = mat2vector(imresize(imread(filename),[28,28]),1);
    %统一大小，之后调用函数将其转换为行向量
end
 
% 车牌数据
% 待匹配的样本，一样处理为25*25double类型
correct_num = 0;
for index = 0:9%每个数字测试一次
    distance = zeros(1,10);%保存计算得到的距离值
    fname = sprintf('../车牌/%d.1.bmp',index);
    sample = mat2vector(imresize(imread(fname),[28,28]),1);%图片转化为向量
    for j  = 1:10%共十个模板，计算与每个模板的距离
        distance(j) = pdist2(sample,image{1,j},'euclidean');
        %计算欧式距离，这里可以更改‘euclidean’为其他距离
    end
    [m,p] = min(distance);%计算距离最小值，并给出索引
     if p-1 == index
        correct_num = correct_num+1;
    end
    fprintf('数字%d到模板的最小距离为：%d,匹配到的类别为：%d\n',[index,m,p-1]);
    % 索引从1开始，模板从0开始，因此减一输出
end
fprintf('共测试10个样本，正确匹配个数为%d个\n',[correct_num]);