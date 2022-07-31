%�����˹����ݼ�
x = -5:0.5:5; x = x';
n = numel(x);
y = 2*x + 3 * randn(n, 1);
% ����һ���˹����ݼ��� y=2x �����к�������
scatter(x, y);
% �����Իع�Ϊ��ѧϰ �ݶ��½���
X = [ones(n, 1), x];
theta = randn(2, 1);
maxiter = 100;
alpha = 0.001;
for i = 1:maxiter
    % �ݶ��½��� 
    theta = theta - alpha * X' * (X*theta - y)/n;
end
hold on;
plot(x, X*theta); % �ӽ�y = 2x