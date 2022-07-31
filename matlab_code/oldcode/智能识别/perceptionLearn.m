%perceptionLearn.m
% 函数输入：数据（行向量），标签，学习率，终止轮次
% 输出：训练得到的权值向量
% 训练方法：单样本修正，学习率（步长）采用了固定值
 
function [w]=perceptionLearn(x,y,learningRate,maxEpoch)
    [rows,cols]=size(x);
    x=[x,ones(rows,1)];%增广
    w=zeros(1,cols+1);%同上
    for epoch=1:maxEpoch%不可分情况下整体迭代轮次
        flag=true;%标志位真则训练完毕
        for sample=1:rows
            if sign(x(sample,:)*w')~=y(sample)%分类是否正确？错误则更新权值
                flag=false;
               %这里和教案稍有不同，不进行规范化，那么更新权值时需要标签来充当梯度方向的变量
                w=w+learningRate*y(sample)*x(sample,:);
            end
        end
        if flag==true
            break;
        end
    end
end