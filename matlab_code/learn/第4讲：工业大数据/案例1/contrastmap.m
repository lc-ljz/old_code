% ���ܣ��Ա�ӳ��ͼ��ȡ
% ʹ������:ָ��GUIϵͳ����
% ���������a��ӳ��ͼ���ͣ� light  RG BY direct0 direct45 direct90 direct135
%           b�����Աȶ���
% �����out���Ա�ӳ��ͼ��
% ���ߣ�������
function  out=contrastmap(a,b)
global Z0
Z0=imresize(Z0,[256,256]);

% if isempty(Z0)
%     return;
% else   
switch a
    case 'light'       
          out=contrastmap_light(b(1),b(2));
    case 'RG'       
            out=contrastmap_rg(b(1),b(2)); 
    case 'BY'       
            out=contrastmap_by(b(1),b(2));      
    case 'direct0'
         out=contrastmap_direct(0,b(1),b(2));
    case 'direct45'
        out=contrastmap_direct(45,b(1),b(2));
    case 'direct90'
         out=contrastmap_direct(90,b(1),b(2));
    case 'direct135'
        out=contrastmap_direct(135,b(1),b(2));
        
        
end     
% end