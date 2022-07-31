clear;clc;
fprintf("2 + 2 * eps 和 2 比较， 结果(logical): %d\n",2 + 2 * eps == 2);
fprintf("1 + 0.5 * eps 和 1 比较， 结果(logical): %d\n",1 + 0.5*eps == 1);

a = 315.34293429; 
b = 0.0099832372;
fprintf("a + eps 和 a 比较， 结果(logical): %d\n",a + eps == a);

n = 1;
while(1)
    if(a + n * eps == a)
        n = n + 1;
    else
        n = n - 1;
        break;
    end
end
fprintf("a + n * eps 和 a 比较， 让结果(logical)为1的最大整数为: %d\n",n);

k = -20;
while(1)
    if(b + 2^k * eps == b)
        k = k + 1;
    else
        k = k - 1;
        break;
    end
end
fprintf("b + n * eps (n = 2^k) 和 b 比较, 让结果(logical)为1的最大整数k为: %d\n",k);

% 4. realmax + num 什么时候不返回realmax的值， num最小取多少? 
num = 99342923242232322;
while(1)
    if(realmax + num == realmax)
        num = num * 2;
    else
        break;
    end
end
fprintf("realmax + num 不返回realmax的值， num最小取: %d\n",num);