W=[20,40,60,80,100];
F=[4.35,7.55,10.40,13.80,16.80];
n=numel(W);
X=[ones(n,1),W',(W.^2)'];
y=F';
theta=(X'*X)\(X'*y);
scatter(W,F);
hold on;plot(W, X*theta,'LineWidth',2);

% x=[0,1,2,3,5];
% y=[1.1,1.9,3.1,3.9,4.9];
% n=numel(x);
% X=[ones(n,1),x',(x.^2)'];
% y=y';
% theta=(X'*X)\(X'*y);
% scatter(x,y);
% hold on;plot(x, X*theta,'LineWidth',2);