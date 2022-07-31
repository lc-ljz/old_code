fprintf("tensor product;outer product;Íâ»ý\n");
n=5;
a=0:(n-1);
b=ones(1,n-1);
r1=a'*b;
r2=b'*a;
figure;
subplot(1,2,1);imagesc(r1);
subplot(1,2,2);imagesc(r2);
