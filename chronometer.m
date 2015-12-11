% Allows to record response time, ...

function varargout = chronometer(varargin)
global myV
% CHRONOMETER M-file for chronometer.fig
%      CHRONOMETER, by itself, creates a new CHRONOMETER or raises the existing
%      singleton*.
%
%      H = CHRONOMETER returns the handle to a new CHRONOMETER or the handle to
%      the existing singleton*.
%
%      CHRONOMETER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHRONOMETER.M with the given input arguments.
%
%      CHRONOMETER('Property','Value',...) creates a new CHRONOMETER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chronometer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chronometer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chronometer

% Last Modified by GUIDE v2.5 18-Jun-2015 13:35:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chronometer_OpeningFcn, ...
                   'gui_OutputFcn',  @chronometer_OutputFcn, ...
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


% --- Executes just before chronometer is made visible.
function chronometer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chronometer (see VARARGIN)

% Choose default command line output for chronometer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chronometer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chronometer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startstop.
function startstop_Callback(hObject, eventdata, handles)
% hObject    handle to startstop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic
format long g;
set(handles.reset,'Enable','off');
s=get(handles.startstop);
if strcmp(s.String,'Start') 
set(handles.startstop,'string','Stop');
else
set(handles.startstop,'string','Start');
end
ts=clock';
tm=0;
th=0;
while 1
    s=get(handles.startstop);
    if strcmp(s.String,'Start')
        set(handles.reset,'Enable','on');
        break
    end
    pause (.000000000000001)
    tsd=clock';
    td=tsd(6)-ts(6);
    if td >= 0
        set(handles.S,'string',td);
    else
        td=tsd(6)+60-ts(6);
        set(handles.S,'string',td);
    end
    if td>=59.99
        tm=tm+1;
        if tm==60
            th=th+1;
            set(handles.H,'string',th);
            set(handles.M,'string','00');
            tm=0;
        else
            set(handles.M,'string',tm);
        end
    end
end

% --- Executes on button press in print.
function print_Callback(hObject, eventdata, handles)
% hObject    handle to print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myV = toc %timer stamp
fprintf ( 1, '%f', myV );

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.H,'string','00');
set(handles.M,'string','00');
set(handles.S,'string','0.000');


function H_Callback(hObject, eventdata, handles)
% hObject    handle to H (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of H as text
%        str2double(get(hObject,'String')) returns contents of H as a double


% --- Executes during object creation, after setting all properties.
function H_CreateFcn(hObject, eventdata, handles)
% hObject    handle to H (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function M_Callback(hObject, eventdata, handles)
% hObject    handle to M (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of M as text
%        str2double(get(hObject,'String')) returns contents of M as a double


% --- Executes during object creation, after setting all properties.
function M_CreateFcn(hObject, eventdata, handles)
% hObject    handle to M (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function S_Callback(hObject, eventdata, handles)
% hObject    handle to S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of S as text
%        str2double(get(hObject,'String')) returns contents of S as a double


% --- Executes during object creation, after setting all properties.
function S_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
