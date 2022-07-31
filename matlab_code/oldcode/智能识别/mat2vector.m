%  mat2vector.m
% ���룺ͼƬ���ݣ����󣩣���������
% �������ã���ͼƬ��ת��Ϊ����������ϣ�ÿ����������Ϊһ��ͼƬ������
% �����������*ͼƬ����������С�ľ���
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