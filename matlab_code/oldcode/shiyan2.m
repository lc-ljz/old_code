n=10;
A=hilb(n);
%eigshow(A);
delta=cond(A);%�������ֵ/��С����ֵ
[U,S]=eig(A);
delta2=S(end,end)/S(1,1);