n=10;
a=[2,-1,zeros(1,n-2)];
k=toeplitz(a);
k(1,1)=1;
b=ones(n,1);
x=k\b;
[l.u]=lu(k);
plot(x);