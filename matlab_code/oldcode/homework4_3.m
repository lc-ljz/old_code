x=[-pi/2,pi,5*pi/2];
y=[-1,0,1];
scatter(x,y,'*');
x1=linspace(-pi/2,5*pi/2);
hold on;plot(x1,sin(x1));
b=newton(x,y);

x=linspace(-pi/2,5*pi/2);
y=b(1)+b(2).*(x+(pi/2))+b(3).*(x+pi/2).*(x-pi);
hold on;plot(x,y);
