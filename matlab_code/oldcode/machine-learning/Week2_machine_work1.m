%%
%1
u=[-6,8]';v=[4,3]';w=[1,2]';
fprintf("u'*v = %f\n",u'*v);
fprintf("u'*w = %f\n",u'*w);
fprintf("u'*(v+w) = %f\n",u'*(v+w));
fprintf("w'*v = %f\n",w'*v);
%%
%4
v = randn(2, 1);w = randn(2, 1);
fprintf("v'*(-v) = %f\n",v'*(-v));
fprintf("(v+w)'*(v-w)) = %f\n",(v+w)'*(v-w));
fprintf("(v-2*w)'*(v+2*w) = %f\n",(v-2*w)'*(v+2*w));
%%
%5
v=[1,3]';w=[2,1,2]';
u1=v/(sqrt(v'*v));
u2=w/(sqrt(w'*w));
u1
u2

v1=[3,-1]';w1=[1,0,-1]';
U1=v1/(sqrt(v1'*v1));
U2=w1/(sqrt(w1'*w1));
U1
U2
% a=(0-v(1)*0.01)/v(2);
% U1=[0.01,a]';
% U1=U1/(sqrt(U1'*U1));
% U1
% b=(0-u2(1)*0.01-u2(2)*0.01)/u2(3);
% U2=[0.01,0.01,b]';
% U2=U2/(sqrt(U2'*U2));
% U2
%%
A=imread("c.tif");
B=A(:);

%%
%画 y = x^2 + 2x + 1,x 设在区间 [-2, 2]之间
x=-2:0.1:2;
x=x';
X=[x.^2,x.^1,x.^0]';
A=[1,2,1]';
Y=A'*X;
plot(x,Y);










