%arry=[num1,num2]ÏñËØ  angle:½Ç¶ÈÖµ

function  out=contrastmap_direct(angle,in1,in2)

global Z0


light0 =rgb2gray(Z0); 
direct=double(light0);
direct00=mygaborfilter(direct,0);
direct45=mygaborfilter(direct,45);
direct90=mygaborfilter(direct,90);
direct135=mygaborfilter(direct,135);

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

switch angle
    case 0
        direc=direct00;
        direct_1=imresize(direc,[num1,num1]);
        direct_1=imresize(direct_1,[256,256]);
        direct_2=imresize(direc,[num2,num2]);
        direct_2=imresize(direct_2,[256,256]);
        direct_12=abs(direct_1-direct_2);
        direct_norm_12=normalizeImage(direct_12); 
        direct_norm_12=double(direct_norm_12);
        out=direct_norm_12;

    case 45
        direc=direct45;
        direct_1=imresize(direc,[num1,num1]);
        direct_1=imresize(direct_1,[256,256]);
        direct_2=imresize(direc,[num2,num2]);
        direct_2=imresize(direct_2,[256,256]);
        direct_12=abs(direct_1-direct_2);
        direct_norm_12=normalizeImage(direct_12); 
        direct_norm_12=double(direct_norm_12);
        out=direct_norm_12;
    case 90
        direc=direct90;
        direct_1=imresize(direc,[num1,num1]);
        direct_1=imresize(direct_1,[256,256]);
        direct_2=imresize(direc,[num2,num2]);
        direct_2=imresize(direct_2,[256,256]);
        direct_12=abs(direct_1-direct_2);
        direct_norm_12=normalizeImage(direct_12); 
        direct_norm_12=double(direct_norm_12);
        out=direct_norm_12;
    case 135
        direc=direct135;
        direct_1=imresize(direc,[num1,num1]);
        direct_1=imresize(direct_1,[256,256]);
        direct_2=imresize(direc,[num2,num2]);
        direct_2=imresize(direct_2,[256,256]);
        direct_12=abs(direct_1-direct_2);
        direct_norm_12=normalizeImage(direct_12); 
        direct_norm_12=double(direct_norm_12);
        out=direct_norm_12;
end