function a2=f2(m,n)
% x=linspace(-1,1);
% y1=(3/2)*(m*x).^2-1/2;
% y2=(3/2)*(n*x).^2-1/2;
% a2=dot(y1,y2);
x=-1:1;
y1=(3/2)*(m*x).^2-1/2;
y2=(3/2)*(n*x).^2-1/2;
%y=y1.*y2;
a2=trapz(y1,y2);
end