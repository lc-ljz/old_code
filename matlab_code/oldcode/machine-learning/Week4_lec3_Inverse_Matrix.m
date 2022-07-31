%% Gauss-Jordan Elimination
A = randn(3);
B = inv(A); % 这个结果是否正确？
AA = [A, eye(3)];
C = rref(AA); % Gauss-Jordan
% 你不能说这个求逆是正确的。 
%% 线代里首先强调的含义，矩阵的结构，
img = imread('cameraman.tif');
imshow(img);
img = im2double(img);
img_inverse = inv(img);
figure, imshow(img_inverse); % nonsense

%% 西方教学里， 核心是矩阵本身
% 用这本书学习线代时， 应该以案例为核心，而不是算法
% 高等数学当中， 99% 的问题是无法求解的 === 没有意义
% 数学处理问题的方式： 什么是最好的 === 唯一的
% 化归， 将未知的问题转化或者分解成已知的问题

%% 学习矩阵论，或者学习算法时， <对象，算法>必须放在一起
