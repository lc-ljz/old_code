A=[2,-1,-1;-1,2,0;-1,2,1];b=[0,1,0]';
D=diag(A);D=diag(D);B=D-A;
maxiter=30;x=zeros(size(A,2),1);
for i =1:maxiter
    temp=x;
    for j=1:numel(x)
        x(j)=(B(j,:)*x+b(j))/D(j,j);
    end
    if(max(abs(temp-x))<1e-5),break,end
end
x
