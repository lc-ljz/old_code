%%
%h1: y = x*sin(1/x)
x = [-1:0.01:0.01,0.01:0.01:1];
y = x.*sin(1./x);
plot(x,y);
hold on;
t = -0.4:0.01:0.9;
plot(t,t,'--');
hold on;
plot(-t,t,'--');

set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');
axis equal;

%%
%h2: ţ�������� y = x^2 + 1/x
x = -1:0.01:1;
y = x.^2 + 1./x;
plot(x,y);

set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');


%%
%h3:ţ�������� y = 2x / ( 1+x^2)
x = -5:0.01:5;
y = 2*x./(1+x.^2);
plot(x,y);
set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');

%%
%h4: ��Ҷ�� y = (����) x * sqrt(x / (10 - x))
x = 0:0.01:10;
y = x.*sqrt(x.\(10-x));
plot(x,y);
hold on;
plot(x,-y);
set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');


%%
%h5: y = sin(1/x)
x = -pi:0.01:pi;
%x = -1.5:0.01:1.5;
y = sin(1./x);
plot(x,y);

set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');
%%
%h6: y = x * (2 + sin(1/x)) ����: y <=x 
x = -pi:0.01:pi;
y = x .* (2 + sin(1./x));
plot(x,y);
hold on;
plot(x,x*2+1);

set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');

%%
%h7: y = ������) sqrt(1-x^2) sin(pi/x)
x = -1:0.01:1;
y = sqrt(1-x.^2) .* sin(pi\x);
plot(x,y);
hold on;
plot(x,-y);
line([1,1],[-1,1]);
line([-1,-1],[-1,1]);

set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');
%%
%h8: y = sin(x)/x
x = -20:0.01:20;
y = sin(x)./x;
plot(x,y);

set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');
%%
% h9: y = (����)2^(-x)sqrt(sin(pi*x))
x = [0:0.01:1,2:0.01:3,4:0.01:5];
y = 2.^(-x).*sqrt(sin(pi*x));
plot(x,y);
hold on;
plot(x,-y);

set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');
%%
% h10: y = arcsin(x) ������Ϊ x=-1, x=1
x = -0.99:0.001:0.99;
y = asin(x);
plot(x,y);
hold on;
line([1,1],[-5,5]);
line([-1,-1],[-5,5]);

set(gca, 'XAxisLocation', 'origin');
set(gca, 'YAxisLocation', 'origin');






