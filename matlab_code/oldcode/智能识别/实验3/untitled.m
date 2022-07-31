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

rng(1);
test_num = 120;
acc = 0;
mod = fitctree(train_images,train_labels);
result = predict(mod,test_images);
% 预测部分
for i = 1:test_num
    if result(i)==test_labels(i,1)
        acc = acc+1;
    end
end
fprintf('多分类的二叉分类决策树精确度为：%5.2f%%\n',(acc/test_num)*100);
%%

rng(1);
test_num = 120;
t = templateTree('MaxNumSplits',20);
mod = fitcensemble(train_images,train_labels,'Method','AdaBoostM2','Learners',t);
result = predict(mod,test_images);
acc = 0.;
for i = 1:test_num
    if result(i)==test_labels(i)
        acc = acc+1;
    end
end
fprintf('Adaboost集成分类器精确度为：%5.2f%%\n',(acc/test_num)*100);

%%
rng(1);
test_num = 120;
acc = 0.;
mod = TreeBagger(100,train_images,train_labels);
result = predict(mod,test_images);
% 预测部分
for i = 1:test_num
    if str2double(result{i,1})==test_labels(i,1)
        acc = acc+1;
    end
end
fprintf('100棵决策树的随机森林模型精确度为：%5.2f%%\n',(acc/test_num)*100);