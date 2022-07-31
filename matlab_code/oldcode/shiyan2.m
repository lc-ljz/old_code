n=10;
A=hilb(n);
%eigshow(A);
delta=cond(A);%最大特征值/最小特征值
[U,S]=eig(A);
delta2=S(end,end)/S(1,1);