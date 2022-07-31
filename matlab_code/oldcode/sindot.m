function [a]=sindot(m,n)
x=linspace(-pi,pi);
y1=sin(m*x);
y2=sin(n*x);
a=dot(y1,y2);
end