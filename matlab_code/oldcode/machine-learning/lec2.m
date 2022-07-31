%%
u=[1,2];
for c=-10:0.5:10
    v=c*u;
    quiver(0,0,v(1),v(2),1);
    hold on;
    pause(0.1);
    axis([-20,20,-20,20]);
    axis square;
end

%%
u=[1,0]';
P=[cos(pi/6),sin(pi/6);-sin(pi/6),cos(pi/6)];
for i=1:12
    u=P*u;
    quiver(0,0,u(1),u(2),1);
    hold on;
    axis([-1.5,1.5,-1.5,1.5]);
    pause(0.2);
end
hold on;
alpha=-pi:0.001:pi;
w1=cos(alpha);w2=sin(alpha);
plot(w1,w2);



