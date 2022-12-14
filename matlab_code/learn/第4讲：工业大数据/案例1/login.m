function varargout = login(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @login_OpeningFcn, ...
                   'gui_OutputFcn',  @login_OutputFcn, ...
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

function login_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
warning off all;
javaFrame = get(hObject, 'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('jida.jpg'));%icon1.jpg

if nargin == 3  %用于初始打开对话框
    %% 若被指文件不存在，创建一个
    if ~exist('login.mat', 'file')
        strName = 'jiangzenghui';
        strPassword = '123456';
        len = length(strName) + length(strPassword);
        userInfo.name = {char(strName + len)};
        userInfo.password = {char(strPassword + len)};
        userInfo.num = {0};
        userInfo.lastLogin = {0};
        userInfo.phone = {'17854172306'};
        %% 配置文件名为login.mat
        save login.mat userInfo;
    else
        load login.mat userInfo;
    end
    %% 将用户信息存入窗口的UserData中
    setappdata(hObject, 'userInfo', userInfo);
    %% 配置窗口控件
    set(handles.password, 'Enable', 'inactive');
    set(handles.text2, 'Visible', 'off');
    set(handles.newPassword, 'Visible', 'off');
    set(handles.text4, 'Visible', 'off');
    set(handles.phonenumber, 'Visible', 'off');
    %% 设置窗口模式标志
    set(hObject, 'UserData', 'login');
elseif nargin == 4  
    if strcmp(varargin{1}, 'userRegister')%用户注册窗口
        set(gcf, 'Name', '用户注册');
        set(handles.text3, 'String', '密码确认：');
        set(handles.btnlog, 'String', '注    册');
        set(handles.modifyPassword, 'Visible', 'off');
        set(handles.userregister, 'Visible', 'off');
        set(handles.usermanage, 'Visible', 'off');
        set(handles.password, 'Enable', 'on');
        %% 调整窗口大小
        pos = get(gcf, 'Position');
%         pos(3) = pos(3) - 80;  yuancanshu
        pos(3) = pos(3) - 80;
        set(gcf, 'Position', pos);
        %% 设置窗口模式标志
        set(hObject, 'UserData', 'userRegister');
        %% 将用户信息存入窗口的UserData中
        load login.mat userInfo;
        setappdata(hObject, 'userInfo', userInfo);
    elseif strcmp(varargin{1}, 'userManage')%用户管理窗口
        set(gcf, 'Name', '用户管理');
        load login.mat userInfo;
        setappdata(hObject, 'userInfo', userInfo);
        set(handles.modifyPassword, 'String', '保存修改');
        set(handles.userregister, 'Visible', 'off');
        set(handles.usermanage, 'Visible', 'off');
        users = userInfo.name;
        codes = userInfo.password;
        for i = 1 : length(users)
            users{i} = char(users{i} - length(users{i}) - length(codes{i}));
        end
        set(handles.login_user, 'String', users, 'Style', 'popupmenu');
        set(handles.text2, 'String', '登录次数：');
        set(handles.newPassword, 'Enable', 'inactive', 'String', num2str(userInfo.num{1}));
        set(handles.text3, 'String', '上次登录：');
        set(handles.password, 'Enable', 'inactive', 'String', num2str(userInfo.lastLogin{1}));
        set(handles.phonenumber, 'String', userInfo.phone{1});
        set(handles.btnlog, 'String', '删除账号');
        %% 设置窗口模式标志
        set(hObject, 'UserData', 'userManage');
    end
elseif nargin == 5 
    if strcmp(varargin{1}, 'newPassword')%修改密码窗口
        %% 将用户信息存入窗口的UserData中
        load login.mat userInfo;
        setappdata(hObject, 'userInfo', userInfo);
        %% 调整窗口大小
        pos = get(gcf, 'Position');
        pos(3) = pos(3) - 80;
        set(gcf, 'Position', pos);
        %% 控件设计
        set(gcf, 'Name', '修改密码');
        set(handles.login_user, 'Enable', 'off', 'String', varargin{2});
        set(handles.text3, 'String', '密码确认：');
        set(handles.text4, 'Visible', 'off');
        set(handles.phonenumber, 'Visible', 'off');
        set(handles.modifyPassword, 'Visible', 'off');
        set(handles.userregister, 'Visible', 'off');
        set(handles.usermanage, 'Visible', 'off');
        set(handles.btnlog, 'String', '确    认');
        set(handles.password, 'Enable', 'on');
        %% 设置窗口模式标志
        set(hObject, 'UserData', 'newPassword');
    end
end

guidata(hObject, handles);

function varargout = login_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function login_user_Callback(hObject, eventdata, handles)
if strcmp(get(gcf, 'UserData'), 'userManage')
    userInfo = getappdata(gcf, 'userInfo');
    index = get(hObject, 'Value');
    set(handles.newPassword, 'String', userInfo.num{index});
    set(handles.password, 'String', userInfo.lastLogin{index});
    set(handles.phonenumber, 'String', userInfo.phone{index});
end

function login_user_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject, 'BackgroundColor', 'white');
else
    set(hObject, 'BackgroundColor', get(0, 'defaultUicontrolBackgroundColor'));
end

function btnlog_Callback(hObject, eventdata, handles)    %不同界面确认键的功能
if strcmp(get(gcf, 'UserData'), 'login')                 %登录确认
    user = get(handles.login_user, 'string');
    password = get(handles.password, 'userdata');
    userTemp = char(user + length(user) + length(password));
    passwordTemp = char(password + length(user) + length(password));
    userInfo = getappdata(gcf, 'userInfo');
    users = userInfo.name;
    passwords = userInfo.password;
    index = find(strcmp(users,{userTemp}));
    if ~isempty(index) && isequal(passwords{index}, passwordTemp)
        userInfo.num{index} = userInfo.num{index} + 1;
        userInfo.lastLogin{index} = datestr(now, 31);
        save login.mat userInfo;
        h = msgbox('登陆成功！');
        uiwait(h);
        delete(gcf);
%        figure('name', '系统界面');
        Enter;
  %    welcome('Visible','on');%打开所调用的界   面，其中main是界面名称
    else
        errordlg('用户名或密码错误！', '错误提示');
        set(handles.password, 'string', '', 'userdata', '')
    end
elseif strcmp(get(gcf, 'UserData'), 'newPassword')         %修改密码确认
    password1 = get(handles.newPassword, 'UserData');
    password2 = get(handles.password, 'UserData');
 %%%%%%%%%%
  if ~isequal( password1, password2)
        errordlg('两次密码不相同，请重新输入！');
        set(handles.newPassword, 'String', '', 'UserData', []);
        set(handles.password, 'String', '', 'UserData', []);
        return;
    elseif length(password1) < 3
        errordlg('密码长度不得小于3，请重新输入！');
        set(handles.newPassword, 'String', '', 'UserData', []);
        set(handles.password, 'String', '', 'UserData', []);
        return;
%     end
 %%%%%%%
  elseif strcmp(password1, password2)
        user = get(handles.login_user, 'String');
       %% 更新密码
        userInfo = getappdata(gcf, 'userInfo');
        users = userInfo.name;
        codes = userInfo.password;
        for i = 1 : length(users)
            if isequal(users{i} - length(users{i}) - length(codes{i}), user)
                userInfo.name{i} = char(user + length(user) + length(password1));
                userInfo.password{i} = char(password1 + length(user) + length(password1));
                save login.mat userInfo;
                h = msgbox('密码修改成功，请重新登录！');
                uiwait(h);
                delete(gcf);
                login;
                break;
            end
        end
    end
elseif strcmp(get(gcf, 'UserData'), 'userRegister')            %用户注册确认
    userNew = get(handles.login_user, 'String');
    userInfo = getappdata(gcf, 'userInfo');
    users = userInfo.name;
    codes = userInfo.password;
    for i = 1 : length(users)
        if isequal(users{i} - length(users{i}) - length(codes{i}), userNew)
            errordlg('用户名已注册，请重新输入！');
            set(handles.login_user, 'String', '');
            return;
        end
    end
    codeNew1 = get(handles.newPassword, 'UserData');
    codeNew2 = get(handles.password, 'UserData');
    if ~isequal(codeNew1, codeNew2)
        errordlg('两次密码不相同，请重新输入！');
        set(handles.newPassword, 'String', '', 'UserData', []);
        set(handles.password, 'String', '', 'UserData', []);
        return;
    elseif length(codeNew1) < 3
        errordlg('密码长度不得小于3，请重新输入！');
        set(handles.newPassword, 'String', '', 'UserData', []);
        set(handles.password, 'String', '', 'UserData', []);
        return;
    end
    phoneNumber = get(handles.phonenumber, 'String');
    if (~all(isstrprop(phoneNumber, 'digit'))) || (length(phoneNumber) ~= 11) ...
            || (phoneNumber(1) ~= '1')
        errordlg('请输入有效的手机号！');
        set(handles.phonenumber, 'String', '');
        return;
    end
    userTemp = char(userNew + length(userNew) + length(codeNew1));
    codeTemp = char(codeNew1 + length(userNew) + length(codeNew1));
    userInfo.name = [userInfo.name userTemp];
    userInfo.password = [userInfo.password codeTemp];
    userInfo.num = [userInfo.num 0];
    userInfo.lastLogin = [userInfo.lastLogin '0'];
    userInfo.phone = [userInfo.phone phoneNumber];
    save login.mat userInfo;
    h = msgbox('用户注册成功，请重新登录！');
    uiwait(h);
    delete(gcf);
    login;
elseif strcmp(get(gcf, 'UserData'), 'userManage')      %用户管理确认
    userInfo = getappdata(gcf, 'userInfo');
    index = get(handles.login_user, 'Value');
    userInfo.name(index) = [];
    userInfo.password(index) = [];
    userInfo.num(index) = [];
    userInfo.lastLogin(index) = [];
    userInfo.phone(index) = [];
    save login.mat userInfo;
    setappdata(gcf, 'userInfo', userInfo);
    str = get(handles.login_user, 'String');
    if ischar(str)
        set(handles.login_user, 'Value', 1, 'String', ' ');
        set(handles.newPassword, 'String', '');
        set(handles.password, 'String', '');
        set(handles.phonenumber, 'String', '');
    else
        str(index) = [];
        if index > 1
            index = index - 1;
        end
        set(handles.login_user, 'Value', index, 'String', str);
        set(handles.newPassword, 'String', num2str(userInfo.num{index}));
        set(handles.password, 'String', userInfo.lastLogin{index});
        set(handles.phonenumber, 'String', userInfo.phone{index});
    end
end

function btnlog_KeyPressFcn(hObject, eventdata, handles)
if double(eventdata.Character) == 13
    btnlog_Callback(handles.btnlog, eventdata, handles);
else%if isstrprop(eventdata.Character, 'graphic')
    figure1_KeyPressFcn(gcf, eventdata, handles);
end

function password_ButtonDownFcn(hObject, eventdata, handles)

function password_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function password_KeyPressFcn(hObject, eventdata, handles)
if strcmp(get(gcf, 'UserData'), 'newPassword') || ...
        strcmp(get(gcf, 'UserData'), 'userRegister')
    if double(eventdata.Character) == 13
        btnlog_Callback(handles.btnlog, eventdata, handles);
    else
        newPassword_KeyPressFcn(hObject, eventdata, handles);
    end
end

function modifyPassword_Callback(hObject, eventdata, handles)
if strcmp(get(gcf, 'UserData'), 'login')
    user = get(handles.login_user, 'string');
    password = get(handles.password, 'userdata');
    userTemp = char(user + length(user) + length(password));
    passwordTemp = char(password + length(user) + length(password));
    userInfo = getappdata(gcf, 'userInfo');
    users = userInfo.name;
    passwords = userInfo.password;
    n = find(strcmp(users,{userTemp}));
    if ~isempty(n) && isequal(passwords{n}, passwordTemp)
        close(gcf);
        login('newPassword', user);
    else
        errordlg('用户名或密码错误！', '错误提示');
        set(handles.password, 'string', '', 'userdata', '')
    end
elseif strcmp(get(gcf, 'UserData'), 'userManage')
    %% 【保存修改】按钮  
    phoneNumber = get(handles.phonenumber, 'String');
    if (~all(isstrprop(phoneNumber, 'digit'))) || (length(phoneNumber) ~= 11) ...
            || (phoneNumber(1) ~= '1')
        errordlg('请输入有效的手机号！');
        set(handles.phonenumber, 'String', '');
        return;
    end
    userInfo = getappdata(gcf, 'userInfo');
    index = get(handles.login_user, 'Value');
    userInfo.phone{index} = phoneNumber;
    setappdata(gcf, 'userInfo', userInfo);
    save login.mat userInfo;
    h = msgbox('手机号修改成功！');
    uiwait(h);
end

function pushbutton6_Callback(hObject, eventdata, handles)
close(gcf);

function newPassword_Callback(hObject, eventdata, handles)

function text2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function userregister_Callback(hObject, eventdata, handles)
close(gcf);
login('userRegister');

function usermanage_Callback(hObject, eventdata, handles)
if strcmp(get(gcf, 'UserData'), 'login')
    user = get(handles.login_user, 'String');
    code = get(handles.password, 'UserData');
    if strcmp(user, 'admin') && strcmp(code, 'admin')
        close(gcf);
        login('userManage');
    else
        errordlg('管理员账号错误，请重新输入！');
        set(handles.login_user, 'String', '');
        set(handles.password, 'String', '', 'UserData', []);
    end
end

function phonenumber_Callback(hObject, eventdata, handles)
if strcmp(get(gcf, 'UserData'), 'userRegister')
    btnlog_Callback(handles.btnlog, eventdata, handles);
end

function phonenumber_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function figure1_KeyPressFcn(~, eventdata, handles)
if strcmp(get(gcf, 'UserData'), 'login')
    c = eventdata.Character;
    if isstrprop(c, 'graphic')
        set(handles.password, 'userdata', [get(handles.password, 'userdata') c],...
            'string', [get(handles.password, 'string') '*']);
    else
        val = double(c);
        if ~isempty(val)
            if val == 13
                btnlog_Callback(handles.btnlog, eventdata, handles);
            elseif  val == 8
                str = get(handles.password, 'userdata');
                if ~isempty(str)
                    str(end) = [];
                end
                set(handles.password, 'userdata', str);
                str2 = get(handles.password, 'string');
                if ~isempty(str2)
                    str2(end) = [];
                end
                set(handles.password, 'string', str2)
            end
        end
    end
end

function newPassword_KeyPressFcn(hObject, eventdata, handles)
if strcmp(get(gcf, 'UserData'), 'newPassword') || ...
        strcmp(get(gcf, 'UserData'), 'userRegister')
    c = eventdata.Character;
    if isstrprop(c, 'graphic')
        set(hObject, 'userdata', [get(hObject, 'userdata') c],...
            'string', [get(hObject, 'string') '*'])
    else
        val = double(c);
        if ~isempty(val) && val == 8
            str = get(hObject, 'userdata');
            if ~isempty(str)
                str(end) = [];
            end
            set(hObject, 'userdata', str);
            str2 = get(hObject, 'string');
            if ~isempty(str2)
                str2(end) = [];
            end
            set(hObject, 'string', str2);
        end
    end
end
