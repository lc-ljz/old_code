function [il00,il45,il90,il135,direction]=tz_direct(Z0)

Z0=imresize(Z0,[256,256]);
 light0 =rgb2gray(Z0);
 
  direct=double(light0);
  direct00=mygaborfilter(direct,0);
   direct45=mygaborfilter(direct,45);
   direct90=mygaborfilter(direct,90);
   direct135=mygaborfilter(direct,135);
   
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
  direct_norm00_04=normalizeImage(direct00_04);
  direct_norm00_14=normalizeImage(direct00_14);
  direct_norm00_25=normalizeImage(direct00_25);
  direct_norm00_04=double(direct_norm00_04);
  direct_norm00_14=double(direct_norm00_14);
  direct_norm00_25=double(direct_norm00_25);
  IL00=direct_norm00_04+direct_norm00_14+direct_norm00_25;
  
  
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
  direct_norm45_04=normalizeImage(direct45_04);
  direct_norm45_14=normalizeImage(direct45_14);
  direct_norm45_25=normalizeImage(direct45_25);
   direct_norm45_04=double(direct_norm45_04);
  direct_norm45_14=double(direct_norm45_14);
  direct_norm45_25=double(direct_norm45_25);
  IL45=direct_norm45_04+direct_norm45_14+direct_norm45_25;
 
  
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
  direct_norm90_04=normalizeImage(direct90_04);
  direct_norm90_14=normalizeImage(direct90_14);
  direct_norm90_25=normalizeImage(direct90_25);
 direct_norm90_04=double(direct_norm90_04);
  direct_norm90_14=double(direct_norm90_14);
  direct_norm90_25=double(direct_norm90_25);
  IL90=direct_norm90_04+direct_norm90_14+direct_norm90_25;
 
  
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
  direct_norm135_04=normalizeImage(direct135_04);
  direct_norm135_14=normalizeImage(direct135_14);
  direct_norm135_25=normalizeImage(direct135_25);
 direct_norm135_04=double(direct_norm135_04);
  direct_norm135_14=double(direct_norm135_14);
  direct_norm135_25=double(direct_norm135_25);
  IL135=direct_norm135_04+direct_norm135_14+direct_norm135_25;
 
  
  il00=normalizeImage(IL00);
  il45=normalizeImage(IL45);
  il90=normalizeImage(IL90);
  il135=normalizeImage(IL135);
  DIRECTION_or=il00+il45+il90+il135;
  direction=normalizeImage(DIRECTION_or);