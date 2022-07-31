img = imread('cherry.jpg');
%img = imread('dog.jpg');
img = im2double(img);
m = size(img,1);
n = size(img,2);
a = reshape(img,m*n,3);
[result,cla] = kmeans(a,4);

[temp,im1] = find(result == 1);
a(temp,:) = 0.2;
[temp,im2] = find(result == 2);
a(temp,:) = 0.5;
[temp,im3] = find(result == 3);
a(temp,:) = 0.7;
[temp,im4] = find(result == 4);
a(temp,:) = 0.9;
a = reshape(a,m,n,3);
imshow(img);
figure,imshow(a);

