function p=polynomial(b,x)
p=b(end);
for k=numel(b):-1:2
    p=(x(end)-x(k-1))*p+b(k-1);
end
end
