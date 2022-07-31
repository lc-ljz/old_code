%arry=[num1,num2]ÏñËØ

function  out=contrastmap_rg(in1,in2)
global Z0

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

if in1==0
    num1=256;
elseif in1==1
    num1=128;
elseif in1==2
    num1=64;
elseif in1==3
    num1=32;
elseif in1==4
    num1=16;
elseif in1==5
    num1=8;
elseif in1==6
    num1=4;
elseif in1==7
    num1=2;
elseif in1==8
    num1=1;
else
    return;
end


if in2==0
    num2=256;
elseif in2==1
    num2=128;
elseif in2==2
    num2=64;
elseif in2==3
    num2=32;
elseif in2==4
    num2=16;
elseif in2==5
    num2=8;
elseif in2==6
    num2=4;
elseif in2==7
    num2=2;
elseif in2==8
    num2=1;
else
    return;
end

%arry=[num1,num2];
arry1=[num1,num1];
arry2=[num2,num2];

%  RG4=imresize(RG0,[16,16]);
%  RG5=imresize(RG0,[8,8]);
%  RG4=imresize(RG4,[256,256]);
%  RG5=imresize(RG5,[256,256]);
%  RG45=abs(RG4-RG5);
%  rg45=normalizeImage(RG45);
%  rg45=double(rg45);
 
 rg_1=imresize(RG0,[num1,num1]);
 rg_2=imresize(RG0,[num2,num2]);
 rg_1=imresize(rg_1,[256,256]);
 rg_2=imresize(rg_2,[256,256]);
 rg_12=abs(rg_1-rg_2);
 rg_12=normalizeImage(rg_12);
 rg_12=double(rg_12);
 out=rg_12;