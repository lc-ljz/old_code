function a0=f0(m,n)
x=-1:1;
y1=(m*x).^0;
y2=(n*x).^0;

a0=trapz(y1,y2);
end