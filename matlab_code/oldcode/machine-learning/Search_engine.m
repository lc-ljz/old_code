% PageRank 是谷歌公司发家的三大利器之一。 网页排名
% 以下的矩阵的A看成： 一名用户，输入关键字， 得到网页
% 参数: 一个网站的被访问量（in),  出访量(out). 
% 科学的排名要考虑两者
%%
A = [0 .1 .2 .7; 
    .05 0 .15 .8; 
    .15 .25 0 .6;
    .1 .3 .6 0]';
% 每列相加等于1
%%
% m = 10;
% A = rand(m);
% A = A./(ones(m,1)*sum(A));
% 算法 random walk
n = 100; x = zeros(1, n);
x(1) = 1;
m = 4;
for k = 2:n
    x(k) = min(find(rand<cumsum(A(:, x(k-1)))));
end
% cumsum: [3, 4, 2]: -> 3, 7, 9  累积分布, 相当于求了积分
p = hist(x, 1:m)/n;
p = p/norm(p);
[u,s] = eig(A);
p = [p; u(:,1)'];
% homework:  
% 1 产生一个较大的马尔可夫矩阵，同时对角线元素为0
% 2  m = 100; A = rand(m); a = diag(A); A = A - diag(a);
% 3  变成马尔可夫矩阵，
% 4  用random walk 计算出 p
% 5  验证 x = [1, zeros(1, m-1)]';  x = A*(A*(A*(A*x)))) %得到出的特征向量
% 6  [u, s] = eig(A);  u(:, 1); 
% 验证三者近似相等 p = p/norm， 当心单位化的问题


%%
m = 300;
A = rand(m);a = diag(A);
A = A - diag(a);
s = sum(A);
A = A./(ones(m,1)*s);
n = 10000; x = zeros(1, n);
x(1) = 1;

for k = 2:n
    x(k) = min(find(rand<cumsum(A(:, x(k-1)))));
end
p = hist(x, 1:m)/n;
p = p/norm(p);

[u,s] = eig(A);
p = [p; u(:,1)'];

x2 = [1, zeros(1, m-1)]';
for i = 1:10000
    x2 = A * x2;
end
xx = x2/norm(x2);

result = [p; xx'];
plot(result')














