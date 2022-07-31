f=@(x)(x-1).*(x-2).*(x-3).*(x-5).*(x-7);
x=linspace(0.5,5.5,101);
close all;plot(x,f(x));
hold on; plot(x,zeros(1,101));
a=0.8;b=1.5;%f(a)<0  f(b)>0

for i= 1:10
    hold on;plot([a,b],[f(a),f(b)]);
    x=a-(b-a)*f(a)/(f(b)-f(a));
    
    hold on;plot([x,x],[0,f(x)],'--');pause(1);
    
    if(abs(f(x))<1e-8),break;end
    if f(x)<0,a=x;
    else,b=x;
    end
end
