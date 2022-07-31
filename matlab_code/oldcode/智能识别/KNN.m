%KNN.m
clc 
clear variables
 
load ('../test_images.mat');
load ('../test_labels.mat');
load ('../train_images.mat');
load ('../train_labels.mat');
% ѡȡ��������
train_num = 2000;
test_num = 200;
data_train = mat2vector(train_images(:,:,1:train_num),train_num);% ת��Ϊ������
data_test = mat2vector(test_images(:,:,1:test_num),test_num);
% ����˵����knnҪ����һ����Χ��ѡȡ�������������������Ҫ�ֶ��������������Ǹ�20��
% ����������������ģʽ������Ȩ�ؾ�ΪĬ�ϣ���ŷʽ���룬��Ȩֵ�ȡ�
% ���������������к�鿴knn_model����ϸ�۲�
knn_model = fitcknn(data_train,train_labels1(1:train_num),'NumNeighbors',20);
result = predict(knn_model,data_test);
acc = 0.;
for i = 1:test_num
    if result(i)==test_labels1(i)
        acc = acc+1;
    end
end
fprintf('��ȷ��Ϊ��%5.2f%%\n',(acc/test_num)*100);