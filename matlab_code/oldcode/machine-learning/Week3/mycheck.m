function A = mycheck(A)
r = rem(sum(A(:)), 1); 
if(r)
    warning('�����д���С�����Ѿ��Զ���������');
end
A = round(A);
logic = A<-3; 
if(sum(logic(:))), error('������С��-3');end
logic = A>25;
if(sum(logic(:))), error('�����е�Ԫ��ֵ���ܳ���25'); end