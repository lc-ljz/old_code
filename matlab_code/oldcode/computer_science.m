t=-3:0.1:3;
r=ones(1,numel(t));
x=r'*t;
y=t'*r;
%[x,y]=meshgrid(t)
%line5=line3+4
z=x.^2+y.^2;
surf(z);
