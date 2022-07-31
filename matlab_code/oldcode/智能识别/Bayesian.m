%Bayesian.m
clear 
clc
load ('../test_images.mat');
load ('../test_labels.mat');
load ('../train_images.mat');
load ('../train_labels.mat');
train_num = 2000;
test_num = 200;
%ѵ������
data_train = mat2vector(train_images(:,:,1:train_num),train_num);
%ͼ��ת����
data_test = mat2vector(test_images(:,:,1:test_num),test_num);
% ��������ݽ���һ�δ�����Ҷ˹������Ҫ������������ͬ�����һ�������ķ����Ϊ0
% �ɹ�ʽ���ǿ���֪��������������ʱ�����ĳһ������ȫ����ͬ����ô������ʼ���ʱ��ĸ���Ϊ0��
% Ϊ�˱�������������Ҫ�����ݽ�����ǰ����
[data_train,position] = data_proc(data_train,train_labels1(1:train_num)');
for rows = 1:10
    data_test(:,position{1,rows})=[];
end
%ģ�Ͳ���
% ������ȫ��ȡ��Ĭ��ֵ���Ƚ���Ҫ�ģ�������������ʣ�����������޸ģ��������������������Ƶ��
% �鿴nb_model����ȷ����ʹ�õĳ�����
nb_model = fitcnb(data_train,train_labels1(1:train_num));
%ѵ��ģ��
%���Խ��
result = predict(nb_model,data_test);
result = result.';
fprintf('Ԥ������');
result(1:20)
%ȡ20����ӡ�����Ա�
fprintf('��ʵ�ֲ���');
test_labels1(1:20)
% ������ȷ��
acc = 0.;
for i = 1:test_num
    if result(i)==test_labels1(i)
        acc = acc+1;
    end
end
fprintf('��ȷ��Ϊ��%5.2f%%\n',(acc/test_num)*100);