function varargout = Mining_subsidence1(varargin)
% MINING_SUBSIDENCE1 MATLAB code for Mining_subsidence1.fig
%      MINING_SUBSIDENCE1, by itself, creates a new MINING_SUBSIDENCE1 or raises the existing
%      singleton*.
%
%      H = MINING_SUBSIDENCE1 returns the handle to a new MINING_SUBSIDENCE1 or the handle to
%      the existing singleton*.
%
%      MINING_SUBSIDENCE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINING_SUBSIDENCE1.M with the given input arguments.
%
%      MINING_SUBSIDENCE1('Property','Value',...) creates a new MINING_SUBSIDENCE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mining_subsidence1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mining_subsidence1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mining_subsidence1

% Last Modified by GUIDE v2.5 31-Jul-2016 16:00:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mining_subsidence1_OpeningFcn, ...
                   'gui_OutputFcn',  @Mining_subsidence1_OutputFcn, ...
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


% --- Executes just before Mining_subsidence1 is made visible.
function Mining_subsidence1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mining_subsidence1 (see VARARGIN)

% Choose default command line output for Mining_subsidence1
handles.output = hObject;

%--------------------BY WEI-------------------------%
% parameter = struct('q',{1.5},'b',{0.67},'b1',{0.72},'b2',{0.69},'tb',{1.9},'tb1',{2.1},'tb2',...
%     {1.8},'s1',{15},'s2',{15},'s3',{15},'s4',{15},'theta',{90},'m',{10},'alpha',{0},'H1',...
%     {100},'H2',{100},'D1',{100},'D3',{100});
% handles.parameter = parameter;
handles.parameter = varargin{1};
cou = 1;
cdata2 = {};
handles.cou = cou;
handles.cdata2 = cdata2;
set(handles.uipanel3,'visible','off');
set(handles.uipanel4,'visible','off');
set(gcf,'position',[100 20 95.5 26]);
set(handles.uipanel2,'position',[1.8 23.254 46.4 2.6923]);
set(handles.uipanel1,'position',[1.8 0.4953 92.2 22.7692]);
%     set(handles.uipanel1,'visible','off');
%     set(gcf,'position',[100 20 95.5 26]);
%     set(handles.uipanel2,'position',[1.8 23.254 46.4 2.6923]);
%     set(handles.uipanel3,'position',[1.8 0.4953 92.2 22.7692]);
%--------------------BY WEI-------------------------%  

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Mining_subsidence1 wait for user response (see UIRESUME)
%uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mining_subsidence1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%--------------------BY WEI-------------------------%
uicontrol(handles.edit1);
%--------------------BY WEI-------------------------%


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
    x1 = str2double(get(handles.edit1,'string'));  %x1
    y1 = str2double(get(handles.edit2,'string'));  %y1
    x2 = str2double(get(handles.edit3,'string'));  %x2
    y2 = str2double(get(handles.edit4,'string'));  %y2
    phi = str2double(get(handles.edit5,'string'));
    st = str2double(get(handles.edit6,'string'));
    if isnan(x1) || isnan(x2) || isnan(y1) || isnan(y2) || isnan(st)
        errordlg('参数输入错误','警告');
        return;
    end
    xx = x2-x1;
    yy = y2-y1;
    dis = sqrt(xx^2+yy^2)
    lc = xx/dis;
    ls = yy/dis;
    cdata = cell(1,8);
    fitting = @FittingFcn;
    N=1;
    for d = 0:st:dis
        cdata{N,1} = x1+N*st*lc;
        cdata{N,2} = y1+N*st*ls;
        cdata{N,3} = phi;
       [W,U,I,K,E] = fitting(cdata{N,1},cdata{N,2},handles.parameter,...
           cdata{N,3}); 
       cdata{N,4} = W;
       cdata{N,5} = U;
       cdata{N,6} = I;
       cdata{N,7} = K;
       cdata{N,8} = E;
       N = N+1;
    end
pdata = cell2mat(cdata);
assignin('base','c',pdata);
set(handles.listbox1,'string',num2str(pdata));
handles.cdata1 = cdata;
guidata(hObject,handles);
%--------------------BY WEI-------------------------%

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%--------------------BY WEI-------------------------%
[filename,pathname] = uiputfile('*.txt','保存数据','Untitled.txt');
if filename == 0
    return;  %如果取消操作，返回
else
    str=[pathname filename]; 
end
fid=fopen(str,'wt');
[m,n] = size(handles.cdata1);
for m = 1:m
    for n = 1:n
        fprintf(fid,'%d\t',handles.cdata1{m,n});
    end
    fprintf(fid,'\n');
end
fclose(fid);
%--------------------BY WEI-------------------------%

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
handles.cdata1 =[];
handles.cou1 = 1;
set(handles.edit1,'string','');
set(handles.edit2,'string','');
set(handles.edit3,'string','');
set(handles.edit4,'string','');
set(handles.edit5,'string','0');
set(handles.edit6,'string','10');
set(handles.listbox1,'string','');
guidata(hObject,handles);

%--------------------BY WEI-------------------------%

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
fitting = @FittingFcn;
cou = handles.cou;
cdata = handles.cdata2;
cdata{cou,1} = str2double(get(handles.edit9,'string'));
cdata{cou,2} = str2double(get(handles.edit10,'string'));
cdata{cou,3} = str2double(get(handles.edit11,'string'));
if isnan(cdata{cou,1}) || isnan(cdata{cou,2})...
        || isnan(cdata{cou,3})
    %错误对话框
    errordlg('参数输入错误','警告');
    return
end
%进行单点计算
% if isempty(get(handles.edit4,'string')) || isempty(get(handles.edit5,'string'))
    if cou == 1    
        [W,U,I,K,E] = fitting(cdata{cou,1},cdata{cou,2},handles.parameter,...
            cdata{cou,3});
        cdata{cou,4} = W;
        cdata{cou,5} = U;
        cdata{cou,6} = I;
        cdata{cou,7} = K;
        cdata{cou,8} = E;
        pdata = cell2mat(cdata);
        set(handles.listbox2,'string',num2str(pdata));
        set(handles.popupmenu1,'string',num2str(pdata(:,1:3)));
        cou = cou + 1;
    else
        s = size(cdata);
        n=zeros(s(1));
        for mi = 1:s(1)-1
            n(mi) = isequal(cdata(mi,1:3),cdata(s(1),1:3));
        end
        if sum(n) == 0   
            [W,U,I,K,E] = fitting(cdata{cou,1},cdata{cou,2},handles.parameter,...
                cdata{cou,3});
            cdata{cou,4} = W;
            cdata{cou,5} = U;
            cdata{cou,6} = I;
            cdata{cou,7} = K;
            cdata{cou,8} = E;
            pdata = cell2mat(cdata);
            set(handles.listbox2,'string',num2str(pdata));
            set(handles.popupmenu1,'string',num2str(pdata(:,1:3)));
            cou = cou + 1;
        end
    end
handles.cou = cou;
handles.cdata2 = cdata;
guidata(hObject,handles);
% else    %进行线计算
%     x1 = str2double(get(handles.edit1,'string'));  %x1
%     y1 = str2double(get(handles.edit2,'string'));  %y1
%     x2 = str2double(get(handles.edit4,'string'));  %x2
%     y2 = str2double(get(handles.edit5,'string'));  %y2
%     st = str2double(get(handles.edit6,'string'));
%     phi = str2double(get(handles.edit3,'string'));
%     if isnan(x1) || isnan(x2) || isnan(y1) || isnan(y2) || isnan(st)
%         errordlg('参数输入错误','警告');
%         return;
%     end
%     xx = x2-x1;
%     yy = y2-y1;
%     dis = sqrt(xx^2+yy^2);
%     lc = xx/dis;
%     ls = yy/dis;
%     N=0;
%     cou = 1;
%     for d = 0:st:dis
%         cdata{cou,1} = x1+N*st*lc;
%         cdata{cou,2} = y1+N*st*ls;
%         cdata{cou,3} = phi;
%        [W,U,I,K,E] = fitting(cdata{cou,1},cdata{cou,2},handles.parameter,...
%            cdata{cou,3}); 
%        cdata{cou,4} = W;
%        cdata{cou,5} = U;
%        cdata{cou,6} = I;
%        cdata{cou,7} = K;
%        cdata{cou,8} = E;
%        cou = cou+1;
%        N = N+1;
%     end
%     pdata = cell2mat(cdata);
%      assignin('base','c',pdata);
%     set(handles.listbox1,'string',num2str(pdata));
% end
%--------------------BY WEI-------------------------%

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.cdata2 =[];
handles.cou2 = 1;
set(handles.edit9,'string','');
set(handles.edit10,'string','');
set(handles.edit11,'string','0');
set(handles.popupmenu1,'string',' ','value',1);
set(handles.listbox1,'string','');
guidata(hObject,handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
[filename,pathname]=uigetfile('*.txt','导入数据');
    if isequal(filename,0) || isequal(pathname,0)
       return;
    else
        filefp=fullfile(pathname, filename);
    end
set(handles.listbox3,'string','');
handles.cdata3 =[];
pos = load(filefp);
set(handles.popupmenu2,'string',num2str(pos));
handles.pos = pos;
guidata(hObject,handles);
%--------------------BY WEI-------------------------%

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
fitting = @FittingFcn;
cdata = handles.cdata3;
phi = str2double(get(handles.edit12,'string'));
[m,n] = size(handles.pos);
for m = 1:m
    cdata{m,1} = handles.pos(m,1);
    cdata{m,2} = handles.pos(m,2);
    [W,U,I,K,E] = fitting(cdata{m,1},cdata{m,2},handles.parameter,phi);
    cdata{m,3} = phi;
    cdata{m,4} = W;
    cdata{m,5} = U;
    cdata{m,6} = I;
    cdata{m,7} = K;
    cdata{m,8} = E;
end
pdata = cell2mat(cdata);
set(handles.listbox3,'string',num2str(pdata));
handles.cdata3 = cdata;
guidata(hObject,handles);
%--------------------BY WEI-------------------------%

% --- Executes on button press in pushbutton5.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
[filename,pathname] = uiputfile('*.txt','保存数据','Untitled.txt');
if filename == 0
    return  %如果取消操作，返回
else
    str=[pathname filename]; 
end
fid=fopen(str,'wt');
[m,n] = size(handles.cdata3);
for m = 1:m
    for n = 1:n
        fprintf(fid,'%d\t',handles.cdata3{m,n});
    end
    fprintf(fid,'\n');
end
fclose(fid);
%--------------------BY WEI-------------------------%

% --- Executes on button press in pushbutton6.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
handles.cdata3 =[];
set(handles.edit12,'string','0');
set(handles.popupmenu2,'string',' ','value',1);
set(handles.listbox3,'string','');
guidata(hObject,handles);
%--------------------BY WEI-------------------------%

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on edit1 and none of its controls.
function edit1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit2);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit2 and none of its controls.
function edit2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit3);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit3 and none of its controls.
function edit3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.pushbutton1);
end
%--------------------BY WEI-------------------------%



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(handles.radiobutton1,'value')
    set(handles.uipanel1,'visible','on');
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel4,'visible','off');
%     set(gcf,'position',[100 20 95.5 26]);
    set(handles.uipanel2,'position',[1.8 23.254 46.4 2.6923]);
    set(handles.uipanel1,'position',[1.8 0.4953 92.2 22.7692]);
elseif get(handles.radiobutton2,'value')
    set(handles.uipanel1,'visible','off');
    set(handles.uipanel3,'visible','on');
    set(handles.uipanel4,'visible','off');
%     set(gcf,'position',[100 20 95.5 26]);
    set(handles.uipanel2,'position',[1.8 23.254 46.4 2.6923]);
    set(handles.uipanel3,'position',[1.8 0.4953 92.2 22.7692]);
elseif get(handles.radiobutton3,'value')
    set(handles.uipanel1,'visible','off');
    set(handles.uipanel3,'visible','off');
    set(handles.uipanel4,'visible','on');
%     set(gcf,'position',[100 20 95.5 26]);
    set(handles.uipanel2,'position',[1.8 23.254 46.4 2.6923]);
    set(handles.uipanel4,'position',[1.8 0.4953 92.2 22.7692]);
end
%--------------------BY WEI-------------------------%


function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

%--------------------BY WEI-------------------------%
val = get(hObject,'value');
set(handles.listbox2,'value',val);
%--------------------BY WEI-------------------------%

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

%--------------------BY WEI-------------------------%
val = get(hObject,'value');
set(handles.listbox3,'value',val);
%--------------------BY WEI-------------------------%

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


function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
