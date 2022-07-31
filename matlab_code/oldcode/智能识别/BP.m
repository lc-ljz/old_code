%BP.m
clear variables
clc
 
load ('../test_images.mat');
load ('../test_labels.mat');
load ('../train_images.mat');
load ('../train_labels.mat');
% 设置数据容量以及神经元个数
train_num = 3000;
test_num = 200;
neure_num = 200;
 
p = mat2vector(train_images(:,:,1:train_num),train_num);% 转为行向量
label = zeros(10,train_num);
%由于神经元输出为0和1，我们有十类，因此需要将转为十维行向量来表示
for i=1:train_num 
    label(train_labels1(i)+1,i)=1;
end
t = label;
 
test = mat2vector(test_images(:,:,1:test_num),test_num);
% 搭建单层bp网络，{}中为隐藏层和输出层函数，这里隐藏层设置为对数s型函数，输出选择线性函数输出
% 最后一个参数为训练方法，这里设置为最速下降法。可以参考文档对网络结构进行修改
net = newff(p',t,neure_num,{'logsig', 'purelin'}, 'traingd');
% 设置超参数
net.trainParam.goal = 0.01;
net.trainParam.epochs = 1500;
net.trainParam.lr = 0.2;
net.trainParam.showWindow = 1;
%  这里matlab会自动帮我们划分训练验证测试集，我们已经自行进行了划分，因此参数置空
net.divideFcn = '';
 
net = train(net,p',t);
% 测试网络训练的结果
y_test = sim(net,test');
y_label = zeros(1,test_num);
for i =1:test_num
    [val,pos] = max(y_test(:,i));
    y_label(i) =pos-1; 
end
acc = 0.;
for j =1:test_num
    if y_label(j)==test_labels1(j)
        acc = acc +1;
    end
end
fprintf('精确度为：%5.2f%%\n',(acc/test_num)*100);