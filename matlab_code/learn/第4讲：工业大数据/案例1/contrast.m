function varargout = contrast(varargin)
% CONTRAST MATLAB code for contrast.fig
%      CONTRAST, by itself, creates a new CONTRAST or raises the existing
%      singleton*.
%
%      H = CONTRAST returns the handle to a new CONTRAST or the handle to
%      the existing singleton*.
%
%      CONTRAST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTRAST.M with the given input arguments.
%
%      CONTRAST('Property','Value',...) creates a new CONTRAST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before contrast_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to contrast_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help contrast

% Last Modified by GUIDE v2.5 13-May-2019 18:43:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @contrast_OpeningFcn, ...
                   'gui_OutputFcn',  @contrast_OutputFcn, ...
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


% --- Executes just before contrast is made visible.
function contrast_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to contrast (see VARARGIN)

% Choose default command line output for contrast
global Z Z0  
  Z=Z0;
if isempty(Z0)
    return;
else
Z0=imresize(Z0,[256,256]);
Z1=imresize(Z0,[128,128]);
Z2=imresize(Z0,[64,64]);
Z3=imresize(Z0,[32,32]);
Z4=imresize(Z0,[16,16]);
Z5=imresize(Z0,[8,8]);
Z6=imresize(Z0,[4,4]);
Z7=imresize(Z0,[2,2]);
Z8=imresize(Z0,[1,1]);
 axes(handles.axes0);
 imshow(Z0); 
%  set(gcf,'position',[left,bottem,width,height])
 axes(handles.axes1);
 imshow(Z1);     
  axes(handles.axes2);
%   set(gca,'position',[0.3655,0.4235,0.2689,0.4025]);
 imshow(Z2);     
 
  axes(handles.axes3);
 imshow(Z3);     
  axes(handles.axes4);
 imshow(Z4);     
  axes(handles.axes5);
 imshow(Z5);     
  axes(handles.axes6);
 imshow(Z6);     
  axes(handles.axes7);
 imshow(Z7);     
%  Z8=imresize(Z8,[256,256]);
  axes(handles.axes8);
 imshow(Z8);         
end;

handles.output = hObject;
% handles.output = Z0_pre;

% Update handles structure
guidata(hObject, handles);
% uiwait(handles.figure1);


% UIWAIT makes contrast wait for user response (see UIRESUME)



% --- Outputs from this function are returned to the command line.
function varargout = contrast_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%delete(handles.figure1);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
close(gcf); %关闭当前Figure窗口句柄
% uiresume(handles.figure1);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 注解：下拉列表选项，选中则在坐标轴上显示不同尺度的图像
global Z Z0

if isempty(Z0)
    return;
% elseif isequal(Z,Z0)
%     return;
else   
    value = get(handles.popupmenu1, 'value');
    switch value
        case 1
            return;
        case 2   %亮度
               Z0=imresize(Z0,[256,256]);
               light0 =rgb2gray(Z0);
               axes(handles.axes0);
               imshow(light0);
               light1=imresize(light0,[128,128]);
               axes(handles.axes1);
               imshow(light1);
               light2=imresize(light0,[64,64]);
               axes(handles.axes2);
               imshow(light2);
               light3=imresize(light0,[32,32]);
               axes(handles.axes3);
               imshow(light3);
               light4=imresize(light0,[16,16]);
               axes(handles.axes4);
               imshow(light4);
               light5=imresize(light0,[8,8]);
               axes(handles.axes5);
               imshow(light5);
               light6=imresize(light0,[4,4]);
               axes(handles.axes6);
               imshow(light6);
               light7=imresize(light0,[2,2]);
               axes(handles.axes7);
               imshow(light7);
               light8=imresize(light0,[1,1]);
               axes(handles.axes8);
               imshow(light8);
               a = findobj(handles.uipanel2,'style','checkbox');
                set(a,'Value',0);
   
        case 3        %RG
            Z0=imresize(Z0,[256,256]);
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
            axes(handles.axes0);
            imshow(uint8(RG0));
            RG1=imresize(RG0,[128,128]);
            axes(handles.axes1);
            imshow(uint8(RG1));
            RG2=imresize(RG0,[64,64]);
            axes(handles.axes2);
            imshow(uint8(RG2));
            RG3=imresize(RG0,[32,32]);
            axes(handles.axes3);
            imshow(uint8(RG3));
            RG4=imresize(RG0,[16,16]);
            axes(handles.axes4);
            imshow(uint8(RG4));
            RG5=imresize(RG0,[8,8]);
            axes(handles.axes5);
            imshow(uint8(RG5));
            RG6=imresize(RG0,[4,4]);
            axes(handles.axes6);
            imshow(uint8(RG6));
            RG7=imresize(RG0,[2,2]);
            axes(handles.axes7);
            imshow(uint8(RG7));
            RG8=imresize(RG0,[1,1]);
            axes(handles.axes8);
            imshow(uint8(RG8));
               a = findobj(handles.uipanel2,'style','checkbox');
                set(a,'Value',0);
              
        case 4       %BY
             Z0=imresize(Z0,[256,256]);
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
            axes(handles.axes0);
            imshow(uint8(BY0));
            BY1=imresize(BY0,[128,128]);
            axes(handles.axes1);
            imshow(uint8(BY1));
            BY2=imresize(BY0,[64,64]);
            axes(handles.axes2);
            imshow(uint8(BY2));
            BY3=imresize(BY0,[32,32]);
            axes(handles.axes3);
            imshow(uint8(BY3));
            BY4=imresize(BY0,[16,16]);
            axes(handles.axes4);
            imshow(uint8(BY4));
            BY5=imresize(BY0,[8,8]);
            axes(handles.axes5);
            imshow(uint8(BY5));
            BY6=imresize(BY0,[4,4]);
            axes(handles.axes6);
            imshow(uint8(BY6));
            BY7=imresize(BY0,[2,2]);
            axes(handles.axes7);
            imshow(uint8(BY7));
            BY8=imresize(BY0,[1,1]);
            axes(handles.axes8);
            imshow(uint8(BY8));
            a = findobj(handles.uipanel2,'style','checkbox');
            set(a,'Value',0);            
        case 5       %0度
             Z0=imresize(Z0,[256,256]);
              light0 =rgb2gray(Z0); 
            direct=double(light0);
            direct00=mygaborfilter(direct,0);
            axes(handles.axes0);
            imshow(direct00);
            direct00_1=imresize(direct00,[128,128]);
            axes(handles.axes1);
            imshow(direct00_1);
            direct00_2=imresize(direct00,[64,64]);
            axes(handles.axes2);
            imshow(direct00_2);
            direct00_3=imresize(direct00,[32,32]);
            axes(handles.axes3);
            imshow(direct00_3);
            direct00_4=imresize(direct00,[16,16]);
            axes(handles.axes4);
            imshow(direct00_4);
            direct00_5=imresize(direct00,[8,8]);
            axes(handles.axes5);
            imshow(direct00_5);
            direct00_6=imresize(direct00,[4,4]);
            axes(handles.axes6);
            imshow(direct00_6);
            direct00_7=imresize(direct00,[2,2]);
            axes(handles.axes7);
            imshow(direct00_7);
            direct00_8=imresize(direct00,[1,1]);
            axes(handles.axes8);
            imshow(direct00_8);
                a = findobj(handles.uipanel2,'style','checkbox');
                set(a,'Value',0);
        case 6       %45度
            Z0=imresize(Z0,[256,256]);
              light0 =rgb2gray(Z0); 
            direct=double(light0);
            direct45=mygaborfilter(direct,45);
            axes(handles.axes0);
            imshow(direct45);
            direct45_1=imresize(direct45,[128,128]);
            axes(handles.axes1);
            imshow(direct45_1);
            direct45_2=imresize(direct45,[64,64]);
            axes(handles.axes2);
            imshow(direct45_2);
            direct45_3=imresize(direct45,[32,32]);
            axes(handles.axes3);
            imshow(direct45_3);
            direct45_4=imresize(direct45,[16,16]);
            axes(handles.axes4);
            imshow(direct45_4);
            direct45_5=imresize(direct45,[8,8]);
            axes(handles.axes5);
            imshow(direct45_5);
            direct45_6=imresize(direct45,[4,4]);
            axes(handles.axes6);
            imshow(direct45_6);
            direct45_7=imresize(direct45,[2,2]);
            axes(handles.axes7);
            imshow(direct45_7);
            direct45_8=imresize(direct45,[1,1]);
            axes(handles.axes8);
            imshow(direct45_8);
               a = findobj(handles.uipanel2,'style','checkbox');
                set(a,'Value',0);
        case 7       %90度
            Z0=imresize(Z0,[256,256]);
              light0 =rgb2gray(Z0); 
            direct=double(light0);
            direct90=mygaborfilter(direct,90);
            axes(handles.axes0);
            imshow(direct90);
            direct90_1=imresize(direct90,[128,128]);
            axes(handles.axes1);
            imshow(direct90_1);
            direct90_2=imresize(direct90,[64,64]);
            axes(handles.axes2);
            imshow(direct90_2);
            direct90_3=imresize(direct90,[32,32]);
            axes(handles.axes3);
            imshow(direct90_3);
            direct90_4=imresize(direct90,[16,16]);
            axes(handles.axes4);
            imshow(direct90_4);
            direct90_5=imresize(direct90,[8,8]);
            axes(handles.axes5);
            imshow(direct90_5);
            direct90_6=imresize(direct90,[4,4]);
            axes(handles.axes6);
            imshow(direct90_6);
            direct90_7=imresize(direct90,[2,2]);
            axes(handles.axes7);
            imshow(direct90_7);
            direct90_8=imresize(direct90,[1,1]);
            axes(handles.axes8);
            imshow(direct90_8);
               a = findobj(handles.uipanel2,'style','checkbox');
                set(a,'Value',0);            
        case 8       %135度
%             axes(handles.axes20);
%             delete gca;
%             set(gca,'XColor','w') ;% 这两行代码功能：将坐标轴和坐标刻度转为白色
%             set(gca,'YColor','w');
            Z0=imresize(Z0,[256,256]);
              light0 =rgb2gray(Z0); 
            direct=double(light0);
            direct135=mygaborfilter(direct,135);
            axes(handles.axes0);
            imshow(direct135);
            direct135_1=imresize(direct135,[128,128]);
            axes(handles.axes1);
            imshow(direct135_1);
            direct135_2=imresize(direct135,[64,64]);
            axes(handles.axes2);
            imshow(direct135_2);
            direct135_3=imresize(direct135,[32,32]);
            axes(handles.axes3);
            imshow(direct135_3);
            direct135_4=imresize(direct135,[16,16]);
            axes(handles.axes4);
            imshow(direct135_4);
            direct135_5=imresize(direct135,[8,8]);
            axes(handles.axes5);
            imshow(direct135_5);
            direct135_6=imresize(direct135,[4,4]);
            axes(handles.axes6);
            imshow(direct135_6);
            direct135_7=imresize(direct135,[2,2]);
            axes(handles.axes7);
            imshow(direct135_7);
            direct135_8=imresize(direct135,[1,1]);
            axes(handles.axes8);
            imshow(direct135_8);
                a = findobj(handles.uipanel2,'style','checkbox');
                set(a,'Value',0);
            
        otherwise
            return;
       
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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i=0;
num=[10 10];
value = get(handles.popupmenu1, 'value');
switch value
    case 1
       return;
    case 2
        str = 'light';
    case 3
        str = 'RG';
    case 4
        str = 'BY';
    case 5
        str = 'direct0';
    case 6
        str = 'direct45';
    case 7
        str = 'direct90';
    case 8 
        str = 'direct135';
end
for counter = 0:8
        if get(handles.(['checkbox',num2str(counter)]),'Value')==1
         i=i+1;
         num(i)=counter;
         if i>=2
             i=0;
        
         end
        end
end
% disp(str);
% disp(num);
map=contrastmap(str,num);
axes(handles.axes20);
imshow(map);
% str = '';
% num=[10 10];

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,filterindex] = uiputfile({'*.jpg','JPEG(*.jpg)';...
    '*.bmp','Bitmap(*.bmp)';'*.gif','GIF(*.gif)';'*.*',  ...
    'All Files (*.*)'},'保存图片',...
    'C:\Users\Administrator\Desktop\image');  
 if(filterindex==0)%filterindex为选择与否的结果，选择则为1，反之为0
    return
 else
    h=getframe(handles.axes20);%getframe用于捕获当前图形对象中的画面
    imwrite(h.cdata,[PathName,FileName]);%cdata属性包含图像矩阵数据
 end













% --- Executes on button press in checkbox0.
function checkbox0_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag=0;
if   get(handles.checkbox0,'Value')~=1
     return;
else
    for counter = 0:8
        if get(handles.(['checkbox',num2str(counter)]),'Value')==1
         flag=flag+1;
        
         end
    end
      if flag<=2
            return;
         else
             errordlg('限制选择两项！', '错误提示');
             a = findobj(handles.uipanel2,'style','checkbox');
             set(a,'Value',0);
         end
end   
% Hint: get(hObject,'Value') returns toggle state of checkbox0


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag=0;
if   get(handles.checkbox1,'Value')~=1
     return;
else
    for counter = 0:8
        if get(handles.(['checkbox',num2str(counter)]),'Value')==1
         flag=flag+1;
        
         end
    end
      if flag<=2
            return;
         else
             errordlg('限制选择两项！', '错误提示');
             a = findobj(handles.uipanel2,'style','checkbox');
             set(a,'Value',0);
         end
end   
% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag=0;
if   get(handles.checkbox2,'Value')~=1
     return;
else
    for counter = 0:8
        if get(handles.(['checkbox',num2str(counter)]),'Value')==1
         flag=flag+1;
        
         end
    end
      if flag<=2
            return;
         else
             errordlg('限制选择两项！', '错误提示');
             a = findobj(handles.uipanel2,'style','checkbox');
             set(a,'Value',0);
         end
end   
% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag=0;
if   get(handles.checkbox3,'Value')~=1
     return;
else
    for counter = 0:8
        if get(handles.(['checkbox',num2str(counter)]),'Value')==1
         flag=flag+1;
        
         end
    end
      if flag<=2
            return;
         else
             errordlg('限制选择两项！', '错误提示');
             a = findobj(handles.uipanel2,'style','checkbox');
             set(a,'Value',0);
         end
end   
% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag=0;
if   get(handles.checkbox4,'Value')~=1
     return; 
else
    for counter = 0:8
        if get(handles.(['checkbox',num2str(counter)]),'Value')==1
         flag=flag+1;
        
         end
    end
      if flag<=2
            return;
         else
             errordlg('限制选择两项！', '错误提示');
             a = findobj(handles.uipanel2,'style','checkbox');
             set(a,'Value',0);
         end
end   
% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag=0;
if   get(handles.checkbox5,'Value')~=1
     return;
else
    for counter = 0:8
        if get(handles.(['checkbox',num2str(counter)]),'Value')==1
         flag=flag+1;
        
         end
    end
      if flag<=2
            return;
         else
             errordlg('限制选择两项！', '错误提示');
             a = findobj(handles.uipanel2,'style','checkbox');
             set(a,'Value',0);
         end
end   
% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag=0;
if   get(handles.checkbox6,'Value')~=1
     return;
else
    for counter = 0:8
        if get(handles.(['checkbox',num2str(counter)]),'Value')==1
         flag=flag+1;
        
         end
    end
      if flag<=2
            return;
         else
             errordlg('限制选择两项！', '错误提示');
             a = findobj(handles.uipanel2,'style','checkbox');
             set(a,'Value',0);
         end
end   
% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag=0;
if   get(handles.checkbox7,'Value')~=1
     return;
else
    for counter = 0:8
        if get(handles.(['checkbox',num2str(counter)]),'Value')==1
         flag=flag+1;
        
         end
    end
      if flag<=2
            return;
         else
             errordlg('限制选择两项！', '错误提示');
             a = findobj(handles.uipanel2,'style','checkbox');
             set(a,'Value',0);
         end
end   
% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag=0;
if   get(handles.checkbox8,'Value')~=1
     return;
else
    for counter = 0:8
        if get(handles.(['checkbox',num2str(counter)]),'Value')==1
         flag=flag+1;
        
         end
    end
      if flag<=2
            return;
         else
             errordlg('限制选择两项！', '错误提示');
             a = findobj(handles.uipanel2,'style','checkbox');
             set(a,'Value',0);
         end
end   
% Hint: get(hObject,'Value') returns toggle state of checkbox8
