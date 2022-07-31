% PageRank �ǹȸ蹫˾���ҵ���������֮һ�� ��ҳ����
% ���µľ����A���ɣ� һ���û�������ؼ��֣� �õ���ҳ
% ����: һ����վ�ı���������in),  ������(out). 
% ��ѧ������Ҫ��������
%%
A = [0 .1 .2 .7; 
    .05 0 .15 .8; 
    .15 .25 0 .6;
    .1 .3 .6 0]';
% ÿ����ӵ���1
%%
% m = 10;
% A = rand(m);
% A = A./(ones(m,1)*sum(A));
% �㷨 random walk
n = 100; x = zeros(1, n);
x(1) = 1;
m = 4;
for k = 2:n
    x(k) = min(find(rand<cumsum(A(:, x(k-1)))));
end
% cumsum: [3, 4, 2]: -> 3, 7, 9  �ۻ��ֲ�, �൱�����˻���
p = hist(x, 1:m)/n;
p = p/norm(p);
[u,s] = eig(A);
p = [p; u(:,1)'];
% homework:  
% 1 ����һ���ϴ������ɷ����ͬʱ�Խ���Ԫ��Ϊ0
% 2  m = 100; A = rand(m); a = diag(A); A = A - diag(a);
% 3  �������ɷ����
% 4  ��random walk ����� p
% 5  ��֤ x = [1, zeros(1, m-1)]';  x = A*(A*(A*(A*x)))) %�õ�������������
% 6  [u, s] = eig(A);  u(:, 1); 
% ��֤���߽������ p = p/norm�� ���ĵ�λ��������


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














