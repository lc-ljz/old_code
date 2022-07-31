%%
%section_2
%homework:生成一个 4x3的随机矩阵
A = randi([0,25],4,3);
img = digit(A);
imshow(img);

%%
%section_3
% homework:提取A的第4行: 更改代码第8行
m =4;n = 6;
A = reshape(1:m*n,m,n);
P1 = zeros(1,m);
P1(1,4) = 1;
P2 = eye(n);
resultshow(A,P1,P2);
%%
%section_3_2
% homework: 提取A 的第三列
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
% 提取A 的第2，3行
% A(2:3, :)
P1 = zeros(2, 5);
P1(1, 4) = 1;
P1(2, 2) = 1;
P2 = eye(n);
resultshow(A, P1, P2);
% homework: 提取A 的第4和第2行，按顺序A([4,2],:)
% 更改代码第6和7行

%%
%Section4.2
% 代码与section_4区别只在最后一行
A = reshape(1:25, 5, 5);
% 提取A 的第2，3列
% A(:, 2:3)
P1 = eye(5);
P2 = zeros(5, 2);% 单位阵计算可以省略，这里为了参数一致
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
% 提取A的第(i,j)个元素
% A(i,j)
m = 3; n = 6;
A = randi([0, 25], m, n);
% 提取A(3, 4);
P1 = zeros(1, m);
P2 = zeros(n, 1);
P1(3) = 1;
P2(2) = 1;
resultshow(A, P1, P2);

% homework: A(3, 2):  code: line 8and9


%%
%Section7
% LU分解， 矩阵E， 矩阵L, 矩阵U
% LU分解的过程与高斯消元的过程完全等价
% 咬文嚼字： 等价不是一样，也正如我在上计算方法课时强调的
% 思想不同： LU分解通向矩阵分解， 高斯消元仅仅是方法
% 如果你问高斯消元法与LU究竟有何不同时， 主要是因为我们学习
% 高斯消元法是在初中解二元或者三元一次方程组时。没有将系数
% 提取出来的意识。 
% 但西方的教学是在讲解的同时，就会向高维演绎。
% 所以西方线性代数书里讲等价完全没问题。
% 我们用特殊矩阵来演绎，E, L, U的关系
n = 5;
A = zeros(5);
for i = 1:n-1
    A = A + diag(1:i, (n-i));
end
A = A + A' + diag(1:n);
imshow(digit(A));
E = eye(n); E(2:n, 1) = -1;
P2 = eye(n); % resultshow功能尚不完善，P2作为参数暂不能缺省
U = E*A; % 图片中最右图像就是U,图片中名字暂不能改
% E对应P， U 对应于PA
resultshow(A, E, P2)
% -1*row1+row2; -1*row1+row3, ..., -1*row1+row5
L = eye(n); L(2:n, 1) = -E(2:n, 1);
A2 = L*U;  % A2 == A, 图片中可以展示
figure; resultshow(U, L, P2);
% 注意运行之后，是两张图片， 图1被图2遮挡，你需要用鼠标
% 将图片2拖到一边

%%
%Section7.2
% 7.2前半段照搬了section_7，除去图片显示
% ------------搬运的section_7 ------------------- %
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
% homework: 得到最终的矩阵U
% 并且显示还原过程即L*U的过程

%%
%Section8
% 矩阵的外积运算 
A = [1, 2;3 4];
B = [1, 2; 1, 1];
a1 = A(:,1); b1 = B(1, :);
a2 = A(:,2); b2 = B(2, :);
% A * B = a1 * b1 + a2 * b2
% 实现的过程是 a1 * eye(2) * b1 + a2 * eye(2) * b2
% 因为中间的有个缺省的矩阵
figure, resultshow(a1, eye(2), b1);
figure, resultshow(a2, eye(2), b2);
P1 = a1*b1; P2 = a2*b2; 
figure, subplot(1,3,1); imshow(digit(P1));
subplot(1,3,2); imshow(digit(P2));
subplot(1,3,3); imshow(digit(A*B));
% homework: a = ones(5, 1); b = (1:5)';两个列向量
% 绘图: dot(a, b),  a *b' (外积)

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











