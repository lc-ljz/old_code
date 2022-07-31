
% n=5000;
% a=randn(n);
% b=randn(n,1);
% tic;
% c=a\b;
% toc;
% A=randn(10);
% A(1,2:end)
A = [1e-32, 1; 1, 1]; b = [1; 2];
A = A([2,1],:); b = b([2,1]);