filedir = '.\orl_faces_original\';
train_images = zeros(40*7,1888);
train_labels = zeros(40*7,1);
test_images = zeros(40*3,1888);
test_labels = zeros(40*3,1);
t = 1;
p = 1;
for i = 1:40
    file = ['s', num2str(i)];
    filename = strcat(filedir,file);
    for j = 1:7   
        file2 = ['\',num2str(j), '.pgm'];
        filename2 = strcat(filename,file2);
        img = imread(filename2);
        feature_vector = extractLBPFeatures(img, 'Upright',true,'cellsize',[14 23]); 
        train_images(t,:) = feature_vector;
        train_labels(t) = i;
        t = t + 1;
    end
    for j = 8:10
        file2 = ['\',num2str(j), '.pgm'];
        filename2 = strcat(filename,file2);
        img = imread(filename2);
        feature_vector = extractLBPFeatures(img, 'Upright',true,'cellsize',[14 23]); 
        test_images(p,:) = feature_vector;
        test_labels(p) = i;
        p = p + 1;
    end
end


%%
%BP

test_num = 120;train_num = 280;
neure_num = 100;
label = zeros(40,train_num);
%������Ԫ���Ϊ0��1��������ʮ�࣬�����Ҫ��תΪʮά����������ʾ
for i=1:train_num 
    label(train_labels(i)+1,i)=1;
end
t = label;

p = train_images;

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
y_test = sim(net,test_images');
y_label = zeros(1,test_num);
for i =1:test_num
    [val,pos] = max(y_test(:,i));
    y_label(i) =pos-1; 
end
acc = 0.;
for j =1:test_num
    if y_label(j)==test_labels(j)
        acc = acc +1;
    end
end
fprintf('��ȷ��Ϊ��%5.2f%%\n',(acc/test_num)*100);



%%

test_num = 120;

t = templateSVM('KernelFunction','linear');
svm_model = fitcecoc(train_images,train_labels,'Learners',t);
result = predict(svm_model,test_images);

acc = 0.;
for i = 1:test_num
    if result(i)==test_labels(i)
        acc = acc+1;
    end
end
fprintf('SVM��ȷ��Ϊ��%5.2f%%\n',(acc/test_num)*100);

%%

knn_model = fitcknn(train_images,train_labels,'NumNeighbors',20);
result = predict(knn_model,test_images);
acc = 0.;
for i = 1:test_num
    if result(i)==test_labels(i)
        acc = acc+1;
    end
end
fprintf('K���ڷ���ģ�;�ȷ��Ϊ��%5.2f%%\n',(acc/test_num)*100);

%%

[train_images,position] = data_proc(train_images,train_labels);
for rows = 1:40
    test_images(:,position{1,rows})=[];
end

nb_model = fitcnb(train_images,train_labels);
result = predict(nb_model,test_images);
acc = 0.;
for i = 1:test_num
    if result(i)==test_labels(i)
        acc = acc+1;
    end
end
fprintf('���ر�Ҷ˹ģ�;�ȷ��Ϊ��%5.2f%%\n',(acc/test_num)*100);
