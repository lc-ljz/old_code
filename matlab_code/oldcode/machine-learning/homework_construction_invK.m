n = 5;
a = [2, -1, zeros(1, n-2)];
K = toeplitz(a);
triuK = zeros(n);
t = n:-1:1;
for i = 1:n
    temp = t(i) * (1:i)';
    triuK(1:i,i) = temp;
end
trilK = triu(triuK, 1); trilK = trilK';
invK = trilK + triuK;
fprintf("invK是\n");
invK
fprintf("此矩阵与K的逆相差1/(n+1), 即 invK*K=n+1\n");