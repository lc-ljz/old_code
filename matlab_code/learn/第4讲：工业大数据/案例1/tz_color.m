function [rg,by,color]=tz_color(Z0)


array_r=Z0(:,:,1);
array_g=Z0(:,:,2);
array_b=Z0(:,:,3);

  r=double(array_r);
  g=double(array_g);
  b=double(array_b);
  R=(r-((g+b)/2));
  G=(g-((r+b)/2));
  B=(b-((r+g)/2));
  Y=((r+g)-(2*(abs(r-g)+b)));

  RG0=abs(R-G);
  BY0=abs(B-Y);
  
  RG0=imresize(RG0,[256,256]);
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
   
  rg04=normalizeImage(RG04);
  rg14=normalizeImage(RG14);
  rg25=normalizeImage(RG25);
   rg04=double(rg04);
  rg14=double(rg14);
  rg25=double(rg25);
  RG=rg04+rg14+rg25;
 
  BY0=imresize(BY0,[256,256]);
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
  
   by04=normalizeImage(BY04);
  by14=normalizeImage(BY14);
  by25=normalizeImage(BY25);
  
   by04=double(by04);
  by14=double(by14);
  by25=double(by25);
  IBY=by04+by14+by25;
  
 
   rg=normalizeImage(RG);
   by=normalizeImage(IBY);
   COLOR_or=rg+by;
   color=normalizeImage(COLOR_or);
