%幂函数，指数，阶乘
N=6;
n=1:N;
x1=n.^2;x2=2.^n;x3=[];
for i=1:N
    x3(i)=factorial(i);
end
plot(n,x1,'r');
hold on;plot(n,x2,'k');
hold on;plot(n,x3,'b');
legend('幂','指数','阶乘');