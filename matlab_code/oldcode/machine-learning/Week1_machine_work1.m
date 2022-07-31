%%
v=[4,1]';
w=[-2,2]';
u1=v+w;
u2=v-w;
U1=[v,u1];
U2=[w,u1];
quiver(0,0,v(1),v(2),1);
hold on;quiver(0,0,w(1),w(2),1);
hold on;quiver(0,0,u1(1),u1(2),1);
hold on;plot(U1(1,:),U1(2,:),'--');
hold on;plot(U2(1,:),U2(2,:),'--');

w=-w;
hold on;quiver(0,0,w(1),w(2),'--');
hold on;quiver(0,0,u2(1),u2(2),1);
U1=[v,u2];
U2=[w,u2];
hold on;plot(U1(1,:),U1(2,:),'--');
hold on;plot(U2(1,:),U2(2,:),'--');

axis([-2,6,-2,6]);
axis square;
%%
u1=[5,1]';
u2=[1,5]';
v=(u1+u2)/2;
w=(u1-u2)/2;
quiver(0,0,v(1),v(2),1);
hold on;quiver(0,0,w(1),w(2),1);
axis([0,6,-3,3]);axis square;
%%
v1=[1,1]';
v2=[4,2]';
v3=[1,3]';
w1=[v1,v2];
w2=[v3,v2];
w3=[v1,v3];
plot(w1(1,:),w1(2,:));
hold on;plot(w2(1,:),w2(2,:));
hold on;plot(w3(1,:),w3(2,:));
a1=v3-v1;
a2=v2-v1;
a=a1+a2;
V=[a1,a];V=V+[1,1]';hold on;plot(V(1,:),V(2,:),'--');
V=[a2,a];V=V+[1,1]';hold on;plot(V(1,:),V(2,:),'--');

a1=v1-v3;
a2=v2-v3;
a=a1+a2;
V=[a1,a];V=V+[1,3]';hold on;plot(V(1,:),V(2,:),'--');
V=[a2,a];V=V+[1,3]';hold on;plot(V(1,:),V(2,:),'--');


axis([-5,5,-5,5]);axis square;