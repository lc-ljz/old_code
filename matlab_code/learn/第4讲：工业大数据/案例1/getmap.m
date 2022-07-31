
function final = getmap(Z)
% global Z
% [filename pathname] =uigetfile('*.jpg');
% B=[pathname filename];
% Z=imread(B);
% Z=imread('1.jpg');%输入原始函数，读图像信息
   g=[1,4,6,4,1;   %滤波，将每一个像素点乘一个滤波矩阵
    4,16,4,16,4;
    6,24,36,24,6;
    4,16,24,16,4;
     1,4,6,4,1];
g=g/256;
Z0=imfilter(Z,g);%0尺度，对任意类型数组或多维图像进行滤波 g=imfilter(f,w,filtering_mode,boundary_options,size_optinos) 
                % f是输入图像，w为滤波模板，g为滤波结果
% imshow(Z0);%滤波后的更模糊一点，将尖锐的信息滤去
% % % % % % % % % % % % 多尺度采样%%%%%%%%%%%%%%%%%
Z0=imresize(Z0,[256,256]);
Z1=imresize(Z0,[128,128]);%1尺度，改变图像的大小。B = imresize(A, [numrows numcols])numrows和numcols分别指定目标图像的高度和宽度
Z2=imresize(Z0,[64,64]);%2尺度，
Z3=imresize(Z0,[32,32]);%3尺度，
Z4=imresize(Z0,[16,16]);%4尺度，
Z5=imresize(Z0,[8,8]);%5尺度，
% 
% imshow(Z1);%显示1尺度
% imshow(Z2);%显示2尺度
% imshow(Z3);%显示3尺度
% imshow(Z4);%显示4尺度
% imshow(Z5);%显示5尺度
% 
%R,G,B三通道颜色提取,0尺度下参数
array_r=Z0(:,:,1);
array_g=Z0(:,:,2);
array_b=Z0(:,:,3);
% imshow(array_r);
% imshow(array_g);
% imshow(array_b);
% %   %亮度提取%
   light0 =rgb2gray(Z0);
%  ZL=rgb2gray(Z0);
%   imshow(ZL);
% %   %颜色特征提取%
  %R、G、B、Y（亮度）广义四通道颜色特征提取%
  r=double(array_r);
  g=double(array_g);
  b=double(array_b);
  R=(r-((g+b)/2));
  G=(g-((r+b)/2));
  B=(b-((r+g)/2));
  Y=((r+g)-(2*(abs(r-g)+b)));
%   imshow(uint8(R));
%   imshow(uint8(G));
%   imshow(uint8(B));
%   imshow(uint8(Y));
  %RG通道%
  RG0=abs(R-G);
%  imshow(uint8(RG0));
% %  
%   %BY通道%
  BY0=abs(B-Y);
%  imshow(uint8(BY0));
% 
% 
   %朝向特征提取（Gabor滤波器）%
  direct=double(light0);
  direct00=mygaborfilter(direct,0);
   direct45=mygaborfilter(direct,45);
   direct90=mygaborfilter(direct,90);
   direct135=mygaborfilter(direct,135);

%    imshow(uint8(ZL00));
%    imshow(direct00);  
%   imshow(direct45);
%   imshow(uint8(ZL45));
%    imshow(direct90);
%    imshow(direct135);
   
   
   
%   %亮度显著图的获取%

  %（0,4）、（1,4）、（2,5）尺度亮度特征对比映射图的获取%
   light1=imresize(light0,[128,128]);
  light2=imresize(light0,[64,64]);
   light4=imresize(light0,[16,16]);
   light5=imresize(light0,[8,8]);
  light11=imresize(light1,[256,256]);
  light22=imresize(light2,[256,256]);
  light44=imresize(light4,[256,256]);
  light55=imresize(light5,[256,256]);
  direct=double(light0);
  light11=double(light11);
  light22=double(light22);
  light44=double(light44);
  light55=double(light55);
  light04=abs(direct-light44);
  light14=abs(light11-light44);
  light25=abs(light22-light55);
%   imshow(light04);
%   imshow(light14);
%   imshow(light25);

  %将插值后的图像进行归一化%
%   zl04=normalizeImage(ZL04);
%   zl14=normalizeImage(ZL14);
%   zl25=normalizeImage(ZL25);
  light_norm04=normalizeImage(light04);
  light_norm14=normalizeImage(light14);
  light_norm25=normalizeImage(light25);
%   imshow(light_norm04);
%   imshow(light_norm14);
%  imshow(light_norm25);


%   %直接相加获得亮度特征图%
 light_norm04=double(light_norm04);
  light_norm14=double(light_norm14);
  light_norm25=double(light_norm25);
  IL=light_norm04+light_norm14+light_norm25;
  %il=Normal(IL,255);
   light=normalizeImage(IL); 
%   imshow(light);
  
%   %颜色特征图的获取%
  %（0,4）、（1,4）、（2,5）尺度RG通道特征对比映射图的获取%
  RG1=imresize(RG0,[128,128]);
 RG2=imresize(RG0,[64,64]);
 RG4=imresize(RG0,[16,16]);
  RG5=imresize(RG0,[8,8]);
  RG11=imresize(RG1,[256,256]);
  RG22=imresize(RG2,[256,256]);
  RG44=imresize(RG4,[256,256]);
  RG55=imresize(RG5,[256,256]);
  RG04=abs(RG0-RG44);
  RG14=abs(RG11-RG44);
  RG25=abs(RG22-RG55);
%  imshow(RG04); 
%  imshow(RG14);
%  imshow(RG25);
%   %将插值后的图像进行归一化%

  rg04=normalizeImage(RG04);
  rg14=normalizeImage(RG14);
  rg25=normalizeImage(RG25);
%   imshow(rg04);
%   imshow(rg14);
%   imshow(rg25);
% %   %直接相加获得RG通道特征图%
 rg04=double(rg04);
  rg14=double(rg14);
  rg25=double(rg25);
  RG=rg04+rg14+rg25;

   rg=normalizeImage(RG);

%    imshow(rg);
%   %（0,4）、（1,4）、（2,5）尺度BY通道特征对比映射图的获取%
  BY1=imresize(BY0,[128,128]);
 BY2=imresize(BY0,[64,64]);
 BY4=imresize(BY0,[16,16]);
  BY5=imresize(BY0,[8,8]);
  BY11=imresize(BY1,[256,256]);
  BY22=imresize(BY2,[256,256]);
  BY44=imresize(BY4,[256,256]);
  BY55=imresize(BY5,[256,256]);
  BY04=abs(BY0-BY44);
  BY14=abs(BY11-BY44);
  BY25=abs(BY22-BY55);
%    imshow(BY04); 
%  imshow(BY14);
%  imshow(BY25);
%   %将插值后的图像进行归一化%
  by04=normalizeImage(BY04);
  by14=normalizeImage(BY14);
  by25=normalizeImage(BY25);
%  imshow(by04);
%  imshow(by14);
%  imshow(by25);
%   %直接相加获得RG通道特征图%
 by04=double(by04);
  by14=double(by14);
  by25=double(by25);
  IBY=by04+by14+by25;
%   iby=Normal(IBY,255);
  by=normalizeImage(IBY); 
%   imshow(by);
  
%   %直接相加获得颜色特征图%
 COLOR_or=rg+by;
%  color=Normal(COLOR,255);
 color=normalizeImage(COLOR_or);
%  imshow(color);
 
 
% %   %朝向特征图的获取%
% %   %（0,4）、（1,4）、（2,5）尺度0°朝向特征对比映射图的获取%
  direct00_1=imresize(direct00,[128,128]);
 direct00_2=imresize(direct00,[64,64]);
 direct00_4=imresize(direct00,[16,16]);
  direct00_5=imresize(direct00,[8,8]);
  direct00_11=imresize(direct00_1,[256,256]);
  direct00_22=imresize(direct00_2,[256,256]);
  direct00_44=imresize(direct00_4,[256,256]);
  direct00_55=imresize(direct00_5,[256,256]);
  direct00_04=abs(direct00-direct00_44);
  direct00_14=abs(direct00_11-direct00_44);
  direct00_25=abs(direct00_22-direct00_55);
%   %将插值后的图像进行归一化%

  direct_norm00_04=normalizeImage(direct00_04);
  direct_norm00_14=normalizeImage(direct00_14);
  direct_norm00_25=normalizeImage(direct00_25);
%  imshow(direct_norm00_04);
%  imshow(direct_norm00_14);
%  imshow(direct_norm00_25);
 
 
% %   %直接相加获得0°朝向特征图%
 direct_norm00_04=double(direct_norm00_04);
  direct_norm00_14=double(direct_norm00_14);
  direct_norm00_25=double(direct_norm00_25);
  IL00=direct_norm00_04+direct_norm00_14+direct_norm00_25;
   il00=normalizeImage(IL00);
%    imshow(il00);

% %   %（0,4）、（1,4）、（2,5）尺度45°朝向特征对比映射图的获取%
 direct45_1=imresize(direct45,[128,128]);
 direct45_2=imresize(direct45,[64,64]);
 direct45_4=imresize(direct45,[16,16]);
  direct45_5=imresize(direct45,[8,8]);
  direct45_11=imresize(direct45_1,[256,256]);
  direct45_22=imresize(direct45_2,[256,256]);
  direct45_44=imresize(direct45_4,[256,256]);
  direct45_55=imresize(direct45_5,[256,256]);
  direct45_04=abs(direct45-direct45_44);
  direct45_14=abs(direct45_11-direct45_44);
  direct45_25=abs(direct45_22-direct45_55);
% %   %将插值后的图像进行归一化%
  direct_norm45_04=normalizeImage(direct45_04);
  direct_norm45_14=normalizeImage(direct45_14);
  direct_norm45_25=normalizeImage(direct45_25);
%  imshow(direct_norm45_04);
%  imshow(direct_norm45_14);
%  imshow(direct_norm45_25);
% %   %直接相加获得45°朝向特征图%
 direct_norm45_04=double(direct_norm45_04);
  direct_norm45_14=double(direct_norm45_14);
  direct_norm45_25=double(direct_norm45_25);
  IL45=direct_norm45_04+direct_norm45_14+direct_norm45_25;
  il45=normalizeImage(IL45);
%   imshow(il45);
% %   %（0,4）、（1,4）、（2,5）尺度90°朝向特征对比映射图的获取%
  direct90_1=imresize(direct90,[128,128]);
 direct90_2=imresize(direct90,[64,64]);
 direct90_4=imresize(direct90,[16,16]);
  direct90_5=imresize(direct90,[8,8]);
  direct90_11=imresize(direct90_1,[256,256]);
  direct90_22=imresize(direct90_2,[256,256]);
  direct90_44=imresize(direct90_4,[256,256]);
  direct90_55=imresize(direct90_5,[256,256]);
  direct90_04=abs(direct90-direct90_44);
  direct90_14=abs(direct90_11-direct90_44);
  direct90_25=abs(direct90_22-direct90_55);
% %   %将插值后的图像进行归一化%
  direct_norm90_04=normalizeImage(direct90_04);
  direct_norm90_14=normalizeImage(direct90_14);
  direct_norm90_25=normalizeImage(direct90_25);
%  imshow(direct_norm90_04);
%  imshow(direct_norm90_14);
%  imshow(direct_norm90_25);
%   %直接相加获得90°朝向特征图%
 direct_norm90_04=double(direct_norm90_04);
  direct_norm90_14=double(direct_norm90_14);
  direct_norm90_25=double(direct_norm90_25);
  IL90=direct_norm90_04+direct_norm90_14+direct_norm90_25;
  il90=normalizeImage(IL90);
%    imshow(il90);
% %   %（0,4）、（1,4）、（2,5）尺度135°朝向特征对比映射图的获取%
  direct135_1=imresize(direct135,[128,128]);
 direct135_2=imresize(direct135,[64,64]);
 direct135_4=imresize(direct135,[16,16]);
  direct135_5=imresize(direct135,[8,8]);
  direct135_11=imresize(direct135_1,[256,256]);
  direct135_22=imresize(direct135_2,[256,256]);
  direct135_44=imresize(direct135_4,[256,256]);
  direct135_55=imresize(direct135_5,[256,256]);
  direct135_04=abs(direct135-direct135_44);
  direct135_14=abs(direct135_11-direct135_44);
  direct135_25=abs(direct135_22-direct135_55);
% %   %将插值后的图像进行归一化%
  direct_norm135_04=normalizeImage(direct135_04);
  direct_norm135_14=normalizeImage(direct135_14);
  direct_norm135_25=normalizeImage(direct135_25);
%  imshow(direct_norm135_04);
%  imshow(direct_norm135_14);
%  imshow(direct_norm135_25);
% %   %直接相加获得135°朝向特征图%
 direct_norm135_04=double(direct_norm135_04);
  direct_norm135_14=double(direct_norm135_14);
  direct_norm135_25=double(direct_norm135_25);
  IL135=direct_norm135_04+direct_norm135_14+direct_norm135_25;
  il135=normalizeImage(IL135);
%   imshow(il135);
  
% %   %直接相加获得朝向特征图%
  DIRECTION_or=il00+il45+il90+il135;
  direction=normalizeImage(DIRECTION_or);
  
  
%  imshow(direction); 
% % %   %直接相加获得原始图像的显著图%
 LIGHT=double(light);
  COLOR=double (color);
  DIRECTION=double (direction);
  FINAL=(LIGHT+COLOR+DIRECTION)/3;
  final=normalizeImage(FINAL);
%   imshow(final);

