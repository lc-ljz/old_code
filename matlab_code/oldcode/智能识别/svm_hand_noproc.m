%svm_hand_noproc
clear variables
clc
 
load ('../train_images.mat');
load ('../train_labels.mat');
train_num = 500;
 
fprintf('处理前手写结果：\n');
result_hand = zeros(1,8);
 
%训练数据，是否需要二值化
% for i = 1:train_num%将数据集中要用的部分二值化，方便统一处理。
%     train_images(:,:,i) = imbinarize(train_images(:,:,i));
% end
 
data_train = mat2vector(train_images(:,:,1:train_num),train_num);%图像转向量
t = templateSVM('KernelFunction','linear');
svm_model = fitcecoc(data_train,train_labels1(1:train_num),'Learners',t);%训练模型
acc = 0.;
for x =0:9%选择测试的数字类
    for index = 1:8
        fname = sprintf('../手写/%d/%d.bmp',[x,index]);
        sample_hand = imresize(rgb2gray(imread(fname)),[28,28]);%统一大小，同时转为灰度图像
         result_hand(index+1)  = predict(svm_model,mat2vector(sample_hand,1));%结果预测
    end
    for num = 1:8
        if result_hand(num)==x
            acc = acc+1;
         end
    end
end
fprintf('精确度为：%5.2f%%\n',(acc/80)*100);