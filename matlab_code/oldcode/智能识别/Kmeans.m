%Kmeans.m
clc
clear variables
 
load ('../train_images.mat');
load ('../train_labels.mat');
train_num = 300;
 
show_result = cell(1,10);%����cell�����洢������
data_train = mat2vector(train_images(:,:,1:train_num),train_num);%ͼ��ת����
 
% ����10Ϊ�������������startΪѡȡ��ʼ���ĵķ�ʽ������ѡ�����ѡȡ��������ʽ���Բ����ĵ�
% �������ѡȡ������㷽ʽ������DistanceΪ����ֵ��Ĭ��Ϊŷ������ƽ��
result = kmeans(data_train,10,'Start','cluster');
 
% �������������ݴ�ԭ���г�ȡ����������ƴ��һ��ͼƬ
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