 function varargout = Enter(varargin)
% ENTER MATLAB code for Enter.fig
%      ENTER, by itself, creates a new ENTER or raises the existing
%      singleton*.
%
%      H = ENTER returns the handle to a new ENTER or the handle to
%      the existing singleton*.
%
%      ENTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENTER.M with the given input arguments.
%
%      ENTER('Property','Valu Starting from the left, property value pairs are
%      applied to the GUI before Enter_OpeningFcn gets called.  An
%      unrecognized propere',...) creates a new ENTER or raises the
%      existing singleton*. ty name or invalid value makes property application
%      stop.  All inputs are passed to Enter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Enter

% Last Modified by GUIDE v2.5 07-Jun-2019 16:42:45

% Begin initialization code - DO NOT EDIT

% if isempty(findall(0,'Name','login'))
% run login;
% return;
% end;
gui_Singleton = 0; % �����GUI ����������ж��ʵ���������Դ򿪶������
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Enter_OpeningFcn, ...
                   'gui_OutputFcn',  @Enter_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []); 
% �ýṹ�����˸�GUI��״��������gui�����֡�����ʵ����(gui_OpeningFcn)��ʼ����������������������Լ��ص�����
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1}); 
    % �ֱ�ȡ��figure�Ͱ����Ŀؼ���CreateFcn�ص����������������ؼ���
end
% figure�͸��ؼ�������ϣ���������OpeningFcn���г�ʼ����Ȼ������OutputFcn����figure�ľ����Ϊ������������
% ��ʱ��GUI���������Ļ����ʾ������
% �˺�����ڵȴ�״̬���ȴ��û��Ĳ����������ڵ���gui_mainfcn����ʱ�����figure�Լ����ؼ���һ���¼���������listener����
% ���������û���figure�Լ����ؼ��Ĳ��������磺�û��������һ��pushbutton��ťʱ���������������ʱ�䣬
% Ȼ����øð�ť�Ļص�����pushbutton_callback�����¼����д���
% �û����figure�Ĺرհ�ťʱ���������CloseRequestFcn�ص�������ִ�йرմ��ڵĲ�����
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Enter is made visible.
function Enter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Enter (see VARARGIN)

% Choose default command line output for Enter
handles.output = hObject;
% %���ñ���ͼƬ
% hAxes=axes('Visible','off','units','normalized','pos',[0 0 1 1]);
% %uistack(ha,'down');
% cdata=imread('3.jpg');
% image(cdata);
% axis off;
%%%%%%%%%%%%%%%%%%%%%%
% axes(handles.axes1);
% img=imread('1.jpg');
% imshow(img);
% Update handles structure
guidata(hObject, handles);
handles.output = hObject;
warning off all;
javaFrame = get(hObject, 'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('jida.jpg'));%icon1.jpg

% UIWAIT makes Enter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Enter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global;
[filename,pathname,filterindex]...      %uigetfile���ڴ�һ�������ļ��ĶԻ���һ����������������һ������Ϊ
    =uigetfile({'*.*';'*.jpg';'*.tif';'*.png'},'ѡ��ͼƬ',...    %�ļ��ĸ�ʽ������׺�����ڶ��������ǸöԻ�������ƣ�
    'C:\Users\Administrator\Desktop\My_Image'); %�����������ĸöԻ����Ĭ�ϴ�·��������ֵΪ�û�ѡ����ļ�·��������
if(filterindex==0)%filterindexΪѡ�����Ľ����ѡ����Ϊ1����֮Ϊ0
    return
else 
    str=[pathname filename]; %�ϳ�·��+�ļ���
    im=imread(str); %��ȡͼƬ
    im=imresize(im,[256,256]);
    axes(handles.axesleft); %ʹ��axes4�����(����һ����ͼ�ζ���)
    imshow(im);
    axes(handles.axesright);
    cla(handles.axesright);
    set(handles.axesright, 'Visible', 'on','xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
    handles.img=im;%��ԭͼ��im����handles����е�һ������
    guidata(hObject,handles);%���浱ǰ�����е����о��
end

% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,filterindex] = uiputfile({'*.jpg','JPEG(*.jpg)';...
    '*.bmp','Bitmap(*.bmp)';'*.gif','GIF(*.gif)';'*.*',  ...
    'All Files (*.*)'},'����ͼƬ',...
    'C:\Users\Administrator\Desktop\image');  
 if(filterindex==0)%filterindexΪѡ�����Ľ����ѡ����Ϊ1����֮Ϊ0
    return
 else
    h=getframe(handles.axesright);%getframe���ڲ���ǰͼ�ζ����еĻ���
    imwrite(h.cdata,[PathName,FileName]);%cdata���԰���ͼ���������
 end
 
 % --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
close(gcf); %�رյ�ǰFigure���ھ��


 % --------------------------------------------------------------------
function lvbo_Callback(hObject, eventdata, handles)
% hObject    handle to lvbo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 
%  set(handles.login_user, 'Enable', 'off', 'String', varargin{2});
%  set(handles.text3, 'String', '����ȷ�ϣ�');
%  set(handles.text4, 'Visible', 'off');
%  
global Z0
Z=handles.img;%����ԭʼ��������ͼ����Ϣ
   g=[1,4,6,4,1;   %�˲�����ÿһ�����ص��һ���˲�����
    4,16,4,16,4;
    6,24,36,24,6;
    4,16,24,16,4;
     1,4,6,4,1];
g=g/256;
Z0=imfilter(Z,g);%0�߶ȣ�����������������άͼ������˲� g=imfilter(f,w,filtering_mode,boundary_options,size_optinos) 
                % f������ͼ��wΪ�˲�ģ�壬gΪ�˲����
axes(handles.axesright);
imshow(Z0);%�˲���ĸ�ģ��һ�㣬���������Ϣ��ȥ
 handles.lvbo=Z0;%��ԭͼ��im����handles����е�һ������
 guidata(hObject,handles);%���浱ǰ�����е����о��
%  set(gcf, 'Name', 'ͼ���˲�');
%  set(handles.uipanelleft, 'Visible','on');
%  set(handles.uipanelright, 'Visible', 'on');
%  set(handles.import, 'Visible', 'off');
%  set(handles.save, 'Visible', 'on');
%  set(handles.open, 'Visible', 'on');
% --------------------------------------------------------------------
function caiyang_Callback(hObject, eventdata, handles)
% hObject    handle to caiyang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
return;

% --------------------------------------------------------------------
function caiyang_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to caiyang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
caiyang;
% --------------------------------------------------------------------
function chidu0_Callback(hObject, eventdata, handles)
% hObject    handle to chidu0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
Z0=imresize(Z0,[256,256]);
figure;%��ʾ0�߶�
imshow(Z0);


% --------------------------------------------------------------------
function chidu1_Callback(hObject, eventdata, handles)
% hObject    handle to chidu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 Z1
Z1=imresize(Z0,[128,128]);
figure;%��ʾ0�߶�
imshow(Z1);

% --------------------------------------------------------------------
function chidu2_Callback(hObject, eventdata, handles)
% hObject    handle to chidu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 Z2
Z2=imresize(Z0,[64,64]);
figure;%��ʾ0�߶�
imshow(Z2);

% --------------------------------------------------------------------
function chidu3_Callback(hObject, eventdata, handles)
% hObject    handle to chidu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 Z3
Z3=imresize(Z0,[32,32]);
figure;%��ʾ0�߶�
imshow(Z3);

% --------------------------------------------------------------------
function chidu4_Callback(hObject, eventdata, handles)
% hObject    handle to chidu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 Z4
Z4=imresize(Z0,[16,16]);
figure;%��ʾ0�߶�
imshow(Z4);

% --------------------------------------------------------------------
function chidu5_Callback(hObject, eventdata, handles)
% hObject    handle to chidu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 Z5
Z5=imresize(Z0,[8,8]);
figure;%��ʾ0�߶�
imshow(Z5);

% --------------------------------------------------------------------
function chidu6_Callback(hObject, eventdata, handles)
% hObject    handle to chidu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 Z6
Z6=imresize(Z0,[4,4]);
figure;%��ʾ0�߶�
imshow(Z6);

% --------------------------------------------------------------------
function chidu7_Callback(hObject, eventdata, handles)
% hObject    handle to chidu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 Z7
Z7=imresize(Z0,[2,2]);
figure;%��ʾ0�߶�
imshow(Z7);

% --------------------------------------------------------------------
function chidu8_Callback(hObject, eventdata, handles)
% hObject    handle to chidu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global Z0 Z8
Z8=imresize(Z0,[1,1]);
figure;%��ʾ0�߶�
imshow(Z8);

% --- Executes on button press in import.
function import_Callback(hObject, eventdata, handles)
% hObject    handle to import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% --------------------------------------------------------------------
function r_Callback(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global array_r array_g array_b Z0
[array_r,array_g,array_b]=getrgb(Z0);
axes(handles.axesright);
imshow(array_r);

% --------------------------------------------------------------------
function g_Callback(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global array_r array_g array_b Z0
[array_r,array_g,array_b]=getrgb(Z0);
axes(handles.axesright);
imshow(array_g);

% --------------------------------------------------------------------
function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global array_r array_g array_b Z0
[array_r,array_g,array_b]=getrgb(Z0);
axes(handles.axesright);
imshow(array_b);


% --- Executes on button press in light0.
function light0_Callback(hObject, eventdata, handles)
% hObject    handle to light0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 light0
if isempty(handles.img)
    return
else
light0 =rgb2gray(Z0);
axes(handles.axesright);
imshow(light0);
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 RG0 BY0
if isempty(handles.img)
    return
else
    [RG0,BY0]=getrg_by(Z0);
    axes(handles.axesright);
    value = get(handles.popupmenu1, 'value');
    switch value
        case 2
            imshow(uint8(RG0));      
        case 3        
            imshow(uint8(BY0));
       
    end 
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function RG_Callback(hObject, eventdata, handles)
% hObject    handle to RG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 RG0 BY0
if isempty(handles.img)
    return
else
    [RG0,BY0]=getrg_by(Z0);
    axes(handles.axesright);
   
            imshow(uint8(RG0));      
        
end 


% --------------------------------------------------------------------
function BY_Callback(hObject, eventdata, handles)
% hObject    handle to BY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 RG0 BY0
if isempty(handles.img)
    return
else
    [RG0,BY0]=getrg_by(Z0);
    axes(handles.axesright);       
            imshow(uint8(BY0));
       
   
end

% --- Executes on selection change in popupmenu__direct.
function popupmenu__direct_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu__direct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 direct00 direct45 direct90 direct135
if isempty(handles.img)
    return
else
    [direct00,direct45,direct90,direct135]=getdirection(Z0);
    axes(handles.axesright);
    value = get(handles.popupmenu__direct, 'value');
    switch value
        case 2
            imshow(direct00);      
        case 3        
             imshow(direct45);
        case 4
            imshow(direct90);      
        case 5        
             imshow(direct135);
       
    end 
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu__direct contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu__direct


% --- Executes during object creation, after setting all properties.
function popupmenu__direct_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu__direct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function direct00_Callback(hObject, eventdata, handles)
% hObject    handle to direct00 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 direct00 direct45 direct90 direct135
if isempty(handles.img)
    return
else
    [direct00,direct45,direct90,direct135]=getdirection(Z0);
    axes(handles.axesright);
    imshow(direct00);      
end

% --------------------------------------------------------------------
function direct45_Callback(hObject, eventdata, handles)
% hObject    handle to direct45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 direct00 direct45 direct90 direct135
if isempty(handles.img)
    return
else
    [direct00,direct45,direct90,direct135]=getdirection(Z0);
    axes(handles.axesright);       
    imshow(direct45);
end

% --------------------------------------------------------------------
function direct90_Callback(hObject, eventdata, handles)
% hObject    handle to direct90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 direct00 direct45 direct90 direct135
if isempty(handles.img)
    return
else
    [direct00,direct45,direct90,direct135]=getdirection(Z0);
    axes(handles.axesright);
    imshow(direct90);      
end

% --------------------------------------------------------------------
function direct135_Callback(hObject, eventdata, handles)
% hObject    handle to direct135 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 direct00 direct45 direct90 direct135
if isempty(handles.img)
    return
else
    [direct00,direct45,direct90,direct135]=getdirection(Z0);
    axes(handles.axesright);   
    imshow(direct135);
end

% --- Executes on button press in saliency.
function saliency_Callback(hObject, eventdata, handles)
% hObject    handle to saliency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.img)
    return
else
    final=getmap(handles.img);
     axes(handles.axesright);
     imshow(final);
end 


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 rg by color
if isempty(handles.img)
    return
else
     [rg,by,color]=tz_color(Z0);
     axes(handles.axesright);
     imshow(color);
end 


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 il00 il45 il90 il135 direction
if isempty(handles.img)
    return
else
    [il00,il45,il90,il135,direction]=tz_direct(Z0);
     axes(handles.axesright);
     imshow(direction);
end 

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 light
if isempty(handles.img)
    return
else
     light=tz_light(Z0);
     axes(handles.axesright);
     imshow(light);
end 

% --------------------------------------------------------------------
function light_contrast_Callback(hObject, eventdata, handles)
% hObject    handle to light_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 
if isempty(handles.img)
    return
else
     
      Z0=imresize(Z0,[256,256]);
      light0 =rgb2gray(Z0);
      light4=imresize(light0,[16,16]);
      light44=imresize(light4,[256,256]);
      direct=double(light0);
      light44=double(light44);
      light04=abs(direct-light44);
      light_norm04=normalizeImage(light04);
      light_norm04=double(light_norm04);
      axes(handles.axesright);
      imshow(light_norm04);
end 

% --------------------------------------------------------------------
function RG_contrast_Callback(hObject, eventdata, handles)
% hObject    handle to RG_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if isempty(handles.img)
    return
else
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
  RG0=imresize(RG0,[256,256]);
  RG4=imresize(RG0,[16,16]);
  RG44=imresize(RG4,[256,256]);
 
   RG04=abs(RG0-RG44);
   rg04=normalizeImage(RG04);
   rg04=double(rg04);
      axes(handles.axesright);
      imshow( rg04);
end 


% --------------------------------------------------------------------
function BY_contrast_Callback(hObject, eventdata, handles)
% hObject    handle to BY_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if isempty(handles.img)
    return
else
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
  BY0=imresize(BY0,[256,256]);
  BY4=imresize(BY0,[16,16]);
  BY44=imresize(BY4,[256,256]);
  BY04=abs(BY0-BY44);
   by04=normalizeImage(BY04);
   by04=double(by04);
   axes(handles.axesright);
      imshow(by04);
end 

% --------------------------------------------------------------------
function direct00_contrast_Callback(hObject, eventdata, handles)
% hObject    handle to direct00_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if isempty(handles.img)
    return
else
   Z0=imresize(Z0,[256,256]);
   light0 =rgb2gray(Z0); 
   direct=double(light0);
   direct00=mygaborfilter(direct,0);
   direct00_4=imresize(direct00,[16,16]);
   direct00_44=imresize(direct00_4,[256,256]);
   direct00_04=abs(direct00-direct00_44);
   direct_norm00_04=normalizeImage(direct00_04);
   direct_norm00_04=double(direct_norm00_04);
   axes(handles.axesright);
   imshow(direct_norm00_04);   
end 

% --------------------------------------------------------------------
function direct45_contrast_Callback(hObject, eventdata, handles)
% hObject    handle to direct45_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if isempty(handles.img)
    return
else
   Z0=imresize(Z0,[256,256]);
   light0 =rgb2gray(Z0); 
   direct=double(light0); 
  direct45=mygaborfilter(direct,45);
  direct45_4=imresize(direct45,[16,16]);
  direct45_44=imresize(direct45_4,[256,256]);
  direct45_04=abs(direct45-direct45_44);
  direct_norm45_04=normalizeImage(direct45_04);
  direct_norm45_04=double(direct_norm45_04);

   axes(handles.axesright);
   imshow(direct_norm45_04);   
end 

% --------------------------------------------------------------------
function direct90_contrast_Callback(hObject, eventdata, handles)
% hObject    handle to direct90_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if isempty(handles.img)
    return
else
   Z0=imresize(Z0,[256,256]);
   light0 =rgb2gray(Z0); 
   direct=double(light0); 
  direct90=mygaborfilter(direct,90);
  direct90_4=imresize(direct90,[16,16]);
  direct90_44=imresize(direct90_4,[256,256]);
  direct90_04=abs(direct90-direct90_44);
  direct_norm90_04=normalizeImage(direct90_04);
  direct_norm90_04=double(direct_norm90_04);

   axes(handles.axesright);
   imshow(direct_norm90_04);   
end 


% --------------------------------------------------------------------
function direct135_contrast_Callback(hObject, eventdata, handles)
% hObject    handle to direct135_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if isempty(handles.img)
    return
else
   Z0=imresize(Z0,[256,256]);
   light0 =rgb2gray(Z0); 
   direct=double(light0); 
  direct135=mygaborfilter(direct,135);
  direct135_4=imresize(direct135,[16,16]);
  direct135_44=imresize(direct135_4,[256,256]);
  direct135_04=abs(direct135-direct135_44);
  direct_norm135_04=normalizeImage(direct135_04);
  direct_norm135_04=double(direct_norm135_04);
   axes(handles.axesright);
   imshow(direct_norm135_04);   
end

% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function contrast_Callback(hObject, eventdata, handles)
% hObject    handle to contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
% main �����е����ݴ��� set_rgb_value ���򣻾��趨֮���ٴ��� main ����
% open('contrast.fig');
contrast;


% --------------------------------------------------------------------
function R_Callback(hObject, eventdata, handles)
% hObject    handle to R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 
if isempty(handles.img)
    return
else
        array_r=Z0(:,:,1);
        array_g=Z0(:,:,2);
        array_b=Z0(:,:,3);

     r=double(array_r);
     g=double(array_g);
     b=double(array_b);

         R=(r-((g+b)/2));
        axes(handles.axesright);
        imshow(uint8(R)); 

       
 
end
% --------------------------------------------------------------------
function G_Callback(hObject, eventdata, handles)
% hObject    handle to G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 
if isempty(handles.img)
    return
else
        array_r=Z0(:,:,1);
        array_g=Z0(:,:,2);
        array_b=Z0(:,:,3);

     r=double(array_r);
     g=double(array_g);
     b=double(array_b);

          G=(g-((r+b)/2));
        axes(handles.axesright);
        imshow(uint8(G)); 

       
 
end

% --------------------------------------------------------------------
function B_Callback(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 
if isempty(handles.img)
    return
else
        array_r=Z0(:,:,1);
        array_g=Z0(:,:,2);
        array_b=Z0(:,:,3);

     r=double(array_r);
     g=double(array_g);
     b=double(array_b);

         B=(b-((r+g)/2));
        axes(handles.axesright);
        imshow(uint8(B)); 

       
 
end

% --------------------------------------------------------------------
function Y_Callback(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 
if isempty(handles.img)
    return
else
        array_r=Z0(:,:,1);
        array_g=Z0(:,:,2);
        array_b=Z0(:,:,3);

     r=double(array_r);
     g=double(array_g);
     b=double(array_b);

          Y=((r+g)-(2*(abs(r-g)+b)));
        axes(handles.axesright);
        imshow(uint8(Y)); 

       
 
end

% --------------------------------------------------------------------
function yuanshi_yanse_Callback(hObject, eventdata, handles)
% hObject    handle to yuanshi_yanse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
return;


% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 light0
if isempty(handles.img)
    return
else
light0 =rgb2gray(Z0);
axes(handles.axesright);
imshow(light0);
end


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
return;


% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
return;


% --------------------------------------------------------------------
function Untitled_22_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 light
if isempty(handles.img)
    return
else
     light=tz_light(Z0);
     axes(handles.axesright);
     imshow(light);
end 

% --------------------------------------------------------------------
function Untitled_23_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 rg by color
if isempty(handles.img)
    return
else
     [rg,by,color]=tz_color(Z0);
     axes(handles.axesright);
     imshow(color);
end 


% --------------------------------------------------------------------
function Untitled_24_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0 il00 il45 il90 il135 direction
if isempty(handles.img)
    return
else
    [il00,il45,il90,il135,direction]=tz_direct(Z0);
     axes(handles.axesright);
     imshow(direction);
end 


% --------------------------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.img)
    return
else
    final=getmap(handles.img);
     axes(handles.axesright);
     imshow(final);
end 


% --------------------------------------------------------------------
function Untitled_20_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
return;


% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
return;
