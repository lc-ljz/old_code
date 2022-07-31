function [direct00,direct45,direct90,direct135]=getdirection(Z0)

light0 =rgb2gray(Z0);
 direct=double(light0);
  direct00=mygaborfilter(direct,0);
   direct45=mygaborfilter(direct,45);
   direct90=mygaborfilter(direct,90);
   direct135=mygaborfilter(direct,135);
   
