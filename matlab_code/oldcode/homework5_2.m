n=101;
x=linspace(-3,3,n);
delta=(3+3)/(n-1);
y=x.^3;
d1=eye(n-1);
d2=ones(1,n-2);
d2=diag(d2,-1);
d=d1-d2;
left=[-1,zeros(1,n-2)];
d=[left',d];
dy=d*y'/delta;
plot(x(1:end-1),dy);
hold on;plot(x,3*x.^2);