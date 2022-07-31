function light=tz_light(Z0)


Z0=imresize(Z0,[256,256]);
 light0 =rgb2gray(Z0);
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
  
  light_norm04=normalizeImage(light04);
  light_norm14=normalizeImage(light14);
  light_norm25=normalizeImage(light25);
  
  light_norm04=double(light_norm04);
  light_norm14=double(light_norm14);
  light_norm25=double(light_norm25);
  IL=light_norm04+light_norm14+light_norm25;
  
  light=normalizeImage(IL); 