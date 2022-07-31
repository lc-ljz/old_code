function b=newton(x,f)
b(1)=f(1);
n=numel(f)-1;
for k=2:n+1
    num=f(k)-polynomial(b,x(1:k));
    den=1;
    for j=1:k-1
        den=den*(x(k)-x(j));
    end
    b(k)=num/den;
end