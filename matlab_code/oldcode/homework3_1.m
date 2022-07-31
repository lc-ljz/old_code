%Ë«µãÏÒ·¨
f=@(x)2*x+1-exp(x);
x=linspace(-0.8,2.5,101);
plot(x,f(x));
hold on;plot(x,zeros(1,101));
a=0.5;b=2;

for i=1:10
    hold on;plot([a,b],[f(a),f(b)]);pause(1);
    
    x=a-(b-a)*f(a)/(f(b)-f(a));
    
    hold on;plot([x,x],[0,f(x)]);pause(1);
    
    if(abs(f(x))<1e-8)
        break;
    end
    
    if(f(x)>0)
        a=x;
    else
        b=x;
    end
    
end