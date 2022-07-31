f=@(x)sin(x)-x.^2/4;
n=101;
x=linspace(1.5,2,n);
plot(x,f(x));
hold on;plot(x,zeros(1,n));%y=0;

a=x(1);b=x(end);
%f(a)>0 f(b)<0
c=(a+b)/2;
while(abs(f(c))>1e-4)
    if(f(c)>0),a=c;
    else
        b=c;
    end
    hold on;scatter(c,f(c),'*','LineWidth',5);
    pause(1);%‘›Õ£1√Î
    c=(a+b)/2;
end
