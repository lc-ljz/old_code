%%
n=2000;
X = randn(n,2)*[0.1,1;1,0.7];
scatter(X(:,1),X(:,2));
xlim([-5,5]);
ylim([-5,5]);
hold on;

%%
u = mean(X);
S = (X' - u')*(X' - u')'/(n - 1);
[V, D] = eig(S);
e = V(:,2);
a = e' * (X' - u');
XX = u' + a.* e;
scatter(XX(1,:),XX(2,:),'r'); 
xlim([-5,5]);
ylim([-5,5]);
%%
[a,b,c] = pca(X);
e = X * a;
scatter(e(:,1),e(:,2),'r');
figure;
scatter(b(:,1),b(:,2),'b');
