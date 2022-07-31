%数值运算
a=1;
%数组
u=1:3;
v=2:2:6;
% u+v
% u-v
% u.*v
% u./v
%向量内积inner product
n=4;
x=1:n;y=ones(1,n);
s1=x*y';
s2=y*x';
fprintf("");
s5=sum(x.*y);
s6=sum(y.*x);
s7=0;
for i =1:numel(x)
    s7=s7+x(i)*y(i);
end



