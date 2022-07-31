A=imread("trees.tif");
A=im2double(A);
[m,n]=size(A);
d1=ones(1,m)*2;
d2=ones(1,m-1)*(-1);
d1=diag(d1);
d2=diag(d2,1);
k=d1+d2+d2';
d2A=k*A;
d2A_2=0;
for i =1:m
    d2A_2=d2A_2+k(:,i)*A(i,:);
end
subplot(2,2,1);imagesc(A);
subplot(2,2,2);imagesc(d2A);
subplot(2,2,3);imagesc(d2A_2);
