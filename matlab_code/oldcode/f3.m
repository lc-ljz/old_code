function a3=f3(m,n)
% x=linspace(-1,1);
% y1=(5/2)*(m*x).^3-x/2;
% y2=(5/2)*(n*x).^3-x/2;
% a3=dot(y1,y2);

x=-1:1;
y1=(5/2)*(m*x).^3-x/2;
y2=(5/2)*(n*x).^3-x/2;
a3=trapz(y1,y2);

end