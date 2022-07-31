function a1=f1(m,n)
% x=linspace(1,1);
% y1=m*x;
% y2=n*x;
% a1=dot(y1,y2);
x=-1:1;
y1=m*x;
y2=n*x;
a1=trapz(y1,y2);
end