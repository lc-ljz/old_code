function [rg,by]=getrg_by(Z0)

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
  rg=abs(R-G);
   by=abs(B-Y);