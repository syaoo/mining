function varargout = Mining_subsidence(varargin)
% MINING_SUBSIDENCE MATLAB code for Mining_subsidence.fig
%      MINING_SUBSIDENCE, by itself, creates a new MINING_SUBSIDENCE or raises the existing
%      singleton*.
%
%      H = MINING_SUBSIDENCE returns the handle to a new MINING_SUBSIDENCE or the handle to
%      the existing singleton*.
%
%      MINING_SUBSIDENCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINING_SUBSIDENCE.M with the given input arguments.
%
%      MINING_SUBSIDENCE('Property','Value',...) creates a new MINING_SUBSIDENCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mining_subsidence_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mining_subsidence_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mining_subsidence

% Last Modified by GUIDE v2.5 30-Jul-2016 21:36:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mining_subsidence_OpeningFcn, ...
                   'gui_OutputFcn',  @Mining_subsidence_OutputFcn, ...
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


% --- Executes just before Mining_subsidence is made visible.
function Mining_subsidence_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mining_subsidence (see VARARGIN)

%--------------------BY WEI-------------------------%

%--------------------BY WEI-------------------------%

% Choose default command line output for Mining_subsidence
handles.output = hObject;
parameter = struct('q',{},'b',{},'b1',{},'b2',{},'tb',{},'tb1',{},'tb2',...
    {},'s1',{},'s2',{},'s3',{},'s4',{},'theta',{},'m',{},'alpha',{},'H1',...
    {},'H2',{},'D1',{},'D3',{});
handles.parameter = parameter;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Mining_subsidence wait for user response (see UIRESUME)
%uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mining_subsidence_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%--------------------BY WEI-------------------------%
% [X,Y] = meshgrid(0:1:1, 0:1:1);
% surf(handles.axes1,X,Y,[1,1;1,0]);
uicontrol(handles.pushbutton1);
%--------------------BY WEI-------------------------%

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% aa=get(hObject,'string')
% guidata(hObject, handles);

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
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','下沉系数','string','');
%--------------------BY WEI-------------------------%

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
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','走向方向水平移动系数','string','');
%--------------------BY WEI-------------------------%


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
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','下山方向水平移动系数','string','');
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
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','上山方向水平移动系数','string','');
%--------------------BY WEI-------------------------%


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
%--------------------BY WEI-------------------------%
%Prediction.tb = str2double(get(handles.edit5,'String'));
set(hObject,'TooltipString','主要影响正切角','string','');
%--------------------BY WEI-------------------------%
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
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','下山方向主要影响正切角','string','');
%--------------------BY WEI-------------------------%

function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','上山方向主要影响正切角','string','');
%--------------------BY WEI-------------------------%

function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','下山拐点偏移距','string','');
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
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','上山拐点偏移距','string','');
%--------------------BY WEI-------------------------%

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
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','走向左拐点偏移距','string','');
%--------------------BY WEI-------------------------%
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
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','走向右拐点偏移距','string','');
%--------------------BY WEI-------------------------%

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
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','开采影响传播角','string','');
%--------------------BY WEI-------------------------%

function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','煤层开采厚度','string','');
%--------------------BY WEI-------------------------%

function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','煤层倾角','string','');
%--------------------BY WEI-------------------------%

function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','下山边界采深','string','');
%--------------------BY WEI-------------------------%

function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','上山边界采深','string','');
%--------------------BY WEI-------------------------%
function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','走向开采宽度','string','');
%--------------------BY WEI-------------------------%

function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double



% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%--------------------BY WEI-------------------------%
set(hObject,'TooltipString','倾向开采宽度','string','');
%--------------------BY WEI-------------------------%

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
[filename,pathname]=uigetfile('*.txt','导入数据');
    if isequal(filename,0) || isequal(pathname,0)
       return
    else
        filefp=fullfile(pathname, filename);
    end
date=load(filefp);
set(handles.edit1,'string',num2str(date(1)));
set(handles.edit2,'string',num2str(date(2)));
set(handles.edit3,'string',num2str(date(3)));
set(handles.edit4,'string',num2str(date(4)));
set(handles.edit5,'string',num2str(date(5)));
set(handles.edit6,'string',num2str(date(6)));
set(handles.edit7,'string',num2str(date(7)));
set(handles.edit8,'string',num2str(date(8)));
set(handles.edit9,'string',num2str(date(9)));
set(handles.edit10,'string',num2str(date(10)));
set(handles.edit11,'string',num2str(date(11)));
set(handles.edit12,'string',num2str(date(12)));
set(handles.edit13,'string',num2str(date(13)));
set(handles.edit14,'string',num2str(date(14)));
set(handles.edit15,'string',num2str(date(15)));
set(handles.edit16,'string',num2str(date(16)));
set(handles.edit17,'string',num2str(date(17)));
set(handles.edit18,'string',num2str(date(18)));

%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    [filename,pathname]=uigetfile('*.txt','导入数据');
    if isequal(filename,0) || isequal(pathname,0)
       return
    else
        filefp=fullfile(pathname, filename);
    end
    date=load(filefp);
    set(handles.edit1,'string',num2str(date(1)));
    set(handles.edit2,'string',num2str(date(2)));
    set(handles.edit3,'string',num2str(date(3)));
    set(handles.edit4,'string',num2str(date(4)));
    set(handles.edit5,'string',num2str(date(5)));
    set(handles.edit6,'string',num2str(date(6)));
    set(handles.edit7,'string',num2str(date(7)));
    set(handles.edit8,'string',num2str(date(8)));
    set(handles.edit9,'string',num2str(date(9)));
    set(handles.edit10,'string',num2str(date(10)));
    set(handles.edit11,'string',num2str(date(11)));
    set(handles.edit12,'string',num2str(date(12)));
    set(handles.edit13,'string',num2str(date(13)));
    set(handles.edit14,'string',num2str(date(14)));
    set(handles.edit15,'string',num2str(date(15)));
    set(handles.edit16,'string',num2str(date(16)));
    set(handles.edit17,'string',num2str(date(17)));
    set(handles.edit18,'string',num2str(date(18)));
elseif  get(gcf,'CurrentCharacter')~=37;
        uicontrol(handles.edit1);
end
%--------------------BY WEI-------------------------%

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%--------------------BY WEI-------------------------%
% Prediction = struct('q',{},'b',{},'b1',{},'b2',{},'tb',{},'tb1',{}...
%                       ,'tb2',{},'s1',{},'s2',{},'s3',{},'s4',{},'theta',{})
% Coal = struct('m',{},'alpha',{},'H1',{},'H2',{},'D1',{},'D3',{})
parameter.q = str2double(get(handles.edit1,'String'));
parameter.b = str2double(get(handles.edit2,'String'));
parameter.b1 = str2double(get(handles.edit3,'String'));
parameter.b2 = str2double(get(handles.edit4,'String'));
parameter.tb = str2double(get(handles.edit5,'String'));
parameter.tb1 = str2double(get(handles.edit6,'String'));
parameter.tb2 = str2double(get(handles.edit7,'String'));
parameter.s1 = str2double(get(handles.edit8,'String'));
parameter.s2 = str2double(get(handles.edit9,'String'));
parameter.s3 = str2double(get(handles.edit10,'String'));
parameter.s4 = str2double(get(handles.edit11,'String'));
parameter.theta = str2double(get(handles.edit12,'String'));
parameter.m = str2double(get(handles.edit13,'String'));
parameter.alpha = str2double(get(handles.edit14,'String'));
parameter.H1 = str2double(get(handles.edit15,'String'));
parameter.H2 = str2double(get(handles.edit16,'String'));
parameter.D3 = str2double(get(handles.edit17,'String'));
parameter.D1 = str2double(get(handles.edit18,'String'));
if isnan(parameter.q) || isnan(parameter.b) || isnan(parameter.b1) || ...
    isnan(parameter.b2)  || isnan(parameter.tb) || isnan(parameter.tb1)...
    || isnan(parameter.b2) || isnan(parameter.s1) || isnan(parameter.s2)...
    || isnan(parameter.s3) || isnan(parameter.s4) || isnan(parameter.theta)...
    || isnan(parameter.m) || isnan(parameter.alpha) || isnan(parameter.H1)...
    || isnan(parameter.H1) || isnan(parameter.H2) || isnan(parameter.D1) || isnan(parameter.D3)
    %错误对话框
    errordlg('参数输入错误','警告');
    return
end
fitting = @FittingFcn;
H = (parameter .H1 +parameter .H1)/2;   %H为走向主断面开采平均深度
r = H/parameter .tb;    %r为主要影响半径
Sub = zeros(2);
step = str2double(get(handles.edit21,'String'));
m=1;
for y = -1.5*r:step:round(parameter.D1)+1.5*r
    n=1;
    for x = -1.5*r:step:round(parameter.D3)+1.5*r
        Sub(m,n) = fitting(x,y,parameter);
        n=n+1;
    end
    m=m+1;
end
assignin('base','s',Sub);
cla;
[Y,X] = meshgrid(-1.5*r:step:round(parameter.D3)+1.5*r,-1.5*r:step:round(parameter.D1)+1.5*r);
handles.parameter = parameter;
handles.Sub = Sub;
handles.X = X;
handles.Y = Y;
surf(handles.axes1,X,Y,-Sub);
guidata(hObject, handles);
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on pushbutton2 and none of its controls.
function pushbutton2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
	parameter.q = str2double(get(handles.edit1,'String'));
    parameter.b = str2double(get(handles.edit2,'String'));
    parameter.b1 = str2double(get(handles.edit3,'String'));
    parameter.b2 = str2double(get(handles.edit4,'String'));
    parameter.tb = str2double(get(handles.edit5,'String'));
    parameter.tb1 = str2double(get(handles.edit6,'String'));
    parameter.tb2 = str2double(get(handles.edit7,'String'));
    parameter.s1 = str2double(get(handles.edit8,'String'));
    parameter.s2 = str2double(get(handles.edit9,'String'));
    parameter.s3 = str2double(get(handles.edit10,'String'));
    parameter.s4 = str2double(get(handles.edit11,'String'));
    parameter.theta = str2double(get(handles.edit12,'String'));
    parameter.m = str2double(get(handles.edit13,'String'));
    parameter.alpha = str2double(get(handles.edit14,'String'));
    parameter.H1 = str2double(get(handles.edit15,'String'));
    parameter.H2 = str2double(get(handles.edit16,'String'));
    parameter.D3 = str2double(get(handles.edit17,'String'));
    parameter.D1 = str2double(get(handles.edit18,'String'));
    if isnan(parameter.q) || isnan(parameter.b) || isnan(parameter.b1) || ...
        isnan(parameter.b2)  || isnan(parameter.tb) || isnan(parameter.tb1)...
        || isnan(parameter.b2) || isnan(parameter.s1) || isnan(parameter.s2)...
        || isnan(parameter.s3) || isnan(parameter.s4) || isnan(parameter.theta)...
        || isnan(parameter.m) || isnan(parameter.alpha) || isnan(parameter.H1) || isnan(parameter.H1)...
        || isnan(parameter.H2) || isnan(parameter.D1) || isnan(parameter.D3)
        %错误对话框
        errordlg('参数输入错误','警告');
        return
    end
    fitting = @FittingFcn;
    H = (parameter .H1 +parameter .H1)/2;   %H为走向主断面开采平均深度
    r = H/parameter .tb;    %r为主要影响半径
    Sub = zeros(2);
    step = str2double(get(handles.edit21,'String'));
    m=1;
    for y = -1.5*r:step:round(parameter.D1)+1.5*r
        n=1;
        for x = -1.5*r:step:round(parameter.D3)+1.5*r
            [Sub(m,n),u(m,n),i(m,n),k(m,n),e(m,n)] = fitting(x,y,parameter);
            n=n+1;
        end
        m=m+1;
    end
    assignin('base','u',u);
    assignin('base','i',i);
    assignin('base','k',k);
    assignin('base','e',e);
    cla;
    [Y,X] = meshgrid(-1.5*r:step:round(parameter.D3)+1.5*r,-1.5*r:step:round(parameter.D1)+1.5*r);
    surf(handles.axes1,X,Y,-Sub);
    handles.Sub = Sub;
    handles.X = X;
    handles.Y = Y;
	guidata(hObject, handles);
end
%--------------------BY WEI-------------------------%


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
p=struct2cell(handles.parameter);
if isempty(p)
     msgbox('请计算后保存参数');
else
    [filename,pathname]=uiputfile('*.txt','保存参数','Untitled.txt');
    if filename==0
        return  %如果取消操作，返回
    else
        str=[pathname filename]; 
    end
        fid=fopen(str,'wt');
        [m,n] = size(p);
        for  m = 1:m
            fprintf(fid,'%d\n',p{m,n});
        end
        fclose(fid);
end
%--------------------BY WEI-------------------------%


% --- Executes on key press with focus on pushbutton3 and none of its controls.
function pushbutton3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    p=struct2cell(handles.parameter);
    if isempty(p)
         msgbox('请计算后保存参数');
    else
    [filename,pathname]=uiputfile('*.txt','保存参数','Untitled.txt');
    if filename==0
        return  %如果取消操作，返回
    else
        str=[pathname filename]; 
    end
        fid=fopen(str,'wt');
        [m,n] = size(p);
        for  m = 1:m
            fprintf(fid,'%d\n',p{m,n});
        end
        fclose(fid);
    end
end
%--------------------BY WEI-------------------------%



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
set(handles.edit1,'string','');
set(handles.edit2,'string','');
set(handles.edit3,'string','');
set(handles.edit4,'string','');
set(handles.edit5,'string','');
set(handles.edit6,'string','');
set(handles.edit7,'string','');
set(handles.edit8,'string','');
set(handles.edit9,'string','');
set(handles.edit10,'string','');
set(handles.edit11,'string','');
set(handles.edit12,'string','');
set(handles.edit13,'string','');
set(handles.edit14,'string','');
set(handles.edit15,'string','');
set(handles.edit16,'string','');
set(handles.edit17,'string','');
set(handles.edit18,'string','');
cla;
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on pushbutton4 and none of its controls.
function pushbutton4_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    set(handles.edit1,'string','');
    set(handles.edit2,'string','');
    set(handles.edit3,'string','');
    set(handles.edit4,'string','');
    set(handles.edit5,'string','');
    set(handles.edit6,'string','');
    set(handles.edit7,'string','');
    set(handles.edit8,'string','');
    set(handles.edit9,'string','');
    set(handles.edit10,'string','');
    set(handles.edit11,'string','');
    set(handles.edit12,'string','');
    set(handles.edit13,'string','');
    set(handles.edit14,'string','');
    set(handles.edit15,'string','');
    set(handles.edit16,'string','');
    set(handles.edit17,'string','');
    set(handles.edit18,'string','');
    cla;
end
%--------------------BY WEI-------------------------%

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
% --- Executes on key press with focus on edit4 and none of its controls.

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit4);
end
%--------------------BY WEI-------------------------%
function edit4_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit5);
end
%--------------------BY WEI-------------------------%


% --- Executes on key press with focus on edit5 and none of its controls.
function edit5_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit6);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit6 and none of its controls.
function edit6_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit7);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit7 and none of its controls.
function edit7_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit8);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit8 and none of its controls.
function edit8_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit9);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit9 and none of its controls.
function edit9_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit10);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit10 and none of its controls.
function edit10_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit11);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit11 and none of its controls.
function edit11_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit12);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit12 and none of its controls.
function edit12_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit13);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit13 and none of its controls.
function edit13_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit14);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit14 and none of its controls.
function edit14_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit15);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit15 and none of its controls.
function edit15_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit16);
end
%--------------------BY WEI-------------------------%


% --- Executes on key press with focus on edit16 and none of its controls.
function edit16_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit17);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit17 and none of its controls.
function edit17_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.edit18);
end
%--------------------BY WEI-------------------------%

% --- Executes on key press with focus on edit18 and none of its controls.
function edit18_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.pushbutton2);
end
%--------------------BY WEI-------------------------%

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% % hObject    handle to figure1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
    %set(gca,'UIContextMenu',handles.menu1);
    hlines = findall(handles.uipanel2,'Type','surf');
    for line = 1:length(hlines)
        set(hlines(line),'uicontextmenu',handles.menu1);
    end    
%--------------------BY WEI-------------------------%



%--------------------------------------------------------------------
% function menu1_ButtonDownFcn(hObject, eventdata, handles)
% % hObject    handle to menu1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % if strcmp(get(gcf,'Pointer'),'hand') % 鼠标已经设置为手的形状
% %     if strcmp(get(gco,'SelectionType'),'alt') % 如果响应的是右键点击
% %      pos=get(gco,'currentpoint');
% %      set(handles.menu1,'position',[pos(1,1) pos(1,2)],'visible','on')
% %     end
% % end
% % if strcmp(get(gcf,'SelectionType'),'alt') % 如果响应的是右键点击
% % 	pos=get(gca,'currentpoint');
%     set(handles.uipanel2,'UIContextMenu',hObject);
% 	%set(handles.menu1,'position',[pos(1,1) pos(1,2)],'visible','on')
% % end

% --------------------------------------------------------------------
function menu1_Callback(hObject, eventdata, handles)
% hObject    handle to menu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function sdata_Callback(hObject, eventdata, handles)
% hObject    handle to sdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function sdatas_Callback(hObject, eventdata, handles)
% hObject    handle to sdatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
p=struct2cell(handles.parameter);
if isempty(p)
     msgbox('请计算后查询');
else
    Mining_subsidence1(handles.parameter);
end
% uiwait(handles.figure1);
%--------------------BY WEI-------------------------%

% --------------------------------------------------------------------
function sdatam_Callback(hObject, eventdata, handles)
% hObject    handle to sdatam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
p=struct2cell(handles.parameter);
if isempty(p)
     msgbox('请计算后查询');
else
    Mining_subsidence2(handles.parameter);
end
% uiwait(handles.figure1);
%--------------------BY WEI-------------------------%

% --------------------------------------------------------------------
function smenu2_Callback(hObject, eventdata, handles)
% hObject    handle to smenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
[filename,pathname]=...
    uiputfile({'*.*';'*.bmp';'*.tif';'*.png'},'图形输出','Untitled.jpg');%存储图片路径
if filename==0
    return  %如果取消操作，返回
else
    str=[pathname filename];  
end
    f=getframe(handles.axes1);
    imwrite(f.cdata,str);  %写入图片信息，即保存图片
 %--------------------BY WEI-------------------------%

%--------------------------------------------------------------------
function smenu3_Callback(hObject, eventdata, handles)
% hObject    handle to smenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
%function uipanel2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%     hlines = findall(handles.uipanel2,'Type','surf');
%     for line = 1:length(hlines)
%     set(hlines(line),'uicontextmenu',handles.menu1);
%     end


% --------------------------------------------------------------------
function Sview_1_Callback(hObject, eventdata, handles)
% hObject    handle to Sview_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
view(3);

% --------------------------------------------------------------------
function Sview_2_Callback(hObject, eventdata, handles)
% hObject    handle to Sview_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
view(2);

% --------------------------------------------------------------------
function Sview_3_Callback(hObject, eventdata, handles)
% hObject    handle to Sview_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
view(0,0);

% --------------------------------------------------------------------
function Sview_4_Callback(hObject, eventdata, handles)
% hObject    handle to Sview_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
view(90,0);



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on key press with focus on edit21 and none of its controls.
function edit21_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

 %--------------------BY WEI-------------------------%
if get(gcf,'CurrentCharacter')==13
    uicontrol(handles.pushbutton2);
 %--------------------BY WEI-------------------------%
end

% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%     close Mining_subsidence1;
% return;
% 
%     close Mining_subsidence2;
% return;

close all;
