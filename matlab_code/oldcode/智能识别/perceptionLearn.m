%perceptionLearn.m
% �������룺���ݣ�������������ǩ��ѧϰ�ʣ���ֹ�ִ�
% �����ѵ���õ���Ȩֵ����
% ѵ��������������������ѧϰ�ʣ������������˹̶�ֵ
 
function [w]=perceptionLearn(x,y,learningRate,maxEpoch)
    [rows,cols]=size(x);
    x=[x,ones(rows,1)];%����
    w=zeros(1,cols+1);%ͬ��
    for epoch=1:maxEpoch%���ɷ��������������ִ�
        flag=true;%��־λ����ѵ�����
        for sample=1:rows
            if sign(x(sample,:)*w')~=y(sample)%�����Ƿ���ȷ�����������Ȩֵ
                flag=false;
               %����ͽ̰����в�ͬ�������й淶������ô����Ȩֵʱ��Ҫ��ǩ���䵱�ݶȷ���ı���
                w=w+learningRate*y(sample)*x(sample,:);
            end
        end
        if flag==true
            break;
        end
    end
end