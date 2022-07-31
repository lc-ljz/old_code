% Built-in,  除法
% Built-in 最简单的加法和减法， 除法就不简单了，除法实际是算法
% 算法一定有初始化， 
% Built in 算法没有超参数
y = 0.01;
c = 39.99323293221;
for i = 1:7
    y = y * (2 - c * y);
end
y
format long;
y
1/c
% built-in sqrt
x = 1;
c = 4.954332932983242;
for i = 1:6
    x = 0.5*(x + c/x);
end
x
sqrt(c)
% homework: x = (2*x + a/(x^2))/3;     x^3 = a 已知 a
% 使用一个绝对值不大，但很长的小数，来实验最少需要多少步完成收敛