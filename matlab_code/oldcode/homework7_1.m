%对图片进行微分和积分处理
A=imread('trees.tif');
A=im2double(A);
subplot(3,3,1);imshow(A);
[m,n]=size(A);
% d1=ones(m,1);d2=ones(m-1,1);
% p=diag(d1)-diag(d2,-1);
% B=p*A;
% subplot(3,3,2);imagesc(p(1:4,1:4));
% subplot(3,3,3);imshow(B);
% 
% p2=ones(m);p2=triu(p2);%p2为上三角矩阵
% p2=p2';%转置
% C=p2*B;
% subplot(3,3,4);imagesc(p2(1:4,1:4));
% subplot(3,3,5);imshow(C);

%梯形公式
d1=ones(m-1,1);d2=ones(m-2,1);
p3=diag(d1)+diag(d2,-1);
p3=[[1;zeros(m-2,1)],p3];
D=p3*A;
subplot(3,3,6);imagesc(p3(1:4,1:4));
subplot(3,3,7);imshow(D);

