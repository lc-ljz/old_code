%image_proc
% ���庯��������д���ֽ��д���ʹ�価������mnist�ĸ�ʽ
% ���룺ԭͼ�������������Ĵ�С
 
function [output] = image_proc(input,len)
     
    se = strel('square',3);%ͼ�����Ͳ���������ģʽ3����������
    temp = imcrop(rgb2gray(input),[25,25,200,200]);%�ü���ԭͼ�ױ߹���
    temp = imresize(temp,[len,len]);
    [rows,cols] = size(temp);%��ȡͼ���С
     
    for row = 1:rows
        for col = 1:cols
            if temp(row,col)==255
                temp(row,col)=0;%ͼ���ࣻmnistΪ�ڵװ��֣���дΪ�׵׺���
            else
                temp(row,col)=255;
            end
        end 
    end
    temp = imdilate(temp,se);
    %������д����ǳ�ϸ��������Ҫ����������ʹ���ʹ����Խӽ�mnist
    output = temp;
end