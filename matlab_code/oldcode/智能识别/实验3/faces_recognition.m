filedir = '.\orl_faces_original\';
train_images = zeros(40*7,92*112);
train_labels = zeros(40*7,1);
test_images = zeros(40*3,92*112);
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
        img = im2double(img);
        img = reshape(img,1,92*112);
        train_images(t,:) = img;
        train_labels(t) = i;
        t = t + 1;
    end
    for j = 8:10
        file2 = ['\',num2str(j), '.pgm'];
        filename2 = strcat(filename,file2);
        img = imread(filename2);
        img = im2double(img);
        img = reshape(img,1,92*112);
        test_images(p,:) = img;
        test_labels(p) = i;
        p = p + 1;
    end
end

%%

t = templateSVM('KernelFunction','linear');
svm_model = fitcecoc(train_images,train_labels,'Learners',t);
result = predict(svm_model,test_images);

acc = 0.;
for i = 1:120
    if result(i)==test_labels(i)
        acc = acc+1;
    end
end
fprintf('SVM精确度为：%5.2f%%\n',(acc/120)*100);

%%

test_num = 120;
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
knn_model = fitcnb(train_images,train_labels);
result = predict(knn_model,test_images);
acc = 0.;
for i = 1:test_num
    if result(i)==test_labels(i)
        acc = acc+1;
    end
end
fprintf('朴素贝叶斯模型精确度为：%5.2f%%\n',(acc/test_num)*100);

