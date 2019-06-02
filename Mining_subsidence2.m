function varargout = Mining_subsidence2(varargin)
% MINING_SUBSIDENCE2 MATLAB code for Mining_subsidence2.fig
%      MINING_SUBSIDENCE2, by itself, creates a new MINING_SUBSIDENCE2 or raises the existing
%      singleton*.
%
%      H = MINING_SUBSIDENCE2 returns the handle to a new MINING_SUBSIDENCE2 or the handle to
%      the existing singleton*.
%
%      MINING_SUBSIDENCE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINING_SUBSIDENCE2.M with the given input arguments.
%
%      MINING_SUBSIDENCE2('Property','Value',...) creates a new MINING_SUBSIDENCE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mining_subsidence2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mining_subsidence2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mining_subsidence2

% Last Modified by GUIDE v2.5 29-Jul-2016 23:06:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mining_subsidence2_OpeningFcn, ...
                   'gui_OutputFcn',  @Mining_subsidence2_OutputFcn, ...
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


% --- Executes just before Mining_subsidence2 is made visible.
function Mining_subsidence2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mining_subsidence2 (see VARARGIN)

% Choose default command line output for Mining_subsidence2
handles.output = hObject;

%--------------------BY WEI-------------------------%
% parameter = struct('q',{1.5},'b',{0.67},'b1',{0.72},'b2',{0.69},'tb',{1.9},'tb1',{2.1},'tb2',...
%     {1.8},'s1',{15},'s2',{15},'s3',{15},'s4',{15},'theta',{90},'m',{10},'alpha',{0},'H1',...
%     {100},'H2',{100},'D1',{100},'D3',{100});
% handles.parameter = parameter;
handles.parameter = varargin{1};
cdata = {};
handles.cdata = cdata;
%--------------------BY WEI-------------------------%

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Mining_subsidence2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mining_subsidence2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
[filename,pathname]=uigetfile('*.txt','导入数据');
    if isequal(filename,0) || isequal(pathname,0)
       return;
    else
        filefp=fullfile(pathname, filename);
    end
pos = load(filefp);
set(handles.popupmenu1,'string',num2str(pos));
handles.pos = pos;
guidata(hObject,handles);
%--------------------BY WEI-------------------------%

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

%--------------------BY WEI-------------------------%
val = get(hObject,'value');
set(handles.listbox1,'value',val);
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
fitting = @FittingFcn;
cdata = handles.cdata;
phi = str2double(get(handles.edit1,'string'));
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
set(handles.listbox1,'string',num2str(pdata));
handles.cdata = cdata;
guidata(hObject,handles);
%--------------------BY WEI-------------------------%

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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
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
[m,n] = size(handles.cdata)
for m = 1:m
    for n = 1:n
        fprintf(fid,'%d\t',handles.cdata{m,n});
    end
    fprintf(fid,'\n');
end
fclose(fid);
%--------------------BY WEI-------------------------%


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%--------------------BY WEI-------------------------%
handles.cdata =[];
set(handles.edit1,'string','0');
set(handles.popupmenu1,'string','0','value',1);
set(handles.listbox1,'string','');
guidata(hObject,handles);
%--------------------BY WEI-------------------------%
