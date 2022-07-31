% 功能：对比映射图获取
% 使用条件:指定GUI系统界面
% 输入参数：a（映射图类型） light  RG BY direct0 direct45 direct90 direct135
%           b（两对比对象）
% 输出：out（对比映射图）
% 作者：姜增辉
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