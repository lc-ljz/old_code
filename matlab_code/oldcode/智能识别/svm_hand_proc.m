%svm_hand_proc
clear variables
clc
 
load ('../train_images.mat');
load ('../train_labels.mat');
train_num = 1000;
 
% 对手写进行处理 
 fprintf('处理后结果：\n');
 
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
        sample_hand = image_proc(imread(fname),28);  %调用函数，尽量将手写数字和mnist进行统一
        result_hand(index) = predict(svm_model,mat2vector(sample_hand,1));
        %处理结果转换为向量进行预测
    end
    for num = 1:8
        if result_hand(num)==x
            acc = acc+1;
        end
    end
end
fprintf('精确度为：%5.2f%%\n',(acc/80)*100);