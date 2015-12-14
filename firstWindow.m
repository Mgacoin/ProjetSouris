function varargout = firstWindow(varargin)

%Med Library
% dll = ('C:\Windows\System32\704IO.dll')
% header = ('C:\Windows\System32\704IO.h')
% loadlibrary(dll,header)

hfile =(fullfile(matlabroot, 'lib','win64', '704IO.h'))
loadlibrary('704IO',hfile,'alias','libPort')

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @firstWindow_OpeningFcn, ...
                   'gui_OutputFcn',  @firstWindow_OutputFcn, ...
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


% --- Executes just before firstWindow is made visible.
function firstWindow_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for firstWindow
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


%displays radioButtons
global nbBox
%%Appel de la fonction
nbBox = settings('Settings.xlsx')
%nbBox = 4
if nbBox == 1 
    set(handles.radioBox1,'visible','on');
elseif nbBox == 2
    set(handles.radioBox1,'visible','on');
    set(handles.radioBox2,'visible','on');
elseif nbBox == 3 
    set(handles.radioBox1,'visible','on');
    set(handles.radioBox2,'visible','on');
    set(handles.radioBox3,'visible','on');
elseif nbBox == 4
    set(handles.radioBox1,'visible','on');
    set(handles.radioBox2,'visible','on');
    set(handles.radioBox3,'visible','on');
    set(handles.radioBox4,'visible','on');
elseif nbBox == 5
    set(handles.radioBox1,'visible','on');
    set(handles.radioBox2,'visible','on');
    set(handles.radioBox3,'visible','on');
    set(handles.radioBox4,'visible','on');
    set(handles.radioBox5,'visible','on');
elseif nbBox == 6 
    set(handles.radioBox1,'visible','on');
    set(handles.radioBox2,'visible','on');
    set(handles.radioBox3,'visible','on');
    set(handles.radioBox4,'visible','on');
    set(handles.radioBox5,'visible','on');
    set(handles.radioBox6,'visible','on');
end


function varargout = firstWindow_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



% --- Executes during object creation, after setting all properties.
function textAnimal_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function listBoxProtocol_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupProtocole.
function popupProtocole_Callback(hObject, eventdata, handles)
val = get(hObject,'Value'); %Takes the selected test
    switch val
        case 1 %Flexibility test is selected
            set(handles.textFlex,'visible','on');
            set(handles.pRev,'visible','on');
        case 2 %Check test is selected
            set(handles.textFlex,'visible','off');
            set(handles.pRev,'visible','off');
            set(handles.pSelectLum,'visible','off');
            set(handles.pSelectPattern,'visible','off');
    end
   
%The reversal is made on luminance
function buLuminance_Callback(hObject, eventdata, handles)
set(handles.pSelectLum,'visible','on');
set(handles.pSelectPattern,'visible','off');

%The reversal is made on patterns
function buPattern_Callback(hObject, eventdata, handles)
set(handles.pSelectLum,'visible','off');
set(handles.pSelectPattern,'visible', 'on');

% --- Executes during object creation, after setting all properties.
function popupProtocole_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function editNotes_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during object creation, after setting all properties.
function labNotes_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in buValidate.
function buValidate_Callback(hObject, eventdata, handles)
% Clears the entered data
set(handles.radioBox1,'value',1.0);
set(handles.textAnimal,'string','');
set(handles.checkElectrophys,'value',0.0);
set(handles.checkVideo,'value',0.0);
set(handles.textNotes,'string','');
set(handles.textFlex,'visible','off');
set(handles.pRev,'visible','off');
set(handles.pSelectLum,'visible','off');
set(handles.pSelectPattern,'visible','off');


function buLaunch_Callback(hObject, eventdata, handles)
close(gcf);
%openfig('monitoringWindowFlexibility');
%monitoringWindowFlexibility();
%luminance();
newStorageTest();

% %Calllib function triggers inputs and outputs
% global inRack inPort inOffset outRack outPort outOffset outValue
% 
% %calllib('lib','PortRead',inRack,inPort,inOffset)
% calllib('libx','PortRead',1,780,-1)
% %calllib('lib','PortWrite',outRack,outPort,outOffset,outValue); %We give the expected values to write >> Activates the pellet dispensor
% calllib('libx','PortWrite',1,792,0,10)

% --- Executes on button press in buValidate.
function buCancel_Callback(hObject, eventdata, handles)
close(gcf);%on devrait pouvoir annuler la box validée peut etre?


% --- Executes on button press in buParameters.
function buParameters_Callback(hObject, eventdata, handles)
openfig(setParametersWindow);


% --- Executes on button press in buVariables.
function buVariables_Callback(hObject, eventdata, handles)
% hObject    handle to buVariables (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
