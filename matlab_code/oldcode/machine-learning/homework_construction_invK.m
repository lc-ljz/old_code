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
fprintf("invK��\n");
invK
fprintf("�˾�����K�������1/(n+1), �� invK*K=n+1\n");