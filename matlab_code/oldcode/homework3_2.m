%2x+1=e^x«–œﬂ∑®
f=@(x)2*x+1-exp(x);
df=@(x)2-exp(x);
x=linspace(-0.8,2.6,1001);
plot(x,f(x));
hold on;plot(x,zeros(1,1001));

x=0.8;
for i=1:30
    t=x-f(x)/df(x);
    
    hold on;plot([x,t],[f(x),0]);pause(1)
    
    x=t;
    
    hold on;plot([x,x],[f(x),0],'--');pause(1);
end


