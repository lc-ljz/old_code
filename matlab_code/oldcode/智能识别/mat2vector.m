%  mat2vector.m
% 输入：图片数据（矩阵），样本个数
% 函数作用：将图片组转化为行向量的组合，每个行向量作为一张图片的特征
% 输出：样本数*图片像素数量大小的矩阵
function [data_]= mat2vector(data,num)
    [row,col,~] = size(data);
    data_ = zeros(num,row*col);
    for page = 1:num
        for rows = 1:row
            for cols = 1:col
                data_(page,((rows-1)*col+cols)) = im2double(data(rows,cols,page));
            end
        end
    end
end