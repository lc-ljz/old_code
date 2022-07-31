%svm_hand_noproc
clear variables
clc
 
load ('../train_images.mat');
load ('../train_labels.mat');
train_num = 500;
 
fprintf('����ǰ��д�����\n');
result_hand = zeros(1,8);
 
%ѵ�����ݣ��Ƿ���Ҫ��ֵ��
% for i = 1:train_num%�����ݼ���Ҫ�õĲ��ֶ�ֵ��������ͳһ����
%     train_images(:,:,i) = imbinarize(train_images(:,:,i));
% end
 
data_train = mat2vector(train_images(:,:,1:train_num),train_num);%ͼ��ת����
t = templateSVM('KernelFunction','linear');
svm_model = fitcecoc(data_train,train_labels1(1:train_num),'Learners',t);%ѵ��ģ��
acc = 0.;
for x =0:9%ѡ����Ե�������
    for index = 1:8
        fname = sprintf('../��д/%d/%d.bmp',[x,index]);
        sample_hand = imresize(rgb2gray(imread(fname)),[28,28]);%ͳһ��С��ͬʱתΪ�Ҷ�ͼ��
         result_hand(index+1)  = predict(svm_model,mat2vector(sample_hand,1));%���Ԥ��
    end
    for num = 1:8
        if result_hand(num)==x
            acc = acc+1;
         end
    end
end
fprintf('��ȷ��Ϊ��%5.2f%%\n',(acc/80)*100);