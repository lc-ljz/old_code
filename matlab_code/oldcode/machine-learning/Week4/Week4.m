% x = -5:0.1:5;
% x = x';
% n = numel(x);
% w1 = randn(n,1);w2 = randn(n,1);
% b1 = randn(n,1);b2 = randn(n,1);
% g = tanh(w1'*x+b1);
% h = sigmoid(w2'*g + b2);

data = load('BP_data.txt');
X = data(:,[1,2]);y = data(:,3);
%s = 1;
s = 0;
if s == 1
    scatter(X(y == 1,1),X(y == 1,2),'*');
    hold on;scatter(X(y == 0,1),X(y == 0,2),'+');
end

rng(1);   % 固定种子， 保证每次产生的随机数一样
X = X';y = y';
[m,n] = size(X);
numhid = 4;% 隐藏层设置四个神经元， 使用tanh
W1 = randn(numhid,m);
b1 = ones(1,numhid)*0.01;b1 = b1';
num_output = 1;
W2 = randn(num_output,numhid);
b2 = ones(1, num_output)*0.01;b2 = b2';
z1 = W1*X+b1;
g = sigmoid(z1);
%g = tanh(z1);  

z2 = W2*g+b2;
h = sigmoid(z2);
load Solution.mat;
% dz2 = h.*(1-h);
% dW2 = dz2 * g';
% db2 = dz2 *ones(n,1);
% dz1 = (W2' * dz2).*g.*(1 - g);
% %dz1 = (W2' * dz2).*(1-g.^2);
% dW1 = dz1 * X';
% db1 = dz1 * ones(n,1);
dz2 = (h-y)/n;
dW2 = dz2 * g';
db2 = dz2 * ones(n, 1);
dz1 = (W2' * dz2) .* (g.*(1-g));
dW1 = dz1 * X';
db1 = dz1 * ones(n, 1);






