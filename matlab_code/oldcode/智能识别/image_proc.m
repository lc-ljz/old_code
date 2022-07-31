%image_proc
% 定义函数，对手写数字进行处理，使其尽量贴近mnist的格式
% 输入：原图，及期望处理后的大小
 
function [output] = image_proc(input,len)
     
    se = strel('square',3);%图像膨胀参数，方形模式3个像素扩大
    temp = imcrop(rgb2gray(input),[25,25,200,200]);%裁剪，原图白边过大
    temp = imresize(temp,[len,len]);
    [rows,cols] = size(temp);%获取图像大小
     
    for row = 1:rows
        for col = 1:cols
            if temp(row,col)==255
                temp(row,col)=0;%图像反相；mnist为黑底白字，手写为白底黑字
            else
                temp(row,col)=255;
            end
        end 
    end
    temp = imdilate(temp,se);
    %由于手写字体非常细，这里需要对其进行膨胀处理，使其相对接近mnist
    output = temp;
end