n = 3;
A = hilb(n);b = ones(n,1);

%
%[L,U,P] = lu(A);
%x = A\b;
%
% E1 = eye(n);E1(2:n,1) = - A(2:n,1)/A(1,1);
% U1 = E1 * A;
% L1 = eye(n);L1(2:n,1) = A(2:n,1)/A(1,1);
% E2 = eye(n);E2(3:n,2) = - U1(3:n,2)/U1(2,2);
% U2 = E2 * U1;
% L2 = eye(n);L2(3:n,2) = U1(3:n,2)/U1(2,2);
% L2 = L1 *L2;

%
L = eye(n);
for i =1:n-1
    E = eye(n);E(i+1:n,i) = -A(i+1:n,i)/A(i,i);
    U = E * A;
    L1 = eye(n);L1(i+1:n,i) = A(i+1:n,i)/A(i,i);
    L = L * L1;
    A = U;
end
