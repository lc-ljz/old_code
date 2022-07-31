%%
u = [1, 0]';
U = [];
P = [cos(pi/6), sin(pi/6); -sin(pi/6), cos(pi/6)];
for i = 1:12
    u = P*u;
    U = [U,u];
%     quiver(0, 0, u(1), u(2)+1, 1);
%     hold on; 
%     axis([-1.5, 1.5, -0.5, 2.5]);
end
final_U = U + [0, 1]'; 
alpha = -pi:0.001:pi;
w1 = cos(alpha); w2 = sin(alpha);
hold on;
plot(w1, w2+1);
axis([-1.5, 1.5, -0.5, 2.5]);
grid on;
%%
u = [1, 0]';
U = [];
P = [cos(pi/6), sin(pi/6); -sin(pi/6), cos(pi/6)];
for i = 1:12
    u = P*u;
    U = [U,u];
end
U=U-[cos(pi/6), sin(pi/6)]';
%%
u=[0,1]';
P = [cos(pi/6), sin(pi/6);-sin(pi/6), cos(pi/6)];
u=P*u;
u

