%����
y=0.5;
c=1.8343429324;
for i=1:7
    y=y*(2-c*y);
end
y
1/c
%����
c=3.424232;
x=0.5;
for i=1:7
    x=0.5*(x+c/x);
end
sqrt(c)
x

y=2;
for i=1:10
    y=2+1/y;
end
fprintf('����2Ϊ%f\n',y-1);
%����
