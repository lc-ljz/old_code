% svm.m
clear variables
clc
load ('../test_images.mat');
load ('../test_labels.mat');
load ('../train_images.mat');
load ('../train_labels.mat');
train_num = 500;
test_num = 100;
 
%ѵ�����ݣ��Ƿ���Ҫ��ֵ��
% for i = 1:train_num%�����ݼ���Ҫ�õĲ��ֶ�ֵ��������ͳһ����
%     train_images(:,:,i) = imbinarize(train_images(:,:,i));
%     test_images(:,:,i) = imbinarize(test_images(:,:,i));
% end
 
data_train = mat2vector(train_images(:,:,1:train_num),train_num);%ͼ��ת����
data_test = mat2vector(test_images(:,:,1:test_num),test_num);%mnist���ݼ�ͼ��Ϊ28*28
 
% ������������򵥵�����ģ������ʾ��SVM�пɵ��ĳ������ǳ��࣬����ʧ�����Լ�ѡ�õĺ˺�����
% �����Ҫ��һ���趨�����Բο������ĵ���������t =
% templateSVM('Standardize',1,'KernelFunction','gaussian');����t����fitcecoc����
 
t = templateSVM('KernelFunction','linear');
svm_model = fitcecoc(data_train,train_labels1(1:train_num),'Learners',t);
 
%ѵ��ģ�ͣ������Ƕ���࣬����ֱ�ӵ���fitcsvm
%���Խ��
 
result = predict(svm_model,data_test);
result = result.';
fprintf('Ԥ������');
result(1:20)%ȡ20����ӡ�����Ա�
fprintf('��ʵ�ֲ���');
test_labels1(1:20)
acc = 0.;
for i = 1:test_num
    if result(i)==test_labels1(i)
        acc = acc+1;
    end
end
fprintf('��ȷ��Ϊ��%5.2f%%\n',(acc/test_num)*100);
 
 

 

 
