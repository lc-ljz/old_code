x=linspace(-1,1,101);
p0=ones(1,101);
p1=x;
p2=(3/2)*x.^2-1/2;
p3=(5/2)*x.^3-x/2;
plot(x,p0);
hold on;plot(x,p1);
hold on;plot(x,p2);
hold on;plot(x,p3);

m=2;n=3;
a0=f0(m,n)
a1=f1(m,n)
a2=f2(m,n)
a3=f3(m,n)