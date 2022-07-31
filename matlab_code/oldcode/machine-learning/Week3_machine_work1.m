%% 
X = 100:100:500;
%X = 1000:1000: 8000;
n = numel(X);
theta = randn(n,1);
y=ones(1);

for i = 1:13
    tic
    y1 = X'*(X*theta-y);
    toc
    
    tic
    y2=(X'*X)*theta-(X'*y);
    toc
end
plot(X,y1);
%%
m = 5;
t = zeros(2, m); % 记录时间
for i = 1:m
    n = i * 1000;
    X = randn(n, n);
    theta = randn(n, 1);
    y = ones(n, 1);
    tstart = tic;
    grad = X' * (X * theta - y); % 第一种方法
    tend = toc(tstart);
    t(1,i) = tend;
    tstart = tic;
    grad2 = (X'*X) * theta - X' * y;% 第二种方法
    tend = toc(tstart);
    t(2, i) = tend;
end

plot(t'); % plot(x, y): x可以缺省，默认是下标

%比如这里t是一列是8个，x默认是1-8