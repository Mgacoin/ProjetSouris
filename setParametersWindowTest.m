function varargout = setParametersWindow(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @setParametersWindow_OpeningFcn, ...
    'gui_OutputFcn',  @setParametersWindow_OutputFcn, ...
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

% --- Executes just before setParametersWindow is made visible.
function setParametersWindow_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes setParametersWindow wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = setParametersWindow_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function editNbBox_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






function writeCells()           %Ecriture dans fichier excel (pour csv)
% Definition of the Excel file
fileName = 'SettingsDB.xlsx'

% Sheet's cleaning
xlswrite  ('SettingsDB.xlsx', ' ', 'Settings', 'A1:I71')


% Variables initialization
n = 0
box = -11
inputDisp = -10
rackI = -9
portI = -8
offsetI = -7
outputDisp = -5
rackO = -4
portO = -3
offsetO = -2
valueO = -1

global nbBox
while nbBox >0
    nbBox = nbBox-1
    
    %'Box' display
    box = box + 12
    xlrangeBox = sprintf('%c%d','A'+0,box);
    headBox={'Box'}
    xlswrite (fileName,headBox,'Settings',xlrangeBox)
    
    %Box's id display
    n = n + 1
    xlrangeBoxID = sprintf('%c%d','A'+1,box);
    xlswrite (fileName,n,'Settings',xlrangeBoxID)
    
    % Input: Rack, Port & Offset
    inputDisp = inputDisp + 12
    xlrangeInputDisp = sprintf ('%c%d','A'+0,inputDisp);
    headInputDisp={'Input'}
    xlswrite (fileName, headInputDisp,'Settings', xlrangeInputDisp)
    
    rackI = rackI + 12
    xlrangeRackI = sprintf('%c%d','A'+0,rackI);
    headRack={'Rack'}
    xlswrite (fileName, headRack, 'Settings', xlrangeRackI)
    
    portI = portI + 12
    xlrangePortI = sprintf('%c%d','A'+0,portI);
    headPort={'Port'}
    xlswrite (fileName, headPort, 'Settings', xlrangePortI)
    
    offsetI = offsetI + 12
    xlrangeOffsetI = sprintf('%c%d','A'+0,offsetI);
    headOffset={'Offset'}
    xlswrite (fileName, headOffset, 'Settings', xlrangeOffsetI)
    
    % Output: Rack, Port, Offset & Value
    outputDisp = outputDisp + 12
    xlrangeOutputDisp = sprintf ('%c%d','A'+0,outputDisp);
    headOutputDisp={'Output'}
    xlswrite (fileName, headOutputDisp,'Settings', xlrangeOutputDisp)
    
    rackO = rackO + 12
    xlrangeRackO = sprintf('%c%d','A'+0,rackO);
    xlswrite (fileName, headRack, 'Settings', xlrangeRackO)
    
    portO = portO + 12
    xlrangePortO = sprintf('%c%d','A'+0,portO);
    xlswrite (fileName, headPort, 'Settings', xlrangePortO)
    
    offsetO = offsetO + 12
    xlrangeOffsetO = sprintf('%c%d','A'+0,offsetO);
    xlswrite (fileName, headOffset, 'Settings', xlrangeOffsetO)
    
    valueO = valueO + 12
    xlrangeValueO = sprintf('%c%d','A'+0,valueO);
    headValue={'Value'}
    xlswrite (fileName, headValue, 'Settings', xlrangeValueO)
    
% Handling of user's choices
global val1Box1In val2Box1In val3Box1In val4Box1In val5Box1In val6Box1In val1Box1Out val2Box1Out val3Box1Out val4Box1Out val5Box1Out val6Box1Out
global val1Box2In val2Box2In val3Box2In val4Box2In val5Box2In val6Box2In val1Box2Out val2Box2Out val3Box2Out val4Box2Out val5Box2Out val6Box2Out
global val1Box3In val2Box3In val3Box3In val4Box3In val5Box3In val6Box3In val1Box3Out val2Box3Out val3Box3Out val4Box3Out val5Box3Out val6Box3Out
global val1Box4In val2Box4In val3Box4In val4Box4In val5Box4In val6Box4In val1Box4Out val2Box4Out val3Box4Out val4Box4Out val5Box4Out val6Box4Out
global val1Box5In val2Box5In val3Box5In val4Box5In val5Box5In val6Box5In val1Box5Out val2Box5Out val3Box5Out val4Box5Out val5Box5Out val6Box5Out
global val1Box6In val2Box6In val3Box6In val4Box6In val5Box6In val6Box6In val1Box6Out val2Box6Out val3Box6Out val4Box6Out val5Box6Out val6Box6Out

    
%Box1
%Input
    switch val1Box1In
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName, headInput,'Settings','B2');

    switch val2Box1In
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','C2');
    
    switch val3Box1In
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
        otherwise
        headInput = {' '};
    end
    xlswrite (fileName,headInput,'Settings','D2')
    
    switch val4Box1In
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','E2')
    
    switch val5Box1In
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','F2')
    
    switch val6Box1In
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','G2')
    
    %Box1
    %Output
    switch val1Box1Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','B7')
    
    switch val2Box1Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','C7')
    
    switch val3Box1Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','D7')
    
    switch val4Box1Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','E7')
    
    switch val5Box1Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','F7')
    
    switch val6Box1Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','G7')
    
    
    %Box2
    %Input
    switch val1Box2In
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','B13')
    
    switch val2Box2In
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','C13')
    
    switch val3Box2In
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','D13')
    
    switch val4Box2In
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','E13')
    
    switch val5Box2In
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','F13')
    
    switch val6Box2In
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','G13')
    
    %Box2
    %Output
    switch val1Box2Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','B13')
    
    switch val2Box2Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','C13')
    
    switch val3Box2Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','D13')
    
    switch val4Box2Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','E13')
    
    switch val5Box2Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','F13')
    
    switch val6Box2Out
        case 1 %Nothing is selected
            headInput={' '};
        case 2 %Nose poke is selected
            headInput={'Nose poke'};
        case 3 %Left lever is selected
            headInput={'Left lever'};
        case 4 %Right lever is selected
            headInput={'Right lever'};
    end
    xlswrite (fileName,headInput,'Settings','G13')
    
end





function list1Box1In_Callback(hObject, eventdata, handles)
global val1Box1In
val1Box1In = get(hObject,'Value'); %Takes the selected test

function list2Box1In_Callback(hObject, eventdata, handles)
global val2Box1In
val2Box1In = get(hObject,'Value'); %Takes the selected test

function list3Box1In_Callback(hObject, eventdata, handles)
global val3Box1In
val3Box1In = get(hObject,'Value'); %Takes the selected test

function list4Box1In_Callback(hObject, eventdata, handles)
global val4Box1In
val4Box1In = get(hObject,'Value'); %Takes the selected test
function list4Box1In_CreateFcn(hObject, eventdata, handles)

function list5Box1In_Callback(hObject, eventdata, handles)
global val5Box1In
val5Box1In = get(hObject,'Value'); %Takes the selected test

function list6Box1In_Callback(hObject, eventdata, handles)
global val6Box1In
val6Box1In = get(hObject,'Value'); %Takes the selected test

function list1Box1Out_Callback(hObject, eventdata, handles)
global val1Box1Out
val1Box1Out = get(hObject,'Value'); %Takes the selected test

function list2Box1Out_Callback(hObject, eventdata, handles)
global val2Box1Out
val2Box1Out = get(hObject,'Value'); %Takes the selected test

function list3Box1Out_Callback(hObject, eventdata, handles)
global val3Box1Out
val3Box1Out = get(hObject,'Value'); %Takes the selected test

function list4Box1Out_Callback(hObject, eventdata, handles)
global val4Box1Out
val4Box1Out = get(hObject,'Value'); %Takes the selected test

function list5Box1Out_Callback(hObject, eventdata, handles)
global val5Box1Out
val5Box1Out = get(hObject,'Value'); %Takes the selected test

function list6Box1Out_Callback(hObject, eventdata, handles)
global val6Box1Out
val6Box1Out = get(hObject,'Value'); %Takes the selected test

function list1Box2In_Callback(hObject, eventdata, handles)
global val1Box2In
val1Box2In = get(hObject,'Value'); %Takes the selected test

function list2Box2In_Callback(hObject, eventdata, handles)
global val2Box2In
val2Box2In = get(hObject,'Value'); %Takes the selected test

function list3Box2In_Callback(hObject, eventdata, handles)
global val3Box2In
val3Box2In = get(hObject,'Value'); %Takes the selected test

function list4Box2In_Callback(hObject, eventdata, handles)
global val4Box2In
val4Box2In = get(hObject,'Value'); %Takes the selected test

function list5Box2In_Callback(hObject, eventdata, handles)
global val5Box2In
val5Box2In = get(hObject,'Value'); %Takes the selected test

function list6Box2In_Callback(hObject, eventdata, handles)
global val6Box2In
val6Box2In = get(hObject,'Value'); %Takes the selected test

function list1Box2Out_Callback(hObject, eventdata, handles)
global val1Box2Out
val1Box2Out = get(hObject,'Value'); %Takes the selected test

function list2Box2Out_Callback(hObject, eventdata, handles)
global val2Box2Out
val2Box2Out = get(hObject,'Value'); %Takes the selected test

function list3Box2Out_Callback(hObject, eventdata, handles)
global val3Box2Out
val3Box2Out = get(hObject,'Value'); %Takes the selected test

function list4Box2Out_Callback(hObject, eventdata, handles)
global val4Box2Out
val4Box2Out = get(hObject,'Value'); %Takes the selected test

function list5Box2Out_Callback(hObject, eventdata, handles)
global val5Box2Out
val5Box2Out = get(hObject,'Value'); %Takes the selected test

function list6Box2Out_Callback(hObject, eventdata, handles)
global val6Box2Out
val6Box2Out = get(hObject,'Value'); %Takes the selected test

function list1Box3In_Callback(hObject, eventdata, handles)
global val1Box3In
val1Box3In = get(hObject,'Value'); %Takes the selected test

function list2Box3In_Callback(hObject, eventdata, handles)
global val2Box3In
val2Box3In = get(hObject,'Value'); %Takes the selected test

function list3Box3In_Callback(hObject, eventdata, handles)
global val3Box3In
val3Box3In = get(hObject,'Value'); %Takes the selected test

function lis41Box3In_Callback(hObject, eventdata, handles)
global val4Box3In
val4Box3In = get(hObject,'Value'); %Takes the selected test

function list5Box3In_Callback(hObject, eventdata, handles)
global val5Box3In
val5Box3In = get(hObject,'Value'); %Takes the selected test

function list6Box3In_Callback(hObject, eventdata, handles)
global val6Box3In
val6Box3In = get(hObject,'Value'); %Takes the selected test

function list1Box3Out_Callback(hObject, eventdata, handles)
global val1Box3Out
val1Box3Out = get(hObject,'Value'); %Takes the selected test

function list2Box3Out_Callback(hObject, eventdata, handles)
global val2Box3Out
val2Box3Out = get(hObject,'Value'); %Takes the selected test

function list3Box3Out_Callback(hObject, eventdata, handles)
global val3Box3Out
val3Box3Out = get(hObject,'Value'); %Takes the selected test

function list4Box3Out_Callback(hObject, eventdata, handles)
global val4Box3Out
val4Box3Out = get(hObject,'Value'); %Takes the selected test

function list5Box3Out_Callback(hObject, eventdata, handles)
global val5Box3Out
val5Box3Out = get(hObject,'Value'); %Takes the selected test

function list6Box3Out_Callback(hObject, eventdata, handles)
global val6Box3Out
val6Box3Out = get(hObject,'Value'); %Takes the selected test

function list1Box4In_Callback(hObject, eventdata, handles)
global val1Box4In
val1Box4In = get(hObject,'Value'); %Takes the selected test

function list2Box4In_Callback(hObject, eventdata, handles)
global val2Box4In
val2Box4In = get(hObject,'Value'); %Takes the selected test

function list3Box4In_Callback(hObject, eventdata, handles)
global val3Box4In
val3Box4In = get(hObject,'Value'); %Takes the selected test

function list4Box4In_Callback(hObject, eventdata, handles)
global val4Box4In
val4Box4In = get(hObject,'Value'); %Takes the selected test

function list5Box4In_Callback(hObject, eventdata, handles)
global val5Box4In
val5Box4In = get(hObject,'Value'); %Takes the selected test

function list6Box4In_Callback(hObject, eventdata, handles)
global val6Box4In
val6Box4In = get(hObject,'Value'); %Takes the selected test

function list1Box4Out_Callback(hObject, eventdata, handles)
global val1Box4Out
val1Box4Out = get(hObject,'Value'); %Takes the selected test

function list2Box4Out_Callback(hObject, eventdata, handles)
global val2Box4Out
val2Box4Out = get(hObject,'Value'); %Takes the selected test

function list3Box4Out_Callback(hObject, eventdata, handles)
global val3Box4Out
val3Box4Out = get(hObject,'Value'); %Takes the selected test

function list4Box4Out_Callback(hObject, eventdata, handles)
global val4Box4Out
val4Box4Out = get(hObject,'Value'); %Takes the selected test

function list5Box4Out_Callback(hObject, eventdata, handles)
global val5Box4Out
val5Box4Out = get(hObject,'Value'); %Takes the selected test

function list6Box4Out_Callback(hObject, eventdata, handles)
global val6Box4Out
val6Box4Out = get(hObject,'Value'); %Takes the selected test

function list1Box5In_Callback(hObject, eventdata, handles)
global val1Box5In
val1Box5In = get(hObject,'Value'); %Takes the selected test

function list2Box5In_Callback(hObject, eventdata, handles)
global val2Box5In
val2Box5In = get(hObject,'Value'); %Takes the selected test

function list3Box5In_Callback(hObject, eventdata, handles)
global val3Box5In
val3Box5In = get(hObject,'Value'); %Takes the selected test

function list4Box5In_Callback(hObject, eventdata, handles)
global val4Box5In
val4Box5In = get(hObject,'Value'); %Takes the selected test

function list5Box5In_Callback(hObject, eventdata, handles)
global val5Box5In
val5Box5In = get(hObject,'Value'); %Takes the selected test

function list6Box5In_Callback(hObject, eventdata, handles)
global val6Box5In
val6Box5In = get(hObject,'Value'); %Takes the selected test

function list1Box5Out_Callback(hObject, eventdata, handles)
global val1Box5Out
val1Box5Out = get(hObject,'Value'); %Takes the selected test

function list2Box5Out_Callback(hObject, eventdata, handles)
global val2Box5Out
val2Box5Out = get(hObject,'Value'); %Takes the selected test

function list3Box5Out_Callback(hObject, eventdata, handles)
global val3Box5Out
val3Box5Out = get(hObject,'Value'); %Takes the selected test

function list4Box5Out_Callback(hObject, eventdata, handles)
global val4Box5Out
val4Box5Out = get(hObject,'Value'); %Takes the selected test

function list5Box5Out_Callback(hObject, eventdata, handles)
global val5Box5Out
val5Box5Out = get(hObject,'Value'); %Takes the selected test

function list6Box5Out_Callback(hObject, eventdata, handles)
global val6Box5Out
val6Box5Out = get(hObject,'Value'); %Takes the selected test

function list1Box6In_Callback(hObject, eventdata, handles)
global val1Box6In
val1Box6In = get(hObject,'Value'); %Takes the selected test

function list2Box6In_Callback(hObject, eventdata, handles)
global val2Box6In
val2Box6In = get(hObject,'Value'); %Takes the selected test

function list3Box6In_Callback(hObject, eventdata, handles)
global val3Box6In
val3Box6In = get(hObject,'Value'); %Takes the selected test

function list4Box6In_Callback(hObject, eventdata, handles)
global val4Box6In
val4Box6In = get(hObject,'Value'); %Takes the selected test

function list5Box6In_Callback(hObject, eventdata, handles)
global val5Box6In
val5Box6In = get(hObject,'Value'); %Takes the selected test

function list6Box6In_Callback(hObject, eventdata, handles)
global val6Box6In
val6Box6In = get(hObject,'Value'); %Takes the selected test

function list1Box6Out_Callback(hObject, eventdata, handles)
global val1Box6Out
val1Box6Out = get(hObject,'Value'); %Takes the selected test

function list2Box6Out_Callback(hObject, eventdata, handles)
global val2Box6Out
val2Box6Out = get(hObject,'Value'); %Takes the selected test

function list3Box6Out_Callback(hObject, eventdata, handles)
global val3Box6Out
val3Box6Out = get(hObject,'Value'); %Takes the selected test

function list4Box6Out_Callback(hObject, eventdata, handles)
global val4Box6Out
val4Box6Out = get(hObject,'Value'); %Takes the selected test

function list5Box6Out_Callback(hObject, eventdata, handles)
global val5Box6Out
val5Box6Out = get(hObject,'Value'); %Takes the selected test

function list6Box6Out_Callback(hObject, eventdata, handles)
global val6Box6Out
val6Box6Out = get(hObject,'Value'); %Takes the selected test










% --- Executes on selection change in popupParameters.
function popupParameters_Callback(hObject, eventdata, handles)
% hObject    handle to popupParameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popupParameters contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupParameters

% --- Executes during object creation, after setting all properties.
function popupParameters_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupParameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in buOkParam. %%
function buOkParam_Callback(hObject, eventdata, handles)
hideNumBox(handles); %Hide the new parameter configuration
global parameter
contents = get(handles.popupParameters,'String'); 
parameter = contents{get(handles.popupParameters,'Value')};
if isempty(parameter) %value check
    set(handles.textErrorParam,'visible','on');
else 
    set(handles.textErrorParam,'visible','off'); %% Faire fonction mettant ce qu'il faut en "caché" si on fait ça
    set(handles.pNumBox,'visible','off');
    set(handles.pChooseBox,'visible','on');
    set(handles.pChoiceIO,'title',parameter);
end

% --- Executes on button press in buNewParameters.
function buNewParameters_Callback(hObject, eventdata, handles)
hideChooseBox(handles);  %Hide the choosing box panel
set(handles.pNumBox,'visible','on');
% hObject    handle to buNewParameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function editNumBox_Callback(hObject, eventdata, handles)
% hObject    handle to editNumBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of editNumBox as text
%        str2double(get(hObject,'String')) returns contents of editNumBox as a double

% --- Executes during object creation, after setting all properties.
function editNumBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNumBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in buOKNumBox.  %%
function buOKNumBox_Callback(hObject, eventdata, handles)
global nbBox
nbBox = str2double(get(handles.editNumBox,'String'));
if isnan(nbBox) %numerical value check
    set(handles.textErrorBoxNumeric,'visible','on');
    set(handles.textErrorBoxValue,'visible','off');
elseif nbBox<=0  %positive value check
    set(handles.textErrorBoxValue,'visible','on');
    set(handles.textErrorBoxNumeric,'visible','off');
%elseif nbBox>6  %value under 6 check %%Parametrer nombre maximal
%    set(handles.textPosVal,'visible','on');
%    set(handles.textErrorParam,'visible','off');
else 

    %%Enregistrer un nouveau paramètre (auto incrémenter le nom), le mettre dans la liste
    set(handles.pChooseBox,'visible','on');
    set(handles.pChoiceIO,'visible','on');   

    hideNumBox(handles); %Hide the new parameter configuration
    
end


% --- Executes on button press in buCancelNumBox.
function buCancelNumBox_Callback(hObject, eventdata, handles)
hideNumBox(handles);  %Hide the new parameter configuration

function hideNumBox(handles)
set(handles.editNumBox,'String','');
set(handles.textErrorBoxValue,'visible','off');
set(handles.textErrorBoxNumeric,'visible','off');
set(handles.pNumBox,'visible','off');




% --- Executes on selection change in popupChooseBox.
function popupChooseBox_Callback(hObject, eventdata, handles)
% hObject    handle to popupChooseBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popupChooseBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupChooseBox

% --- Executes during object creation, after setting all properties.
function popupChooseBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupChooseBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in buOKChooseBox.
function buOKChooseBox_Callback(hObject, eventdata, handles)
global box
contents = get(handles.popupChooseBox,'String'); 
box = contents{get(handles.popupChooseBox,'Value')};
if isempty(box) %value check
    set(handles.textErrorBoxChoose,'visible','on');
else 
    set(handles.textErrorBoxChoose,'visible','off');
    set(handles.pChoiceIO,'visible','on');
    set(handles.textBoxNumber,'String',['Box ' box]);
    %%Afficher la boite selon le fichier de paramétrage
end

function hideChooseBox(handles)
set(handles.popupChooseBox,'String','');
set(handles.textErrorBoxChoose,'visible','off');
set(handles.pChooseBox,'visible','off');

% --- Executes on button press in buNewBox.
function buNewBox_Callback(hObject, eventdata, handles)
%%Ajouter une boite au fichier de paramétrage


% --- Executes on button press in buPrevBox.
function buPrevBox_Callback(hObject, eventdata, handles)
%%Changer de boite (précédente)

% --- Executes on button press in buNextBox.
function buNextBox_Callback(hObject, eventdata, handles)
%%Changer de boite (suivante)

% --- Executes on button press in buDeleteBox.
function buDeleteBox_Callback(hObject, eventdata, handles)
% Construct a questdlg with three options
choice = questdlg('Are you sure you want to delete?', ...
	'Delete a box', ...
	'Yes','No','No');
% Handle response
switch choice
    case 'Yes'
        disp(choice);
        %%Supprimer la boite
        h = msgbox('The Box has been deleted','Deleted','Warn') 
    case 'No'
        disp(choice);
        %%Ne pas supprimer la boite

end

%%Suprimer la boite en cours (mettre une popup)

% --- Executes on button press in buSaveTab.    %%C'est ici qu'on doit sauvegarder
function buSaveTab_Callback(hObject, eventdata, handles)
%writeCells();
%winopen('SettingsDB.xlsx');
%%Fonction de Sauvegarde
set(handles.textSaved,'Visible','on'); %%Dans la fonction de sauvegarde

% --- Executes on button press in buCancelTab.
function buCancelTab_Callback(hObject, eventdata, handles)
close(gcf);

% --- Executes on button press in buFinish.
function buFinish_Callback(hObject, eventdata, handles)
close(gcf);





function editD8_Callback(hObject, eventdata, handles)
% hObject    handle to editD8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD8 as text
%        str2double(get(hObject,'String')) returns contents of editD8 as a double


% --- Executes during object creation, after setting all properties.
function editD8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editD8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC8_Callback(hObject, eventdata, handles)
% hObject    handle to editC8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC8 as text
%        str2double(get(hObject,'String')) returns contents of editC8 as a double


% --- Executes during object creation, after setting all properties.
function editC8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editB8_Callback(hObject, eventdata, handles)
% hObject    handle to editB8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB8 as text
%        str2double(get(hObject,'String')) returns contents of editB8 as a double


% --- Executes during object creation, after setting all properties.
function editB8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA8_Callback(hObject, eventdata, handles)
% hObject    handle to editA8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA8 as text
%        str2double(get(hObject,'String')) returns contents of editA8 as a double


% --- Executes during object creation, after setting all properties.
function editA8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup8.
function popup8_Callback(hObject, eventdata, handles)
% hObject    handle to popup8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup8


% --- Executes during object creation, after setting all properties.
function popup8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup6.
function popup6_Callback(hObject, eventdata, handles)
% hObject    handle to popup6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup6


% --- Executes during object creation, after setting all properties.
function popup6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA6_Callback(hObject, eventdata, handles)
% hObject    handle to editA6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA6 as text
%        str2double(get(hObject,'String')) returns contents of editA6 as a double


% --- Executes during object creation, after setting all properties.
function editA6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editB6_Callback(hObject, eventdata, handles)
% hObject    handle to editB6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB6 as text
%        str2double(get(hObject,'String')) returns contents of editB6 as a double


% --- Executes during object creation, after setting all properties.
function editB6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC6_Callback(hObject, eventdata, handles)
% hObject    handle to editC6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC6 as text
%        str2double(get(hObject,'String')) returns contents of editC6 as a double


% --- Executes during object creation, after setting all properties.
function editC6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editD6_Callback(hObject, eventdata, handles)
% hObject    handle to editD6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD6 as text
%        str2double(get(hObject,'String')) returns contents of editD6 as a double


% --- Executes during object creation, after setting all properties.
function editD6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editD6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup3.
function popup3_Callback(hObject, eventdata, handles)
% hObject    handle to popup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup3


% --- Executes during object creation, after setting all properties.
function popup3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA3_Callback(hObject, eventdata, handles)
% hObject    handle to editA3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA3 as text
%        str2double(get(hObject,'String')) returns contents of editA3 as a double


% --- Executes during object creation, after setting all properties.
function editA3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editB3_Callback(hObject, eventdata, handles)
% hObject    handle to editB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB3 as text
%        str2double(get(hObject,'String')) returns contents of editB3 as a double


% --- Executes during object creation, after setting all properties.
function editB3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editD3_Callback(hObject, eventdata, handles)
% hObject    handle to editD3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD3 as text
%        str2double(get(hObject,'String')) returns contents of editD3 as a double


% --- Executes during object creation, after setting all properties.
function editD3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editD3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC3_Callback(hObject, eventdata, handles)
% hObject    handle to editC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC3 as text
%        str2double(get(hObject,'String')) returns contents of editC3 as a double


% --- Executes during object creation, after setting all properties.
function editC3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup4.
function popup4_Callback(hObject, eventdata, handles)
% hObject    handle to popup4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup4


% --- Executes during object creation, after setting all properties.
function popup4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA4_Callback(hObject, eventdata, handles)
% hObject    handle to editA4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA4 as text
%        str2double(get(hObject,'String')) returns contents of editA4 as a double


% --- Executes during object creation, after setting all properties.
function editA4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editB4_Callback(hObject, eventdata, handles)
% hObject    handle to editB4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB4 as text
%        str2double(get(hObject,'String')) returns contents of editB4 as a double


% --- Executes during object creation, after setting all properties.
function editB4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC4_Callback(hObject, eventdata, handles)
% hObject    handle to editC4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC4 as text
%        str2double(get(hObject,'String')) returns contents of editC4 as a double


% --- Executes during object creation, after setting all properties.
function editC4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editD4_Callback(hObject, eventdata, handles)
% hObject    handle to editD4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD4 as text
%        str2double(get(hObject,'String')) returns contents of editD4 as a double


% --- Executes during object creation, after setting all properties.
function editD4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editD4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editD2_Callback(hObject, eventdata, handles)
% hObject    handle to editD2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD2 as text
%        str2double(get(hObject,'String')) returns contents of editD2 as a double


% --- Executes during object creation, after setting all properties.
function editD2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editD2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC2_Callback(hObject, eventdata, handles)
% hObject    handle to editC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC2 as text
%        str2double(get(hObject,'String')) returns contents of editC2 as a double


% --- Executes during object creation, after setting all properties.
function editC2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editB2_Callback(hObject, eventdata, handles)
% hObject    handle to editB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB2 as text
%        str2double(get(hObject,'String')) returns contents of editB2 as a double


% --- Executes during object creation, after setting all properties.
function editB2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA2_Callback(hObject, eventdata, handles)
% hObject    handle to editA2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA2 as text
%        str2double(get(hObject,'String')) returns contents of editA2 as a double


% --- Executes during object creation, after setting all properties.
function editA2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup2.
function popup2_Callback(hObject, eventdata, handles)
% hObject    handle to popup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup2


% --- Executes during object creation, after setting all properties.
function popup2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editD7_Callback(hObject, eventdata, handles)
% hObject    handle to editD7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD7 as text
%        str2double(get(hObject,'String')) returns contents of editD7 as a double


% --- Executes during object creation, after setting all properties.
function editD7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editD7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC7_Callback(hObject, eventdata, handles)
% hObject    handle to editC7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC7 as text
%        str2double(get(hObject,'String')) returns contents of editC7 as a double


% --- Executes during object creation, after setting all properties.
function editC7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editB7_Callback(hObject, eventdata, handles)
% hObject    handle to editB7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB7 as text
%        str2double(get(hObject,'String')) returns contents of editB7 as a double


% --- Executes during object creation, after setting all properties.
function editB7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA7_Callback(hObject, eventdata, handles)
% hObject    handle to editA7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA7 as text
%        str2double(get(hObject,'String')) returns contents of editA7 as a double


% --- Executes during object creation, after setting all properties.
function editA7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup7.
function popup7_Callback(hObject, eventdata, handles)
% hObject    handle to popup7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup7


% --- Executes during object creation, after setting all properties.
function popup7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup1.
function popup1_Callback(hObject, eventdata, handles)
% hObject    handle to popup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup1


% --- Executes during object creation, after setting all properties.
function popup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA1_Callback(hObject, eventdata, handles)
% hObject    handle to editA1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA1 as text
%        str2double(get(hObject,'String')) returns contents of editA1 as a double


% --- Executes during object creation, after setting all properties.
function editA1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editB1_Callback(hObject, eventdata, handles)
% hObject    handle to editB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB1 as text
%        str2double(get(hObject,'String')) returns contents of editB1 as a double


% --- Executes during object creation, after setting all properties.
function editB1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC1_Callback(hObject, eventdata, handles)
% hObject    handle to editC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC1 as text
%        str2double(get(hObject,'String')) returns contents of editC1 as a double


% --- Executes during object creation, after setting all properties.
function editC1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editD1_Callback(hObject, eventdata, handles)
% hObject    handle to editD1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD1 as text
%        str2double(get(hObject,'String')) returns contents of editD1 as a double


% --- Executes during object creation, after setting all properties.
function editD1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editD1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup5.
function popup5_Callback(hObject, eventdata, handles)
% hObject    handle to popup5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup5


% --- Executes during object creation, after setting all properties.
function popup5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA5_Callback(hObject, eventdata, handles)
% hObject    handle to editA5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA5 as text
%        str2double(get(hObject,'String')) returns contents of editA5 as a double


% --- Executes during object creation, after setting all properties.
function editA5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editB5_Callback(hObject, eventdata, handles)
% hObject    handle to editB5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB5 as text
%        str2double(get(hObject,'String')) returns contents of editB5 as a double


% --- Executes during object creation, after setting all properties.
function editB5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC5_Callback(hObject, eventdata, handles)
% hObject    handle to editC5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC5 as text
%        str2double(get(hObject,'String')) returns contents of editC5 as a double


% --- Executes during object creation, after setting all properties.
function editC5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editD5_Callback(hObject, eventdata, handles)
% hObject    handle to editD5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD5 as text
%        str2double(get(hObject,'String')) returns contents of editD5 as a double


% --- Executes during object creation, after setting all properties.
function editD5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editD5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup9.
function popup9_Callback(hObject, eventdata, handles)
% hObject    handle to popup9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup9


% --- Executes during object creation, after setting all properties.
function popup9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA9_Callback(hObject, eventdata, handles)
% hObject    handle to editA9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA9 as text
%        str2double(get(hObject,'String')) returns contents of editA9 as a double


% --- Executes during object creation, after setting all properties.
function editA9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editB9_Callback(hObject, eventdata, handles)
% hObject    handle to editB9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB9 as text
%        str2double(get(hObject,'String')) returns contents of editB9 as a double


% --- Executes during object creation, after setting all properties.
function editB9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC9_Callback(hObject, eventdata, handles)
% hObject    handle to editC9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC9 as text
%        str2double(get(hObject,'String')) returns contents of editC9 as a double


% --- Executes during object creation, after setting all properties.
function editC9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editD9_Callback(hObject, eventdata, handles)
% hObject    handle to editD9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD9 as text
%        str2double(get(hObject,'String')) returns contents of editD9 as a double


% --- Executes during object creation, after setting all properties.
function editD9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editD9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup10.
function popup10_Callback(hObject, eventdata, handles)
% hObject    handle to popup10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup10


% --- Executes during object creation, after setting all properties.
function popup10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA10_Callback(hObject, eventdata, handles)
% hObject    handle to editA10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA10 as text
%        str2double(get(hObject,'String')) returns contents of editA10 as a double


% --- Executes during object creation, after setting all properties.
function editA10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editB10_Callback(hObject, eventdata, handles)
% hObject    handle to editB10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB10 as text
%        str2double(get(hObject,'String')) returns contents of editB10 as a double


% --- Executes during object creation, after setting all properties.
function editB10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC10_Callback(hObject, eventdata, handles)
% hObject    handle to editC10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC10 as text
%        str2double(get(hObject,'String')) returns contents of editC10 as a double


% --- Executes during object creation, after setting all properties.
function editC10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editD10_Callback(hObject, eventdata, handles)
% hObject    handle to editD10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD10 as text
%        str2double(get(hObject,'String')) returns contents of editD10 as a double


% --- Executes during object creation, after setting all properties.
function editD10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editD10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);

