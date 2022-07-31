%%
%section_2
%homework:����һ�� 4x3���������
A = randi([0,25],4,3);
img = digit(A);
imshow(img);

%%
%section_3
% homework:��ȡA�ĵ�4��: ���Ĵ����8��
m =4;n = 6;
A = reshape(1:m*n,m,n);
P1 = zeros(1,m);
P1(1,4) = 1;
P2 = eye(n);
resultshow(A,P1,P2);
%%
%section_3_2
% homework: ��ȡA �ĵ�����
m = 3; n = 6;
A = reshape(1:m*n, m, n);
P1 = eye(m);
P2 = zeros(n, 1);
P2(3) = 1;
resultshow(A, P1, P2);

%%
%Section4
n = 5;
A = reshape(1:n^2, n, n);
% ��ȡA �ĵ�2��3��
% A(2:3, :)
P1 = zeros(2, 5);
P1(1, 4) = 1;
P1(2, 2) = 1;
P2 = eye(n);
resultshow(A, P1, P2);
% homework: ��ȡA �ĵ�4�͵�2�У���˳��A([4,2],:)
% ���Ĵ����6��7��

%%
%Section4.2
% ������section_4����ֻ�����һ��
A = reshape(1:25, 5, 5);
% ��ȡA �ĵ�2��3��
% A(:, 2:3)
P1 = eye(5);
P2 = zeros(5, 2);% ��λ��������ʡ�ԣ�����Ϊ�˲���һ��
P2(2, 1) = 1;
P2(3, 2) = 1;
resultshow(A, P1, P2);

%%
%Section5
A = reshape(1:4, 2, 2);
% What is A(:)
B = A(:);
figure, subplot(1, 2, 1); imshow(digit(A));
subplot(1, 2, 2); imshow(digit(B));

%%
%Section6
% ��ȡA�ĵ�(i,j)��Ԫ��
% A(i,j)
m = 3; n = 6;
A = randi([0, 25], m, n);
% ��ȡA(3, 4);
P1 = zeros(1, m);
P2 = zeros(n, 1);
P1(3) = 1;
P2(2) = 1;
resultshow(A, P1, P2);

% homework: A(3, 2):  code: line 8and9


%%
%Section7
% LU�ֽ⣬ ����E�� ����L, ����U
% LU�ֽ�Ĺ������˹��Ԫ�Ĺ�����ȫ�ȼ�
% ҧ�Ľ��֣� �ȼ۲���һ����Ҳ���������ϼ��㷽����ʱǿ����
% ˼�벻ͬ�� LU�ֽ�ͨ�����ֽ⣬ ��˹��Ԫ�����Ƿ���
% ������ʸ�˹��Ԫ����LU�����кβ�ͬʱ�� ��Ҫ����Ϊ����ѧϰ
% ��˹��Ԫ�����ڳ��н��Ԫ������Ԫһ�η�����ʱ��û�н�ϵ��
% ��ȡ��������ʶ�� 
% �������Ľ�ѧ���ڽ����ͬʱ���ͻ����ά���
% �����������Դ������ｲ�ȼ���ȫû���⡣
% ������������������E, L, U�Ĺ�ϵ
n = 5;
A = zeros(5);
for i = 1:n-1
    A = A + diag(1:i, (n-i));
end
A = A + A' + diag(1:n);
imshow(digit(A));
E = eye(n); E(2:n, 1) = -1;
P2 = eye(n); % resultshow�����в����ƣ�P2��Ϊ�����ݲ���ȱʡ
U = E*A; % ͼƬ������ͼ�����U,ͼƬ�������ݲ��ܸ�
% E��ӦP�� U ��Ӧ��PA
resultshow(A, E, P2)
% -1*row1+row2; -1*row1+row3, ..., -1*row1+row5
L = eye(n); L(2:n, 1) = -E(2:n, 1);
A2 = L*U;  % A2 == A, ͼƬ�п���չʾ
figure; resultshow(U, L, P2);
% ע������֮��������ͼƬ�� ͼ1��ͼ2�ڵ�������Ҫ�����
% ��ͼƬ2�ϵ�һ��

%%
%Section7.2
% 7.2ǰ����հ���section_7����ȥͼƬ��ʾ
% ------------���˵�section_7 ------------------- %
n = 5;
A = zeros(5);
for i = 1:n-1
    A = A + diag(1:i, (n-i));
end
A = A + A' + diag(1:n);
imshow(digit(A));
E1 = eye(n); E1(2:n, 1) = -1;
U1 = E1 * A;
L1 = eye(n); L1(2:n, 1) = -E1(2:n, 1);

% --------------------------------------------- %
% Part 2:
E2 = eye(n); E2(3:n, 2) = -1;
L2 = eye(n); L2(3:n, 2) = -E2(3:n, 2);
P2 = eye(n);
U2 = E2 * U1;
figure; resultshow(A, E1, P2);
figure, resultshow(U1,E2, P2);
% -------------------------------------- %
% homework: �õ����յľ���U
% ������ʾ��ԭ���̼�L*U�Ĺ���

%%
%Section8
% ������������ 
A = [1, 2;3 4];
B = [1, 2; 1, 1];
a1 = A(:,1); b1 = B(1, :);
a2 = A(:,2); b2 = B(2, :);
% A * B = a1 * b1 + a2 * b2
% ʵ�ֵĹ����� a1 * eye(2) * b1 + a2 * eye(2) * b2
% ��Ϊ�м���и�ȱʡ�ľ���
figure, resultshow(a1, eye(2), b1);
figure, resultshow(a2, eye(2), b2);
P1 = a1*b1; P2 = a2*b2; 
figure, subplot(1,3,1); imshow(digit(P1));
subplot(1,3,2); imshow(digit(P2));
subplot(1,3,3); imshow(digit(A*B));
% homework: a = ones(5, 1); b = (1:5)';����������
% ��ͼ: dot(a, b),  a *b' (���)

%%
%Section
x = -5:0.1:5;
y = tanh(x); % belong to (-1, 1)
plot(x, y); 
y2 = 1./(1 + exp(-x));  % y belong to (0, 1)
hold on;
plot(x, y2); legend('tanh','sigmoid');
axis([-5, 5, -1.5, 3]);
y3 = max(0, x);
figure, plot(x, y3, '*'); axis([-5, 5, -.5, 6]);











