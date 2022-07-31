%Perceptron.m
clear variables
clc
% ��ȡ����
load ('../test_images.mat');
load ('../test_labels.mat');
 
% �趨������
train_num = 1000;
test_num = 200;
% ��ʱ�����Լ�������֪������
j = 1;
lr = 0.01;%ѧϰ��
epoch = 10;%�趨ѵ��������
number = [8,4];%Ҫȡ���������
 
% ��ȡ�����б�ǩΪ������ϵ�����������200��
% �������ݱ�����ҹ�����˿���ֱ��ȡ200������������������������
 
for i = 1:10000
    if test_labels1(i)==number(1)|| test_labels1(i)==number(2)
        data(:,:,j) = test_images(:,:,i);
        label(j) = test_labels1(i);%ȡ��Ӧ��ǩ
        j=j+1;
     if j>train_num+test_num
         break;
     end
    end
end
 
% ���ڸ�֪����������Ϊ0��1�����Ҫ����ǩ����ת��
% �������У�����matlab���㲻��ʽ������ף����û�ж��������й淶��
% ����û�н��й淶�����������Ȩֵw��Ҫ������ǩ����˱�ǩ��Ҫ��-1��1
 
for k = 1:train_num+test_num
    if label(k)==number(1)
        label(k)=-1;
    end
    if label(k)==number(2)
        label(k)=1;
    end
end
 
data_ = mat2vector(data,train_num+test_num);%����ת����
test_data = [data_(train_num+1:train_num+test_num,:),ones(test_num,1)];%����Բ�������Ҳ��������任
% test_data = data_(train_num+1:train_num+test_num,:);
% ѵ��Ȩֵ
 
w=perceptionLearn(data_(1:train_num,:),label(1:train_num),lr,epoch);
% ���ԣ�Ԥ�⣩
for k = 1:test_num
    if test_data(k,:)*w'>0
        result(k) = 1;
    else
        result(k) = -1;
    end
end
% ���Ԥ���׼ȷ��
acc = 0.;
for sample = 1:test_num
    if result(sample)==label(train_num+sample)
        acc = acc+1;
    end
end
fprintf('��ȷ��Ϊ��%5.2f%%\n',(acc/test_num)*100);
 
