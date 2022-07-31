file_name = '.\faces_for_pca\';
img_list = dir(strcat(file_name,'*.pgm'));
img_num = length(img_list);

data = zeros(img_num,112*92);
for i = 1:img_num
    img_name = img_list(i).name;
    img = imread(strcat(file_name,img_name));
    img = im2double(img);
    subplot(4,7,i);imshow(img);
    data(i,:) = reshape(img,1,size(img,1)*size(img,2));
end

%%
u = mean(data);
ave_img = reshape(u,112,92);
ave_img = im2double(ave_img);
imshow(ave_img);
%%
[coeff,score,latent] = pca(data);
XX = coeff*score';
n = size(XX,2);
for i = 1:n
    eigenface = XX(:,i);
    eigenface = reshape(eigenface,112,92);
    eigenface = im2double(eigenface);
    subplot(4,7,i);imshow(eigenface);
end
