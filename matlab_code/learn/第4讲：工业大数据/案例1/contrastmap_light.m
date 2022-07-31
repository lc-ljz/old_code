%arry=[num1,num2]ÏñËØ

function  out=contrastmap_light(in1,in2)

global Z0


light0 =rgb2gray(Z0);


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


light1=imresize(light0,[num1,num1]);
light11=imresize(light1,[256,256]);
light11=double(light11);
light2=imresize(light0,[num2,num2]);
light22=imresize(light2,[256,256]);
light22=double(light22);
light12=abs(light11-light22);
light_norm12=normalizeImage(light12);
light_norm12=double(light_norm12);
out=light_norm12;
