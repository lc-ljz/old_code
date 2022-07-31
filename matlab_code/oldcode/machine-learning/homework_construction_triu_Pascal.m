n = 7;
P = eye(n); 
P(:, 1) = 1;
for i = 3:n
    P(i, 2:i-1) = P(i-1,1:i-2) + P(i-1, 2:i-1);
end
P
fprintf("构造法即使用递归算法产生任意维的P， 老师表述不当\n");