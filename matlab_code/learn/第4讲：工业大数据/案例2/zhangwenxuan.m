function varargout = zhangwenxuan(varargin)
% ZHANGWENXUAN MATLAB code for zhangwenxuan.fig
%      ZHANGWENXUAN, by itself, creates a new ZHANGWENXUAN or raises the existing
%      singleton*.
%
%      H = ZHANGWENXUAN returns the handle to a new ZHANGWENXUAN or the handle to
%      the existing singleton*.
%
%      ZHANGWENXUAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZHANGWENXUAN.M with the given input arguments.
%
%      ZHANGWENXUAN('Property','Value',...) creates a new ZHANGWENXUAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zhangwenxuan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zhangwenxuan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zhangwenxuan

% Last Modified by GUIDE v2.5 15-May-2019 20:01:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zhangwenxuan_OpeningFcn, ...
                   'gui_OutputFcn',  @zhangwenxuan_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before zhangwenxuan is made visible.
function zhangwenxuan_OpeningFcn(hObject, eventdata, handles,varargin)
setappdata(handles.figure_pjimage,'img_src',0);
ha=axes('units','normalized','pos',[0 0 1 1]);
 uistack(ha,'down');
 ii=imread('20.jpg');
%设置程序的背景图为20.jpg
 image(ii);
 colormap gray
 set(ha,'handlevisibility','off','visible','off');
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zhangwenxuan (see VARARGIN)

% Choose default command line output for zhangwenxuan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zhangwenxuan wait for user response (see UIRESUME)
% uiwait(handles.figure_pjimage);


% --- Outputs from this function are returned to the command line.
function varargout = zhangwenxuan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function m_file_Callback(hObject, eventdata, handles)
% hObject    handle to m_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_file_open_Callback(hObject, eventdata, handles)
[filename,pathname]=uigetfile(...
{'*.bmp;*.jpg;*.png;*.jpeg','ImageFiles(*.bmp,*.jpg,*.png,*.jpeg)';...
'*.*','AllFiles(*.*)'},...
'Pick an image');
if isequal(filename,0)||isequal(pathname,0), 
    return; 
end 
axes(handles.axes_src);%用axes命令设定当前操作的坐标轴是axes_src 
fpath=[pathname filename];%将文件名和目录名组合成一个完整的路径 
imshow(imread(fpath));%用imread读入图片，并用imshow在axes_src上显示运行程序，通过“打开”菜单项，打开一个图片。
global img_src
img_src=imread(fpath);
imshow(img_src);
% hObject    handle to m_file_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function m_file_save_Callback(hObject, eventdata, handles)
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)'},'Save Picture','Untitled');
if FileName==0    
return;
else    
h=getframe(handles.axes_dst);
imwrite(h.cdata,[PathName,FileName]);
end;
% hObject    handle to m_file_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_file_exit_Callback(hObject, eventdata, handles)
close(handles.figure_pjimage); 
% hObject    handle to m_file_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_image_Callback(hObject, eventdata, handles)
% hObject    handle to m_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_image_2bw_Callback(hObject, eventdata, handles)
% hObject    handle to m_image_2bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
global img_src;
Z1=imresize(img_src,[128,128]);
axes(handles.axes_dst);
imshow(Z1);
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
global img_src;
Z2=imresize(img_src,[64,64]);
axes(handles.axes_dst);
imshow(Z2);
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
global img_src;
Z3=imresize(img_src,[32,32]);
axes(handles.axes_dst);
imshow(Z3);
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
global img_src;
Z4=imresize(img_src,[16,16]);
axes(handles.axes_dst);
imshow(Z4);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
global img_src;
Z5=imresize(img_src,[8,8]);
axes(handles.axes_dst);
imshow(Z5);
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
 %高斯滤波%
 axes(handles.axes_dst);
 g=[1,4,6,4,1;4,16,24,16,4;6,24,36,24,6;4,16,24,16,4;1,4,6,4,1];
 g=g/256;
 global img_src;
 Z0=imfilter(img_src,g);
 imshow(Z0);
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
 %高斯滤波%
 axes(handles.axes_dst);
 g=[1,4,6,4,1;4,16,24,16,4;6,24,36,24,6;4,16,24,16,4;1,4,6,4,1];
 g=g/256;
 global img_src ;
 Z0=imfilter(img_src,g);
 imshow(Z0);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
global img_src;
Z6=imresize(img_src,[4,4]);
axes(handles.axes_dst);
imshow(Z6);
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
global img_src;
Z7=imresize(img_src,[2,2]);
axes(handles.axes_dst);
imshow(Z7);
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
global img_src;
Z8=imresize(img_src,[1,1]);
axes(handles.axes_dst);
imshow(Z8);
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global img_src;
axes(handles.axes_dst);
g=img_src(:,:,2);
imshow(g);

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global img_src;
axes(handles.axes_dst);
r=img_src(:,:,1);
imshow(r);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global img_src;
axes(handles.axes_dst);
b=img_src(:,:,3);
imshow(b);
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
global img_src r g b RR rr gg bb ;
r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
rr=double(r);
gg=double(g);
bb=double(b);
 RR=(rr-((gg+bb)/2));
axes(handles.axes_dst);
imshow(RR);
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12


% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
global img_src r g b GG rr gg bb ;
r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
rr=double(r);
gg=double(g);
bb=double(b);
GG=(gg-((rr+bb)/2));
axes(handles.axes_dst);
imshow(GG);
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13


% --- Executes on button press in radiobutton14.
function radiobutton14_Callback(hObject, eventdata, handles)
global img_src r g b BB rr gg bb ;
r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
rr=double(r);
gg=double(g);
bb=double(b);
BB=(bb-((rr+gg)/2));
axes(handles.axes_dst);
imshow(BB);
% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton14


% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
 global img_src r g b YY rr gg bb ;
r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
rr=double(r);
gg=double(g);
bb=double(b);
 YY=((rr+gg)-(2*(abs(rr-gg)+bb)));
axes(handles.axes_dst);
imshow(YY);
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15


% --- Executes on button press in radiobutton16.
function radiobutton16_Callback(hObject, eventdata, handles)
global img_src;
img_dst=rgb2gray(img_src);
%转换为灰度强度图像
axes(handles.axes_dst);
imshow(img_dst);
% hObject    handle to radiobutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton16


% --- Executes on button press in radiobutton17.
function radiobutton17_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton17


% --- Executes on button press in radiobutton18.
function radiobutton18_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton18


% --- Executes on button press in radiobutton19.
function radiobutton19_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton19


% --- Executes on button press in radiobutton20.
function radiobutton20_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton20


% --- Executes on button press in radiobutton21.
function radiobutton21_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton21


% --- Executes on button press in radiobutton22.
function radiobutton22_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton22


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
 %（0,3）尺度亮度特征对比映射图的获取%
 global img_src ZL ZL3 ZLd ZL33 ZL03 zl03
  ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL3=imresize(ZL,[32,32]);
 ZL33=imresize(ZL3,[256,256]);
 ZLd=imresize(ZLd,[256,256]);
 ZL33=double(ZL33);
 ZL03=abs(ZLd-ZL33);
 %将插值后的图像进行归一化%
 zl03=normalizeImage(ZL03,255);
 axes(handles.axes_dst);
imshow(uint8(zl03));

% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
 %（1,4）尺度RG通道特征对比映射图的获取%
 global img_src r g b ZL rr gg bb RR GG RG RG1 RG4 RG11 RG44 RG14 rg14
 r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
 ZL=rgb2gray(img_src);
 rr=double(r);
 gg=double(g);
 bb=double(b);
 RR=(rr-((gg+bb)/2));
 GG=(gg-((rr+bb)/2));
 RG=abs(RR-GG);
 RG1=imresize(RG,[128,128]);
RG4=imresize(RG,[16,16]);
 RG11=imresize(RG1,[256,256]);
 RG44=imresize(RG4,[256,256]);
 RG14=abs(RG11-RG44);
 %将插值后的图像进行归一化%
 rg14=normalizeImage(RG14,255);
 axes(handles.axes_dst);
imshow(uint8(rg14));


% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
 %（2,5）尺度RG通道特征对比映射图的获取%
 global img_src r g b ZL rr gg bb RR GG RG RG2 RG5 RG22 RG55 RG25 rg25
 r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
 ZL=rgb2gray(img_src);
 rr=double(r);
 gg=double(g);
 bb=double(b);
 RR=(rr-((gg+bb)/2));
 GG=(gg-((rr+bb)/2));
 RG=abs(RR-GG);
 RG2=imresize(RG,[128,128]);
RG5=imresize(RG,[8,8]);
 RG22=imresize(RG2,[256,256]);
 RG55=imresize(RG5,[256,256]);
 RG25=abs(RG22-RG55);
 %将插值后的图像进行归一化%
 rg25=normalizeImage(RG25,255);
 axes(handles.axes_dst);
imshow(uint8(rg25));
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
global img_src r g b rr gg bb RR GG RG RG0 RG1 RG2 RG3 RG4 RG5 RG00 RG11 RG22 RG33 RG44 RG55 RG03 RG14 RG25 rg03 rg14 rg25 IRG irg
 %（0,3）、（1,4）、（2,5）尺度RG通道特征对比映射图的获取%
  r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
  rr=double(r);
 gg=double(g);
 bb=double(b);
 RR=(rr-((gg+bb)/2));
 GG=(gg-((rr+bb)/2));
  RG=abs(RR-GG);
  RG0=imresize(RG,[256,256]);
 RG1=imresize(RG,[128,128]);
RG2=imresize(RG,[64,64]);
RG3=imresize(RG,[32,32]);
RG4=imresize(RG,[16,16]);
 RG5=imresize(RG,[8,8]);
  RG00=imresize(RG0,[256,256]);
 RG11=imresize(RG1,[256,256]);
 RG22=imresize(RG2,[256,256]);
  RG33=imresize(RG3,[256,256]);
 RG44=imresize(RG4,[256,256]);
 RG55=imresize(RG5,[256,256]);
 RG=imresize(RG,[256,256]);
 RG03=abs(RG-RG33);
 RG14=abs(RG11-RG44);
 RG25=abs(RG22-RG55);
 %将插值后的图像进行归一化%
 rg03=normalizeImage(RG03,255);
 rg14=normalizeImage(RG14,255);
 rg25=normalizeImage(RG25,255);
imshow(uint8(rg03));
imshow(uint8(rg14));
imshow(uint8(rg25));
 %直接相加获得RG通道特征图%
rg03=double(rg03);
 rg14=double(rg14);
 rg25=double(rg25);
 IRG=rg03+rg14+rg25;
 irg=normalizeImage(IRG,255);
 imshow(uint8(irg));
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
global  COLOR irg iby color
 COLOR=irg+iby;
color=normalizeImage(COLOR,255);
imshow(uint8(color));
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
 %（0,3)尺度BY通道特征对比映射图的获取%
 global img_src r g b  bb BB YY rr gg BY BY3 BY33 BY03 by03
 r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
 imshow(r);
 imshow(g);
 imshow(b);
 bb=double(b);
 rr=double(r);
 gg=double(g);
 BB=(bb-((rr+gg)/2));
 YY=((rr+gg)-(2*(abs(rr-gg)+bb)));
 BY=abs(BB-YY);
BY3=imresize(BY,[32,32]);
  BY33=imresize(BY3,[256,256]);
 BY=imresize(BY,[256,256]);
 BY03=abs(BY-BY33);
 %将插值后的图像进行归一化%
 by03=normalizeImage(BY03,255);
imshow(uint8(by03));
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
 %(1,4)尺度BY通道特征对比映射图的获取%
 global img_src r g b rr gg bb BB YY BY BY1 BY4 BY14 BY11 BY44 by14
 r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
 rr=double(r);
 gg=double(g);
 bb=double(b);
 BB=(bb-((rr+gg)/2));
 YY=((rr+gg)-(2*(abs(rr-gg)+bb)));
 BY=abs(BB-YY);
BY1=imresize(BY,[128,128]);
BY4=imresize(BY,[16,16]);
 BY11=imresize(BY1,[256,256]);
 BY44=imresize(BY4,[256,256]);
 BY=imresize(BY,[256,256]);
 BY14=abs(BY11-BY44);
 %将插值后的图像进行归一化%
 by14=normalizeImage(BY14,255);
 axes(handles.axes_dst);
imshow(uint8(by14));
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
 %（0,3)(1,4)(2,5)尺度BY通道特征对比映射图的获取%
  global img_src r g b rr gg bb BB YY BY BY2 BY5 BY25 BY22 BY55 by25
 r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
 rr=double(r);
 gg=double(g);
 bb=double(b);
 BB=(bb-((rr+gg)/2));
 YY=((rr+gg)-(2*(abs(rr-gg)+bb)));
 BY=abs(BB-YY);
BY2=imresize(BY,[128,128]);
BY5=imresize(BY,[8,8]);
 BY22=imresize(BY2,[256,256]);
 BY55=imresize(BY5,[256,256]);
 BY=imresize(BY,[256,256]);
 BY25=abs(BY22-BY55);
 %将插值后的图像进行归一化%
 by25=normalizeImage(BY25,255);
 axes(handles.axes_dst);
imshow(uint8(by25));
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
global img_src r g b rr gg bb BB YY BY BY2 BY5 BY25 BY22 BY55 by25 BY1 BY3 BY4 BY11 BY33 BY44 BY14 BY03 by03 by14 IBY iby
 r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
 rr=double(r);
 gg=double(g);
 bb=double(b);
 BB=(bb-((rr+gg)/2));
 YY=((rr+gg)-(2*(abs(rr-gg)+bb)));
 BY=abs(BB-YY);
 BY1=imresize(BY,[128,128]);
BY2=imresize(BY,[64,64]);
BY3=imresize(BY,[32,32]);
BY4=imresize(BY,[16,16]);
 BY5=imresize(BY,[8,8]);
 BY11=imresize(BY1,[256,256]);
 BY22=imresize(BY2,[256,256]);
  BY33=imresize(BY3,[256,256]);
 BY44=imresize(BY4,[256,256]);
 BY55=imresize(BY5,[256,256]);
 BY=imresize(BY,[256,256]);
 BY03=abs(BY-BY33);
 BY14=abs(BY11-BY44);
 BY25=abs(BY22-BY55);
 %将插值后的图像进行归一化%
 by03=normalizeImage(BY03,255);
 by14=normalizeImage(BY14,255);
 by25=normalizeImage(BY25,255);
 %直接相加获得RG通道特征图%
by03=double(by03);
 by14=double(by14);
 by25=double(by25);
 IBY=by03+by14+by25;
 iby=normalizeImage(IBY,255);
 imshow(uint8(iby));
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
 %颜色特征图的获取%
 %（0,3）尺度RG通道特征对比映射图的获取%
 global RG RG3 RG33 RG03 rg03
RG3=imresize(RG,[32,32]);
RG33=imresize(RG3,[256,256]);
RG=imresize(RG,[256,256]);
RG03=abs(RG-RG33);
 %将插值后的图像进行归一化%
 rg03=normalizeImage(RG03,255);
imshow(uint8(rg03));
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
 %（1,4）尺度亮度特征对比映射图的获取%
 global img_src ZL ZL1 ZL4 ZL11 ZL44 ZL14 zl14
 ZL=rgb2gray(img_src);
 ZL1=imresize(ZL,[128,128]);
 ZL4=imresize(ZL,[16,16]);
 ZL11=imresize(ZL1,[256,256]);
 ZL44=imresize(ZL4,[256,256]);
 ZL11=double(ZL11);
 ZL44=double(ZL44);
 ZL14=abs(ZL11-ZL44);
 %将插值后的图像进行归一化%
 zl14=normalizeImage(ZL14,255);
 axes(handles.axes_dst);
imshow(uint8(zl14));

% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
global img_src ZL ZL2 ZL5 ZL22 ZL55 ZL25 zl25
 ZL=rgb2gray(img_src);
 %（2,5）尺度亮度特征对比映射图的获取%
 ZL2=imresize(ZL,[64,64]);
 ZL5=imresize(ZL,[8,8]);
 ZL22=imresize(ZL2,[256,256]);
 ZL55=imresize(ZL5,[256,256]);
 ZL22=double(ZL22);
 ZL55=double(ZL55);
 ZL25=abs(ZL22-ZL55);
 %将插值后的图像进行归一化%
 zl25=normalizeImage(ZL25,255);
 axes(handles.axes_dst);
 imshow(uint8(zl25));
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
global img_src ZL ZL1 ZL2 ZL3 ZL4 ZL5 ZL11 ZL22 ZL33 ZL44 ZL55 ZLd ZL03 ZL14 ZL25 zl03 zl14 zl25 IL il light
 ZL=rgb2gray(img_src);
 ZL1=imresize(ZL,[128,128]);
 ZL2=imresize(ZL,[64,64]);
 ZL3=imresize(ZL,[32,32]);
 ZL4=imresize(ZL,[16,16]);
 ZL5=imresize(ZL,[8,8]);
 ZL11=imresize(ZL1,[256,256]);
 ZL22=imresize(ZL2,[256,256]);
 ZL33=imresize(ZL3,[256,256]);
 ZL44=imresize(ZL4,[256,256]);
 ZL55=imresize(ZL5,[256,256]);
 ZLd=imresize(ZLd,[256,256]);
 ZL11=double(ZL11);
 ZL22=double(ZL22);
 ZL33=double(ZL33);
 ZL44=double(ZL44);
 ZL55=double(ZL55);
 ZL03=abs(ZLd-ZL33);
 ZL14=abs(ZL11-ZL44);
 ZL25=abs(ZL22-ZL55);
 %将插值后的图像进行归一化%
 zl03=normalizeImage(ZL03,255);
 zl14=normalizeImage(ZL14,255);
 zl25=normalizeImage(ZL25,255);
 %直接相加获得亮度特征图%
zl03=double(zl03);
 zl14=double(zl14);
 zl25=double(zl25);
 IL=zl03+zl14+zl25;
 il=normalizeImage(IL,255);
 light=il;
 imshow(uint8(light));
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton27.
function radiobutton27_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton27


% --- Executes on button press in radiobutton28.
function radiobutton28_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton28


% --- Executes on button press in radiobutton29.
function radiobutton29_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton29


% --- Executes on button press in radiobutton30.
function radiobutton30_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton30


% --- Executes on button press in radiobutton31.
function radiobutton31_Callback(hObject, eventdata, handles)
%  朝向特征提取（Gabor滤波器）%
global img_src ZL ZLd ZL00
ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL00=mygaborfilter(ZLd,0);
 axes(handles.axes_dst);
imshow(ZL00);

% hObject    handle to radiobutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton31


% --- Executes on button press in radiobutton32.
function radiobutton32_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL45
ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL45=mygaborfilter(ZLd,45);
 axes(handles.axes_dst);
imshow(ZL45);
% hObject    handle to radiobutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton32


% --- Executes on button press in radiobutton33.
function radiobutton33_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL90
ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL90=mygaborfilter(ZLd,90);
 axes(handles.axes_dst);
imshow(ZL90);
% hObject    handle to radiobutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton33


% --- Executes on button press in radiobutton34.
function radiobutton34_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL135
ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL135=mygaborfilter(ZLd,135);
 axes(handles.axes_dst);
imshow(ZL135);
% hObject    handle to radiobutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton34


% --- Executes on button press in radiobutton23.
function radiobutton23_Callback(hObject, eventdata, handles)
global img_src;
axes(handles.axes_dst);
 %亮度提取%
 ZL=rgb2gray(img_src);
 imshow(ZL);
% hObject    handle to radiobutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton23


% --- Executes on button press in radiobutton24.
function radiobutton24_Callback(hObject, eventdata, handles)
%  R、G、B、Y广义四通道颜色特征提取%
global img_src r g b RR GG rr gg bb RG ;
r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
rr=double(r);
gg=double(g);
bb=double(b);
 RR=(rr-((gg+bb)/2));
 GG=(gg-((rr+bb)/2));
%  RG通道%
 RG=abs(RR-GG);
axes(handles.axes_dst);
imshow(uint8(RG));
% hObject    handle to radiobutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton24


% --- Executes on button press in radiobutton25.
function radiobutton25_Callback(hObject, eventdata, handles)
global img_src r g b RR GG BB YY rr gg bb BY ;
 r=img_src(:,:,1);
 g=img_src(:,:,2);
 b=img_src(:,:,3);
 rr=double(r);
 gg=double(g);
 bb=double(b);
 BB=(bb-((rr+gg)/2));
 YY=((rr+gg)-(2*(abs(rr-gg)+bb)));
 %  BY通道%
 BY=abs(BB-YY);
 axes(handles.axes_dst);
imshow(uint8(BY));
% hObject    handle to radiobutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton25


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
global ZL000 ZL003 ZL00 ZL0000 ZL0033 ZL0003 zl0003 zl0014 ZL0014 ZL0011 ZL0044 ZL001 ZL004 ZL0025 ZL0022 ZL0055 ZL002 ZL005 zl0025 IL00 il00 ZL453 ZL45 ZL450 ZL4500 ZL4533 ZL4503 zl4503 zl4514 ZL4514 ZL4511 ZL4544 ZL451 ZL454 ZL4525 ZL4522 ZL4555 ZL452 ZL455 zl4525 IL45 il45
global ZL903 ZL90 ZL900 ZL9000 ZL9033 ZL9003 zl9003 zl9014 ZL9014 ZL9011 ZL9044 ZL901 ZL904 ZL9025 ZL9022 ZL9055 ZL902 ZL905 zl9025 IL90 il90 ZL1353 ZL135 ZL1350 ZL13500 ZL13533 ZL13503 zl13503 zl13514 ZL13514 ZL13511 ZL13544 ZL1351 ZL1354 ZL13525 ZL13522 ZL13555 ZL1352 ZL1355 zl13525 IL135 il135
ZL000=imresize(ZL00,[256,256]);
  ZL001=imresize(ZL00,[128,128]);
ZL002=imresize(ZL00,[64,64]);
 ZL003=imresize(ZL00,[32,32]);
ZL004=imresize(ZL00,[16,16]);
 ZL005=imresize(ZL00,[8,8]);
 ZL0000=imresize(ZL000,[256,256]);
 ZL0011=imresize(ZL001,[256,256]);
 ZL0022=imresize(ZL002,[256,256]);
  ZL0033=imresize(ZL003,[256,256]);
  ZL0044=imresize(ZL004,[256,256]);
 ZL0055=imresize(ZL005,[256,256]);
 ZL00=imresize(ZL00,[256,256]);
 ZL0003=abs(ZL00-ZL0033);
 ZL0014=abs(ZL0011-ZL0044);
 ZL0025=abs(ZL0022-ZL0055);
 %将插值后的图像进行归一化%
 zl0003=normalizeImage(ZL0003,255);
 zl0014=normalizeImage(ZL0014,255);
 zl0025=normalizeImage(ZL0025,255);
 %直接相加获得0°朝向特征图%
zl0003=double(zl0003);
 zl0014=double(zl0014);
 zl0025=double(zl0025);
 IL00=zl0003+zl0014+zl0025;
 il00=normalizeImage(IL00,255);
 %（0,4）、（1,4）、（2,5）尺度45°朝向特征对比映射图的获取%
 ZL450=imresize(ZL45,[256,256]);
 ZL451=imresize(ZL45,[128,128]);
ZL452=imresize(ZL45,[64,64]);
ZL453=imresize(ZL45,[32,32]);
ZL454=imresize(ZL45,[16,16]);
 ZL455=imresize(ZL45,[8,8]);
  ZL4500=imresize(ZL450,[256,256]);
 ZL4511=imresize(ZL451,[256,256]);
 ZL4522=imresize(ZL452,[256,256]);
  ZL4533=imresize(ZL453,[256,256]);
 ZL4544=imresize(ZL454,[256,256]);
 ZL4555=imresize(ZL455,[256,256]);
 ZL45=imresize(ZL45,[256,256]);
 ZL4503=abs(ZL45-ZL4533);
 ZL4514=abs(ZL4511-ZL4544);
 ZL4525=abs(ZL4522-ZL4555);
 %将插值后的图像进行归一化%
 zl4503=normalizeImage(ZL4503,255);
 zl4514=normalizeImage(ZL4514,255);
 zl4525=normalizeImage(ZL4525,255);
 %直接相加获得45°朝向特征图%
zl4503=double(zl4503);
 zl4514=double(zl4514);
 zl4525=double(zl4525);
 IL45=zl4503+zl4514+zl4525;
 il45=normalizeImage(IL45,255);
 %（0,3）、（1,4）、（2,5）尺度90°朝向特征对比映射图的获取%
  ZL900=imresize(ZL90,[256,256]);
 ZL901=imresize(ZL90,[128,128]);
ZL902=imresize(ZL90,[64,64]);
 ZL903=imresize(ZL90,[32,32]);
ZL904=imresize(ZL90,[16,16]);
 ZL905=imresize(ZL90,[8,8]);
  ZL9000=imresize(ZL900,[256,256]);
 ZL9011=imresize(ZL901,[256,256]);
 ZL9022=imresize(ZL902,[256,256]);
  ZL9033=imresize(ZL903,[256,256]);
 ZL9044=imresize(ZL904,[256,256]);
 ZL9055=imresize(ZL905,[256,256]);
 ZL90=imresize(ZL90,[256,256]);
 ZL9003=abs(ZL90-ZL9033);
 ZL9014=abs(ZL9011-ZL9044);
 ZL9025=abs(ZL9022-ZL9055);
 %将插值后的图像进行归一化%
 zl9003=normalizeImage(ZL9003,255);
 zl9014=normalizeImage(ZL9014,255);
 zl9025=normalizeImage(ZL9025,255);
 %直接相加获得90°朝向特征图%
zl9003=double(zl9003);
 zl9014=double(zl9014);
 zl9025=double(zl9025);
 IL90=zl9003+zl9014+zl9025;
 il90=normalizeImage(IL90,255);
 %（0,3）、（1,4）、（2,5）尺度135°朝向特征对比映射图的获取%
 ZL1350=imresize(ZL135,[256,256]);
 ZL1351=imresize(ZL135,[128,128]);
ZL1352=imresize(ZL135,[64,64]);
 ZL1353=imresize(ZL135,[32,32]);
ZL1354=imresize(ZL135,[16,16]);
 ZL1355=imresize(ZL135,[8,8]);
 ZL13500=imresize(ZL1350,[256,256]);
 ZL13511=imresize(ZL1351,[256,256]);
 ZL13522=imresize(ZL1352,[256,256]);
 ZL13533=imresize(ZL1353,[256,256]);
 ZL13544=imresize(ZL1354,[256,256]);
 ZL13555=imresize(ZL1355,[256,256]);
 ZL135=imresize(ZL135,[256,256]);
 ZL13503=abs(ZL135-ZL13533);
 ZL13514=abs(ZL13511-ZL13544);
 ZL13525=abs(ZL13522-ZL13555);
 %将插值后的图像进行归一化%
 zl13503=normalizeImage(ZL13503,255);
 zl13514=normalizeImage(ZL13514,255);
 zl13525=normalizeImage(ZL13525,255);
 %直接相加获得135°朝向特征图%
zl13503=double(zl13503);
 zl13514=double(zl13514);
 zl13525=double(zl13525);
 IL135=zl13503+zl13514+zl13525;
 il135=normalizeImage(IL135,255);
 %直接相加获得朝向特征图%
 DIRECTION=il00+il45+il90+il135;
 direction=normalizeImage(DIRECTION,255);
 imshow(direction);
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL135 ZL1350 ZL1353 ZL13500 ZL13533 ZL13503 zl13503
if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（0,3）尺度135°朝向特征对比映射图的获取%
  ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL135=mygaborfilter(ZLd,135);
 ZL1350=imresize(ZL135,[256,256]);
 ZL1353=imresize(ZL135,[32,32]);
  ZL13500=imresize(ZL1350,[256,256]);
  ZL13533=imresize(ZL1353,[256,256]);
 ZL135=imresize(ZL135,[256,256]);
 ZL13503=abs(ZL135-ZL13533);
 zl13503=normalizeImage(ZL13503,255);
 axes(handles.axes_dst);
imshow(uint8(zl13503));
else
SW_Checkbox= 0;
end
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL1353 ZL135 ZL1350 ZL13500 ZL13533 ZL13503 zl13503 zl13514 ZL13514 ZL13511 ZL13544 ZL1351 ZL1354 ZL13525 ZL13522 ZL13555 ZL1352 ZL1355 zl13525 IL135 il135
ZL=rgb2gray(img_src);
ZLd=double(ZL);
 ZL135=mygaborfilter(ZLd,135);
   ZL1350=imresize(ZL135,[256,256]);
  ZL1351=imresize(ZL135,[128,128]);
ZL1352=imresize(ZL135,[64,64]);
 ZL1353=imresize(ZL135,[32,32]);
ZL1354=imresize(ZL135,[16,16]);
 ZL1355=imresize(ZL135,[8,8]);
 ZL13500=imresize(ZL1350,[256,256]);
 ZL13511=imresize(ZL1351,[256,256]);
 ZL13522=imresize(ZL1352,[256,256]);
  ZL13533=imresize(ZL1353,[256,256]);
  ZL13544=imresize(ZL1354,[256,256]);
 ZL13555=imresize(ZL1355,[256,256]);
 ZL135=imresize(ZL135,[256,256]);
 ZL13503=abs(ZL135-ZL13533);
 ZL13514=abs(ZL13511-ZL13544);
 ZL13525=abs(ZL13522-ZL13555);
 %将插值后的图像进行归一化%
 zl13503=normalizeImage(ZL13503,255);
 zl13514=normalizeImage(ZL13514,255);
 zl13525=normalizeImage(ZL13525,255);
%直接相加获得0°朝向特征图%
zl13503=double(zl13503);
 zl13514=double(zl13514);
 zl13525=double(zl13525);
 IL135=zl13503+zl13514+zl13525;
 il135=normalizeImage(IL135,255);
 axes(handles.axes_dst);
 imshow(uint8(il135));
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL90 ZL900 ZL903 ZL9000 ZL9033 ZL9003 zl9003
if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（0,3）尺度90°朝向特征对比映射图的获取%
  ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL90=mygaborfilter(ZLd,90);
 ZL900=imresize(ZL90,[256,256]);
 ZL903=imresize(ZL90,[32,32]);
  ZL9000=imresize(ZL900,[256,256]);
  ZL9033=imresize(ZL903,[256,256]);
 ZL90=imresize(ZL90,[256,256]);
 ZL9003=abs(ZL90-ZL9033);
 zl9003=normalizeImage(ZL9003,255);
imshow(uint8(zl9003));
 axes(handles.axes_dst);
else
SW_Checkbox= 0;
end
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL903 ZL90 ZL900 ZL9000 ZL9033 ZL9003 zl9003 zl9014 ZL9014 ZL9011 ZL9044 ZL901 ZL904 ZL9025 ZL9022 ZL9055 ZL902 ZL905 zl9025 IL90 il90
ZL=rgb2gray(img_src);
ZLd=double(ZL);
 ZL90=mygaborfilter(ZLd,90);
   ZL900=imresize(ZL90,[256,256]);
  ZL901=imresize(ZL90,[128,128]);
ZL902=imresize(ZL90,[64,64]);
 ZL903=imresize(ZL90,[32,32]);
ZL904=imresize(ZL90,[16,16]);
 ZL905=imresize(ZL90,[8,8]);
 ZL9000=imresize(ZL900,[256,256]);
 ZL9011=imresize(ZL901,[256,256]);
 ZL9022=imresize(ZL902,[256,256]);
  ZL9033=imresize(ZL903,[256,256]);
  ZL9044=imresize(ZL904,[256,256]);
 ZL9055=imresize(ZL905,[256,256]);
 ZL90=imresize(ZL90,[256,256]);
 ZL9003=abs(ZL90-ZL9033);
 ZL9014=abs(ZL9011-ZL9044);
 ZL9025=abs(ZL9022-ZL9055);
 %将插值后的图像进行归一化%
 zl9003=normalizeImage(ZL9003,255);
 zl9014=normalizeImage(ZL9014,255);
 zl9025=normalizeImage(ZL9025,255);
%直接相加获得0°朝向特征图%
zl9003=double(zl9003);
 zl9014=double(zl9014);
 zl9025=double(zl9025);
 IL90=zl9003+zl9014+zl9025;
 il90=normalizeImage(IL90,255);
 axes(handles.axes_dst);
 imshow(uint8(il90));
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
 global img_src ZL ZLd ZL45 ZL450 ZL453 ZL4500 ZL4533 ZL4503 zl4503 
 if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（0,3）尺度0°朝向特征对比映射图的获取%
   ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL45=mygaborfilter(ZLd,45);
   ZL450=imresize(ZL45,[256,256]);
 ZL453=imresize(ZL45,[32,32]);
 ZL4500=imresize(ZL450,[256,256]);
  ZL4533=imresize(ZL453,[256,256]);
 ZL45=imresize(ZL45,[256,256]);
 ZL4503=abs(ZL45-ZL4533);
 zl4503=normalizeImage(ZL4503,255);
 axes(handles.axes_dst);
 imshow(uint8(zl4503));
else
SW_Checkbox= 0;
end
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL453 ZL45 ZL450 ZL4500 ZL4533 ZL4503 zl4503 zl4514 ZL4514 ZL4511 ZL4544 ZL451 ZL454 ZL4525 ZL4522 ZL4555 ZL452 ZL455 zl4525 IL45 il45
ZL=rgb2gray(img_src);
ZLd=double(ZL);
 ZL45=mygaborfilter(ZLd,45);
   ZL450=imresize(ZL45,[256,256]);
  ZL451=imresize(ZL45,[128,128]);
ZL452=imresize(ZL45,[64,64]);
 ZL453=imresize(ZL45,[32,32]);
ZL454=imresize(ZL45,[16,16]);
 ZL455=imresize(ZL45,[8,8]);
 ZL4500=imresize(ZL450,[256,256]);
 ZL4511=imresize(ZL451,[256,256]);
 ZL4522=imresize(ZL452,[256,256]);
  ZL4533=imresize(ZL453,[256,256]);
  ZL4544=imresize(ZL454,[256,256]);
 ZL4555=imresize(ZL455,[256,256]);
 ZL45=imresize(ZL45,[256,256]);
 ZL4503=abs(ZL45-ZL4533);
 ZL4514=abs(ZL4511-ZL4544);
 ZL4525=abs(ZL4522-ZL4555);
 %将插值后的图像进行归一化%
 zl4503=normalizeImage(ZL4503,255);
 zl4514=normalizeImage(ZL4514,255);
 zl4525=normalizeImage(ZL4525,255);
%直接相加获得0°朝向特征图%
zl4503=double(zl4503);
 zl4514=double(zl4514);
 zl4525=double(zl4525);
 IL45=zl4503+zl4514+zl4525;
 il45=normalizeImage(IL45,255);
 axes(handles.axes_dst);
 imshow(uint8(il45));
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
 global img_src ZL ZLd ZL00 ZL000 ZL003 ZL0000 ZL0033 ZL0003 zl0003 
 if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（0,3）尺度0°朝向特征对比映射图的获取%
   ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL00=mygaborfilter(ZLd,0);
   ZL000=imresize(ZL00,[256,256]);
 ZL003=imresize(ZL00,[32,32]);
 ZL0000=imresize(ZL000,[256,256]);
  ZL0033=imresize(ZL003,[256,256]);
 ZL00=imresize(ZL00,[256,256]);
 ZL0003=abs(ZL00-ZL0033);
 zl0003=normalizeImage(ZL0003,255);
 axes(handles.axes_dst);
 imshow(uint8(zl0003));
else
SW_Checkbox= 0;
end
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（1,4）尺度0°朝向特征对比映射图的获取%
 global img_src ZL ZLd ZL00 ZL001 ZL004 ZL0011 ZL0044 ZL0014 zl0014 
 ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL00=mygaborfilter(ZLd,0);
   ZL001=imresize(ZL00,[128,128]);
ZL004=imresize(ZL00,[16,16]);
 ZL0011=imresize(ZL001,[256,256]);
  ZL0044=imresize(ZL004,[256,256]);
 ZL00=imresize(ZL00,[256,256]);
 ZL0014=abs(ZL0011-ZL0044);
 zl0014=normalizeImage(ZL0014,255);
 axes(handles.axes_dst);
imshow(uint8(zl0014));
else
SW_Checkbox= 0;
end
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.

% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL003 ZL00 ZL0000 ZL0033 ZL0003 zl0003 zl0014 ZL0014 ZL0011 ZL0044 ZL001 ZL004 ZL0025 ZL0022 ZL0055 ZL002 ZL005 zl0025 IL00 il00
ZL=rgb2gray(img_src);
ZLd=double(ZL);
 ZL00=mygaborfilter(ZLd,0);
   ZL000=imresize(ZL00,[256,256]);
  ZL001=imresize(ZL00,[128,128]);
ZL002=imresize(ZL00,[64,64]);
 ZL003=imresize(ZL00,[32,32]);
ZL004=imresize(ZL00,[16,16]);
 ZL005=imresize(ZL00,[8,8]);
 ZL0000=imresize(ZL000,[256,256]);
 ZL0011=imresize(ZL001,[256,256]);
 ZL0022=imresize(ZL002,[256,256]);
  ZL0033=imresize(ZL003,[256,256]);
  ZL0044=imresize(ZL004,[256,256]);
 ZL0055=imresize(ZL005,[256,256]);
 ZL00=imresize(ZL00,[256,256]);
 ZL0003=abs(ZL00-ZL0033);
 ZL0014=abs(ZL0011-ZL0044);
 ZL0025=abs(ZL0022-ZL0055);
 %将插值后的图像进行归一化%
 zl0003=normalizeImage(ZL0003,255);
 zl0014=normalizeImage(ZL0014,255);
 zl0025=normalizeImage(ZL0025,255);
%直接相加获得0°朝向特征图%
zl0003=double(zl0003);
 zl0014=double(zl0014);
 zl0025=double(zl0025);
 IL00=zl0003+zl0014+zl0025;
 il00=normalizeImage(IL00,255);
 axes(handles.axes_dst);
 imshow(uint8(il00));
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
global img_src ZL ZL1 ZL2 ZL3 ZL4 ZL5 ZL11 ZL22 ZL33 ZL44 ZL55 ZLd ZL03 ZL14 ZL25 zl03 zl14 zl25 IL il light
 ZL=rgb2gray(img_src);
 ZL1=imresize(ZL,[128,128]);
 ZL2=imresize(ZL,[64,64]);
 ZL3=imresize(ZL,[32,32]);
 ZL4=imresize(ZL,[16,16]);
 ZL5=imresize(ZL,[8,8]);
 ZL11=imresize(ZL1,[256,256]);
 ZL22=imresize(ZL2,[256,256]);
 ZL33=imresize(ZL3,[256,256]);
 ZL44=imresize(ZL4,[256,256]);
 ZL55=imresize(ZL5,[256,256]);
 ZLd=imresize(ZLd,[256,256]);
 ZL11=double(ZL11);
 ZL22=double(ZL22);
 ZL33=double(ZL33);
 ZL44=double(ZL44);
 ZL55=double(ZL55);
 ZL03=abs(ZLd-ZL33);
 ZL14=abs(ZL11-ZL44);
 ZL25=abs(ZL22-ZL55);
 %将插值后的图像进行归一化%
 zl03=normalizeImage(ZL03,255);
 zl14=normalizeImage(ZL14,255);
 zl25=normalizeImage(ZL25,255);
 %直接相加获得亮度特征图%
zl03=double(zl03);
 zl14=double(zl14);
 zl25=double(zl25);
 IL=zl03+zl14+zl25;
 il=normalizeImage(IL,255);
 light=il;
 imshow(uint8(light));
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL135 ZL1351 ZL1354 ZL13511 ZL13544 ZL13514 zl13514
if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（1,4）尺度135°朝向特征对比映射图的获取%
   ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL135=mygaborfilter(ZLd,135);
  ZL1351=imresize(ZL135,[128,128]);
ZL1354=imresize(ZL135,[16,16]);
 ZL13511=imresize(ZL1351,[256,256]);
 ZL13544=imresize(ZL1354,[256,256]);
 ZL135=imresize(ZL135,[256,256]);
 ZL13514=abs(ZL13511-ZL13544);
 zl13514=normalizeImage(ZL13514,255);
 axes(handles.axes_dst);
 imshow(uint8(zl13514));
else
SW_Checkbox= 0;
end
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox15


% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（2,5）尺度135°朝向特征对比映射图的获取%
 global img_src ZL ZLd ZL135 ZL1352 ZL1355 ZL13522 ZL13555 ZL13525 zl13525 
   ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL135=mygaborfilter(ZLd,135);
  ZL135=imresize(ZL135,[256,256]);
 ZL1352=imresize(ZL135,[64,64]);
 ZL1355=imresize(ZL135,[8,8]);
ZL13522=imresize(ZL1352,[256,256]);
 ZL13555=imresize(ZL1355,[256,256]);
  ZL13525=abs(ZL13522-ZL13555);
   zl13525=normalizeImage(ZL13525,255);
 axes(handles.axes_dst);
 imshow(uint8(zl13525));
else
SW_Checkbox= 0;
end
% hObject    handle to checkbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox18


% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL90 ZL901 ZL904 ZL9011 ZL9044 ZL9014 zl9014
if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（1,4）尺度90°朝向特征对比映射图的获取%
  ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL90=mygaborfilter(ZLd,90);
  ZL901=imresize(ZL90,[128,128]);
ZL904=imresize(ZL90,[16,16]);
 ZL9011=imresize(ZL901,[256,256]);
 ZL9044=imresize(ZL904,[256,256]);
 ZL90=imresize(ZL90,[256,256]);
 ZL9014=abs(ZL9011-ZL9044);
 zl9014=normalizeImage(ZL9014,255);
 axes(handles.axes_dst);
 imshow(uint8(zl9014));
else
SW_Checkbox= 0;
end
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14


% --- Executes on button press in checkbox17.
function checkbox17_Callback(hObject, eventdata, handles)
if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（2,5）尺度90°朝向特征对比映射图的获取%
 global img_src ZL ZLd ZL90 ZL902 ZL905 ZL9022 ZL9055 ZL9025 zl9025 
  ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL90=mygaborfilter(ZLd,90);
  ZL90=imresize(ZL90,[256,256]);
 ZL902=imresize(ZL90,[64,64]);
 ZL905=imresize(ZL90,[8,8]);
ZL9022=imresize(ZL902,[256,256]);
 ZL9055=imresize(ZL905,[256,256]);
  ZL9025=abs(ZL9022-ZL9055);
   zl9025=normalizeImage(ZL9025,255);
 axes(handles.axes_dst);
 imshow(uint8(zl9025));
else
SW_Checkbox= 0;
end
% hObject    handle to checkbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox17


% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
global img_src ZL ZLd ZL45 ZL451 ZL454 ZL4511 ZL4544 ZL4514 zl4514
if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（1,4）尺度45°朝向特征对比映射图的获取%
   ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL45=mygaborfilter(ZLd,45);
  ZL451=imresize(ZL45,[128,128]);
ZL454=imresize(ZL45,[16,16]);
 ZL4511=imresize(ZL451,[256,256]);
 ZL4544=imresize(ZL454,[256,256]);
 ZL45=imresize(ZL45,[256,256]);
 ZL4514=abs(ZL4511-ZL4544);
 zl4514=normalizeImage(ZL4514,255);
 axes(handles.axes_dst);
 imshow(uint8(zl4514));
else
SW_Checkbox= 0;
end

% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13


% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（2,5）尺度0°朝向特征对比映射图的获取%
 global img_src ZL ZLd ZL00 ZL002 ZL005 ZL0022 ZL0055 ZL0025 zl0025 
  ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL00=mygaborfilter(ZLd,0);
  ZL00=imresize(ZL00,[256,256]);
 ZL002=imresize(ZL00,[64,64]);
 ZL005=imresize(ZL00,[8,8]);
ZL0022=imresize(ZL002,[256,256]);
 ZL0055=imresize(ZL005,[256,256]);
  ZL0025=abs(ZL0022-ZL0055);
   zl0025=normalizeImage(ZL0025,255);
 axes(handles.axes_dst);
 imshow(uint8(zl0025));
else
SW_Checkbox= 0;
end
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16


% --- Executes on button press in checkbox19.
function checkbox19_Callback(hObject, eventdata, handles)
if ( get(hObject,'Value') )
SW_Checkbox = 1;
 %（2,5）尺度45°朝向特征对比映射图的获取%
 global img_src ZL ZLd ZL45 ZL452 ZL455 ZL4522 ZL4555 ZL4525 zl4525 
   ZL=rgb2gray(img_src);
 ZLd=double(ZL);
 ZL45=mygaborfilter(ZLd,45);
  ZL45=imresize(ZL45,[256,256]);
 ZL452=imresize(ZL45,[64,64]);
 ZL455=imresize(ZL45,[8,8]);
ZL4522=imresize(ZL452,[256,256]);
 ZL4555=imresize(ZL455,[256,256]);
  ZL4525=abs(ZL4522-ZL4555);
   zl4525=normalizeImage(ZL4525,255);
 axes(handles.axes_dst);
 imshow(uint8(zl4525));
else
SW_Checkbox= 0;
end
% hObject    handle to checkbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox19


% --- Executes on button press in pushbutton32.

% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
global DIRECTION direction il00 il45 il90 il135;
 DIRECTION=il00+il45+il90+il135;
 direction=normalizeImage(DIRECTION);
 axes(handles.axes_dst);
 imshow(direction);
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
global xuan img_src ;
[filename,pathname]=uigetfile('*.jpg;*.jpg files');
img_src=imread(strcat(pathname,filename));
xuan=imresize(img_src,[256,256]);
axes(handles.axes_src);
imshow(xuan);
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
h=gcf;
fengmian;
close(h)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
global light color  direction  FINAL final
light=double(light);
 color=double(color);
 direction=double(direction);
 FINAL=light+color+direction;
 final=normalizeImage(FINAL,255);
 imshow(uint8(final));
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text4.
function text4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton39.
function pushbutton39_Callback(hObject, eventdata, handles)
global img_src zengqiang
zengqiang=imadjust(img_src,[0.3 0.7],[0 1],0.5);
axes(handles.axes_dst);
imshow(zengqiang)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in radiobutton37.
function radiobutton37_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton37


% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
global img_src zhifangtu
zhifangtu=rgb2gray(img_src);
axes(handles.axes_dst);
imhist(zhifangtu);
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
global img_src
img_src=rgb2gray(img_src);
%五种边缘检测
figure('Name','进行五种边缘检测');
subplot(2,3,1);
imshow(img_src);
title('原图');
BW1=edge(img_src,'Roberts',0.16);
subplot(2,3,2);
imshow(BW1);
title('Robert算子边缘检测')
BW2=edge(img_src,'Sobel',0.16);
subplot(2,3,3);
imshow(BW2);
title('Sobel算子边缘检测')
BW3=edge(img_src,'Prewitt',0.06);
subplot(2,3,4);
imshow(BW3);
title('Prewitt算子边缘检测');
BW4=edge(img_src,'LOG',0.012);
subplot(2,3,5);
imshow(BW4);
title('LOG算子边缘检测')
BW5=edge(img_src,'Canny',0.3);
subplot(2,3,6);
imshow(BW5);
title('Canny算子边缘检测')
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
