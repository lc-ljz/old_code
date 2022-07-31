function A = mycheck(A)
r = rem(sum(A(:)), 1); 
if(r)
    warning('矩阵中存在小数，已经自动四舍五入');
end
A = round(A);
logic = A<-3; 
if(sum(logic(:))), error('数不能小于-3');end
logic = A>25;
if(sum(logic(:))), error('矩阵中的元素值不能超过25'); end