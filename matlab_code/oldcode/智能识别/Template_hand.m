% Template_hand.m
% ��д����ģ��ƥ��
clear all
clc
%��ȡģ��
image = cell(1,10);%����ʮ��cell����ģ��
for i = 0:9
    filename = sprintf('../��д/%d/2.bmp',i);
    image{1,i+1} = mat2vector(imresize(imread(filename),[28,28]),1);%�복�����ݴ�����ͬ
end
%��ƥ������
correct_num = 0;
for index = 0:9%ÿ�����ֲ���һ��
    distance = zeros(1,10);%�������õ��ľ���ֵ
    fname = sprintf('../��д/%d/4.bmp',index);
    sample = mat2vector(imresize(imread(fname),[28,28]),1);%ͼƬת��Ϊ������
    for j  = 1:10%��ʮ��ģ�壬������ÿ��ģ��ľ���
        distance(j) = pdist2(sample,image{1,j},'euclidean');
        %����ŷʽ���룬������Ը��ġ�euclidean��Ϊ��������
    end
    [m,p] = min(distance);%���������Сֵ������������
    if p-1 == index
        correct_num = correct_num+1;
    end
    fprintf('����%d��ģ�����С����Ϊ��%d,ƥ�䵽�����Ϊ��%d\n',[index,m,p-1]);%��ӡƥ����
end
fprintf('������10����������ȷƥ�����Ϊ%d��\n',[correct_num]);