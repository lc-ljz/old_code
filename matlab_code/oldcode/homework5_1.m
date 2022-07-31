a=imread('a.jpg');
figure,imshow(a);
a=im2double(a);
[m,n,k]=size(a);
p1=eye(n)*2;
p2=diag(ones(1,n-1),-1);
p=p1-p2-p2';
for i=1:k
    a(:,:,i)=a(:,:,i)*p;
end
figure,imshow(a);

p3=eye(m)*2;
p4=diag(ones(1,m-1),-1);
p=p3-p4-p4';
for i=1:k
    a(:,:,i)=p*a(:,:,i);
end
figure,imshow(a);