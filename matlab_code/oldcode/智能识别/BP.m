%BP.m
clear variables
clc
 
load ('../test_images.mat');
load ('../test_labels.mat');
load ('../train_images.mat');
load ('../train_labels.mat');
% �������������Լ���Ԫ����
train_num = 3000;
test_num = 200;
neure_num = 200;
 
p = mat2vector(train_images(:,:,1:train_num),train_num);% תΪ������
label = zeros(10,train_num);
%������Ԫ���Ϊ0��1��������ʮ�࣬�����Ҫ��תΪʮά����������ʾ
for i=1:train_num 
    label(train_labels1(i)+1,i)=1;
end
t = label;
 
test = mat2vector(test_images(:,:,1:test_num),test_num);
% �����bp���磬{}��Ϊ���ز������㺯�����������ز�����Ϊ����s�ͺ��������ѡ�����Ժ������
% ���һ������Ϊѵ����������������Ϊ�����½��������Բο��ĵ�������ṹ�����޸�
net = newff(p',t,neure_num,{'logsig', 'purelin'}, 'traingd');
% ���ó�����
net.trainParam.goal = 0.01;
net.trainParam.epochs = 1500;
net.trainParam.lr = 0.2;
net.trainParam.showWindow = 1;
%  ����matlab���Զ������ǻ���ѵ����֤���Լ��������Ѿ����н����˻��֣���˲����ÿ�
net.divideFcn = '';
 
net = train(net,p',t);
% ��������ѵ���Ľ��
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
fprintf('��ȷ��Ϊ��%5.2f%%\n',(acc/test_num)*100);