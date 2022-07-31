%这是人工数据集
x = -5:0.5:5; x = x';
n = numel(x);
y = 2*x + 3 * randn(n, 1);
% 这是一组人工数据集， y=2x 但其中含有噪声
scatter(x, y);
% 以线性回归为例学习 梯度下降法
X = [ones(n, 1), x];
theta = randn(2, 1);
maxiter = 100;
alpha = 0.001;
for i = 1:maxiter
    % 梯度下降法 
    theta = theta - alpha * X' * (X*theta - y)/n;
end
hold on;
plot(x, X*theta); % 接近y = 2x