%¶þ·Ö·¨
f=@(x)2*x+1-exp(x);
x=linspace(-0.8,2.5,101);
plot(x,f(x));
hold on;plot(x,zeros(1,101));
a=x(1);b=x(end);
c=(a+b)/2;
while(abs(f(c))>1e-4)
    if(f(c)>0)
        a=c;
    else
        b=c;
    end
    hold on;scatter(c,f(c),'*','LineWidth',5);pause(1);   
    c=(a+b)/2;
end