%%
a = [1,-1];
b = [1,2,3,4,5,6];
c1 = conv(a,b);
%
%      1 2 3 4 5 6
%   -1 1
%      1
%      1 2 3 4 5 6
%     -1 1
%     -1+2 = 1
%

fprintf("c1 = %d ",c1);fprintf("\n");
d = eye(6) - diag(ones(1,5),-1);
c2 = d * b';
fprintf("c2 = %d ",c2);fprintf("\n");

%%
A = imread("moon.tif");
A = im2double(A);
[m,n] = size(A);
a = [-1, 2, -1];
B1 = conv2(A,a);
imshow(B1);

%d1 = -diag(ones(1,m)) - diag(ones(1,m-2),2) +2*diag(ones(1,m-1),1);
%d1 = d1(1:m-2,:);
d1 = 2*eye(m) - diag(ones(1,m-1),-1) - diag(ones(1,m-1),1);
B2 = d1 * A;
figure;imshow(B2);


