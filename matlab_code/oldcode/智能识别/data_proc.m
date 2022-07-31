% data_proc.m
% �������ܣ�ɾ��ͬ�����������з���Ϊ0��������
% ���룺���������ݼ���ǩ
% �����ɾ����֮��������Լ�ɾ�����б�
function [output,position] = data_proc(data,label)
    position = cell(1,10);
    %����cell�洢ÿ����ɾ�����б�
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
 
 
