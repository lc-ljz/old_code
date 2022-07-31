function [L, U] = slu(A)
% 方阵的LU分解， 不使用置换矩阵
n = size(A, 1);
tol = 1e-10;
for k = 1:n
    if abs(A(k,k))<tol, end
    L(k,k) = 1;
    for i = k+1:n
        L(i,k) = A(i,k)/A(k,k);
        for j = k+1:n
            A(i,j) = A(i,j) - L(i,k)*A(k,j);
        end
    end
    for j = k:n
        U(k,j) = A(k,j);
    end
end