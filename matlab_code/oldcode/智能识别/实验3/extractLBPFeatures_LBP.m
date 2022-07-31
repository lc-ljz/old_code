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
%由于神经元输出为0和1，我们有十类，因此需要将转为十维行向量来表示
for i=1:train_num 
    label(train_labels(i)+1,i)=1;
end
t = label;

p = train_images;

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
fprintf('精确度为：%5.2f%%\n',(acc/test_num)*100);



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
fprintf('SVM精确度为：%5.2f%%\n',(acc/test_num)*100);

%%

knn_model = fitcknn(train_images,train_labels,'NumNeighbors',20);
result = predict(knn_model,test_images);
acc = 0.;
for i = 1:test_num
    if result(i)==test_labels(i)
        acc = acc+1;
    end
end
fprintf('K近邻分类模型精确度为：%5.2f%%\n',(acc/test_num)*100);

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
fprintf('朴素贝叶斯模型精确度为：%5.2f%%\n',(acc/test_num)*100);
