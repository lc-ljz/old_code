%-u''=uµÄ¶¯Ì¬Í¼
h=animatedline;
v=[0;1]; 
delta=2*pi/128;
axis([-8,8,-8,8]);
n=2000;
for i=1:n
    addpoints(h,v(1),v(2));
    v=[1,delta;-delta,1]*v;
    %v = [1,-delta;delta,1]\v;%ÄÚÐý
    drawnow;
end
