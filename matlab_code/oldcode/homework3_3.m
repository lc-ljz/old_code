h=animatedline;
v=[0;1]; 
%delta=2*pi/128;
%delta=pi/32;
delta=pi/20
axis([-8,8,-8,8]);
n=2000;

for i=1:n
    addpoints(h,v(1),v(2));
    v=[1,delta;-delta,1]*v;
    %v = [1,-delta;delta,1]\v;%ÄÚĞı
    drawnow;
end