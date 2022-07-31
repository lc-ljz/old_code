%Çó¸ùºÅ(a^2+b^2)=p

N=10;%N=3
a=-2.2;%e200
b=3.4;

a=abs(a);
b=abs(b);
p=max(a,b);
q=min(a,b);
for i =1:N
    r=(q/p)^2;
    s=r/(4+r);
    p=p+2*s*p;
    q=s*q;
end
q
p