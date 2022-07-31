function im2=mygaborfilter(im,ang)
% %gabor???¡§?¡Â???¨®
[a,b]=size(im);
if  a<19&&b<19
    im=imresize(im,[a+18,b+18]);
end
g=cell(1,2);
g{1}=zeros(19,19);
g{2}=zeros(19,19);

 seta=ang/180*pi;
gama=1;
derta=3.5;
lapuda=7;

for x=-9:1:9
    for y=-9:1:9
        X=x*cos(seta)+y*sin(seta);
        Y=-x*sin(seta)+y*cos(seta);
        g{1}(x+10,y+10)=exp(-(X^2+gama^2*Y^2)/(2*derta^2))*cos(2*pi*X/lapuda);
        g{2}(x+10,y+10)=exp(-(X^2+gama^2*Y^2)/(2*derta^2))*cos(2*pi*X/lapuda+0.5*pi);
    end
end
 g1=g{1};%???????????¡ã
 g2=g{2};%¡¤????????????¡ã
  g1=g1-mean(g1(:));
 g2=g2-mean(g2(:));
  g1=g1/sqrt(sum(g1(:).^2));
  g2=g2/sqrt(sum(g2(:).^2));
im2=abs(imfilter(double(im),g1,'symmetric'))+abs(imfilter(double(im),g2,'symmetric'));
im2=imresize(im2,[a,b]);
im2=normalizeImage(im2);