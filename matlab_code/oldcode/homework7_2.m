%辛卜生公式
m=101;
x=linspace(-2,2,m);
y=x.^5+15*x;

d1=eye(m);%m*m单位矩阵
d1=0.5*d1;
d2=ones(m-1,1);
d2=diag(d2,-1);
p=d1+d2+d2';
p=p/6;

a=p*y';
plot(x,y);
hold on,plot(x,a);