% svm.m
clear variables
clc
load ('../test_images.mat');
load ('../test_labels.mat');
load ('../train_images.mat');
load ('../train_labels.mat');
train_num = 500;
test_num = 100;
 
%训练数据，是否需要二值化
% for i = 1:train_num%将数据集中要用的部分二值化，方便统一处理。
%     train_images(:,:,i) = imbinarize(train_images(:,:,i));
%     test_images(:,:,i) = imbinarize(test_images(:,:,i));
% end
 
data_train = mat2vector(train_images(:,:,1:train_num),train_num);%图像转向量
data_test = mat2vector(test_images(:,:,1:test_num),test_num);%mnist数据集图像为28*28
 
% 这里我们用最简单的线性模型做演示；SVM中可调的超参数非常多，如损失函数以及选用的核函数等
% 如果需要进一步设定，可以参考帮助文档，如设置t =
% templateSVM('Standardize',1,'KernelFunction','gaussian');，将t送入fitcecoc即可
 
t = templateSVM('KernelFunction','linear');
svm_model = fitcecoc(data_train,train_labels1(1:train_num),'Learners',t);
 
%训练模型，由于是多分类，不能直接调用fitcsvm
%测试结果
 
result = predict(svm_model,data_test);
result = result.';
fprintf('预测结果：');
result(1:20)%取20个打印出来对比
fprintf('真实分布：');
test_labels1(1:20)
acc = 0.;
for i = 1:test_num
    if result(i)==test_labels1(i)
        acc = acc+1;
    end
end
fprintf('精确度为：%5.2f%%\n',(acc/test_num)*100);
 
 

 

 
