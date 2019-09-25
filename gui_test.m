function varargout = gui_test(varargin)
% GUI_TEST MATLAB code for gui_test.fig
%      GUI_TEST, by itself, creates a new GUI_TEST or raises the existing
%      singleton*.
%
%      H = GUI_TEST returns the handle to a new GUI_TEST or the handle to
%      the existing singleton*.
%
%      GUI_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TEST.M with the given input arguments.
%
%      GUI_TEST('Property','Value',...) creates a new GUI_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_test

% Last Modified by GUIDE v2.5 01-Jul-2019 14:12:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_test_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_test_OutputFcn, ...
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


% --- Executes just before gui_test is made visible.
function gui_test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_test (see VARARGIN)

% Choose default command line output for gui_test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(gcf, 'ToolBar', 'figure');

% UIWAIT makes gui_test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function barspertextbox_Callback(hObject, eventdata, handles)
% hObject    handle to barspertextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of barspertextbox as text
%        str2double(get(hObject,'String')) returns contents of barspertextbox as a double
global mesh_scale;
set(handles.barspertextbox, 'int', mesh_scale);


% --- Executes during object creation, after setting all properties.
function barspertextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to barspertextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BrowseImages (IMAGE BROWSER).
function BrowseImages_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseImages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = uigetfile({'*.bmp'});
global gotdata;
gotdata = strcat(filename);
set(handles.dispfile, 'string', gotdata);




% --- Executes on slider movement.
function yslider_Callback(hObject, eventdata, handles)
% hObject    handle to yslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global yval;
yval = fix(get(hObject,'Value'));
set(handles.slideYout, 'string', yval);


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function yslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function xslider_Callback(hObject, eventdata, handles)
% hObject    handle to xslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xval;
xval = fix(get(hObject,'Value'));
set(handles.slideXout, 'string', xval);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function xslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in GO.
function GO_Callback(hObject, eventdata, handles)
% hObject    handle to GO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global yval;
global xval;
global mesh_scale;
mesh_scale = get(handles.barspertextbox, 'string'); %39.3700787 bars per mm
mesh_scale = str2double(mesh_scale);
disp(mesh_scale)
global gotdata;
data = imread(gotdata);
[m,n]=size(data);
plainbars = data<25;
set(handles.display);
image(plainbars);

xcount = xbarcount(yval, plainbars);
ycount = ybarcount(xval, plainbars);
barppx = xcount/n;
barppy = ycount/m;
modifierx = barppx/mesh_scale;
modifiery = barppy/mesh_scale;

ansx = num2str(modifierx);
ansy = num2str(modifiery);

set(handles.modix, 'string', ansx);
set(handles.modiy, 'string', ansy);
