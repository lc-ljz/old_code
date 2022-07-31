w = [-1, 2]';
v = [4, 2]';
u = w + v;
U=[v,u];
quiver(0,0,w(1),w(2),1);
hold on; quiver(0,0,v(1),v(2),1);
hold on;plot(U(1,:),U(2,:),'--');
U2=[w,u];
hold on;plot(U2(1,:),U(2,:),'--');
hold on;quiver(0,0,u(1),u(2),1);
%×ø±êÖá
axis([-1,4,0,5]);
axis equal;
axis square;