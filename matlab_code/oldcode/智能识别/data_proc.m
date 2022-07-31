% data_proc.m
% 函数功能：删除同类数据特征中方差为0的特征列
% 输入：行向量数据及标签
% 输出：删除列之后的数据以及删除的列标
function [output,position] = data_proc(data,label)
    position = cell(1,10);
    %创建cell存储每类中删除的列标
    for i = 0:9
        temp = [];
        pos = [];
        for rows = 1:size(data,1)
                if label(rows)==i
                    temp = [temp;data(rows,:)];
                end
        end
        for cols = 1:size(temp,2)
            var_data = var(temp(:,cols));
            if var_data==0
                pos = [pos,cols];
            end
        end
        position{i+1} = pos;
        data(:,pos)=[];
    end
    output = data;
end
 
 
