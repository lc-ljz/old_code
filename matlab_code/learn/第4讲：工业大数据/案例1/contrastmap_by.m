%arry=[num1,num2]ÏñËØ

function  out=contrastmap_by(in1,in2)

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
              BY0=abs(B-Y);

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


by_1=imresize(BY0,[num1,num1]);
 by_2=imresize(BY0,[num2,num2]);
 by_1=imresize(by_1,[256,256]);
 by_2=imresize(by_2,[256,256]);
 by_12=abs(by_1-by_2);
 by_12=normalizeImage(by_12);
 by_12=double(by_12);
 out=by_12;
