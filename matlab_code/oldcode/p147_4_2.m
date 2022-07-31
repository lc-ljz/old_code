clear;close all;clc;
n=4;
d=4*ones(1,n);d1=ones(1,n-1);
d=diag(d);d1=diag(d1,1);
A=-d+d1+d1';
L=eye(n);
for k=1:n
    L(k+1:end,k)=A(k+1:end,k)/A(k,k);
    for j =k+1:n
        A(j,k:n) = A(j,k:n)-L(j,k)*A(k,k:n);
    end
end
U=A;
A2=L*U