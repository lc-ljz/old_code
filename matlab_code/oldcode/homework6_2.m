n=2;
A=[0.0001,1.0000;1.0000,1.0000];
b=[1.0000;2.0000];
A=[A,b];
for i=1:n
    if A(i,i)==0,break;end
    temp=A(:,i);temp=temp(i+1:end);
    temp=temp/A(i,i);
    A(i+1:end,i:end)=A(i+1:end,i:end)-temp*A(i,i:end);
end
x=zeros(n,1);
for j=n:-1:1
    tempa=A(j,:);
    b=tempa(n+1);
    a=tempa(j+1:n);
    xx=x(j+1:end);
    x(j)=b-a*xx;
    x(j)=x(j)/tempa(j);
end
x