function varargout = caiyang(varargin)
% CAIYANG MATLAB code for caiyang.fig
%      CAIYANG, by itself, creates a new CAIYANG or raises the existing
%      singleton*.
%
%      H = CAIYANG returns the handle to a new CAIYANG or the handle to
%      the existing singleton*.
%
%      CAIYANG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAIYANG.M with the given input arguments.
%
%      CAIYANG('Property','Value',...) creates a new CAIYANG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before caiyang_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to caiyang_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help caiyang

% Last Modified by GUIDE v2.5 24-Apr-2019 21:19:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @caiyang_OpeningFcn, ...
                   'gui_OutputFcn',  @caiyang_OutputFcn, ...
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


% --- Executes just before caiyang is made visible.
function caiyang_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to caiyang (see VARARGIN)

% Choose default command line output for caiyang
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes caiyang wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = caiyang_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf); %关闭当前Figure窗口句柄


% --- Executes on button press in radiobutton0.
function radiobutton0_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if get(handles.radiobutton0,'Value')
Z0=imresize(Z0,[256,256]);
%axes(handles.axes1);
imshow(Z0);%显示0尺度
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton0


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if get(handles.radiobutton1,'Value')
Z1=imresize(Z0,[128,128]);
%axes(handles.axes1);
imshow(Z1);%显示0尺度
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if get(handles.radiobutton2,'Value')
Z2=imresize(Z0,[64,64]);
%axes(handles.axes1);
imshow(Z2);%显示0尺度
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if get(handles.radiobutton3,'Value')
Z3=imresize(Z0,[32,32]);
%axes(handles.axes1);
imshow(Z3);%显示0尺度
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if get(handles.radiobutton4,'Value')
Z4=imresize(Z0,[16,16]);
%axes(handles.axes1);
imshow(Z4);%显示0尺度
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Z0
if get(handles.radiobutton5,'Value')
Z5=imresize(Z0,[8,8]);
%axes(handles.axes1);
imshow(Z5);%显示0尺度

end
% Hint: get(hObject,'Value') returns toggle state of radiobutton5
