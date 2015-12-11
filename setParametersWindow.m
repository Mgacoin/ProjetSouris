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


% --- Executes on button press in buOk.
function buOk_Callback(hObject, eventdata, handles)
global nbBox
nbBox = str2double(get(handles.editNbBox,'String'))
if isnan(nbBox) %numerical value check
    set(handles.textNumVal,'visible','on');
    set(handles.textPosVal,'visible','off');
elseif nbBox<=0  %positive value check
    set(handles.textPosVal,'visible','on');
    set(handles.textNumVal,'visible','off');
elseif nbBox>6  %value under 6 check
    set(handles.textPosVal,'visible','on');
    set(handles.textNumVal,'visible','off');
elseif nbBox == 1 %there is only 1 box connected
    set(handles.pChoiceIO,'visible','on');
    set(handles.textNumVal,'visible','off');
    set(handles.textPosVal,'visible','off');
    set(handles.pBox1,'visible','on');
    set(handles.pBox2,'visible','off');
    set(handles.pBox3,'visible','off');
    set(handles.pBox4,'visible','off');
    set(handles.pBox5,'visible','off');
    set(handles.pBox6,'visible','off');
    set(handles.buOKTab,'visible','on');
    
elseif nbBox == 2 %there are two boxes connected
    set(handles.pChoiceIO,'visible','on');
    set(handles.textNumVal,'visible','off');
    set(handles.textPosVal,'visible','off');
    set(handles.pBox1,'visible','on');
    set(handles.pBox2,'visible','on');
    set(handles.pBox3,'visible','off');
    set(handles.pBox4,'visible','off');
    set(handles.pBox5,'visible','off');
    set(handles.pBox6,'visible','off');
    set(handles.buOKTab,'visible','on');
    
elseif nbBox == 3
    set(handles.pChoiceIO,'visible','on');
    set(handles.textNumVal,'visible','off');
    set(handles.textPosVal,'visible','off');
    set(handles.pBox1,'visible','on');
    set(handles.pBox2,'visible','on');
    set(handles.pBox3,'visible','on');
    set(handles.pBox4,'visible','off');
    set(handles.pBox5,'visible','off');
    set(handles.pBox6,'visible','off');
    set(handles.buOKTab,'visible','on');
    
elseif nbBox == 4
    set(handles.pChoiceIO,'visible','on');
    set(handles.textNumVal,'visible','off');
    set(handles.textPosVal,'visible','off');
    set(handles.pBox1,'visible','on');
    set(handles.pBox2,'visible','on');
    set(handles.pBox3,'visible','on');
    set(handles.pBox4,'visible','on');
    set(handles.pBox5,'visible','off');
    set(handles.pBox6,'visible','off');
    set(handles.buOKTab,'visible','on');
    
elseif nbBox == 5
    set(handles.pChoiceIO,'visible','on');
    set(handles.textNumVal,'visible','off');
    set(handles.textPosVal,'visible','off');
    set(handles.pBox1,'visible','on');
    set(handles.pBox2,'visible','on');
    set(handles.pBox3,'visible','on');
    set(handles.pBox4,'visible','on');
    set(handles.pBox5,'visible','on');
    set(handles.pBox6,'visible','off');
    set(handles.buOKTab,'visible','on');
    
elseif nbBox == 6
    set(handles.pChoiceIO,'visible','on');
    set(handles.textNumVal,'visible','off');
    set(handles.textPosVal,'visible','off');
    set(handles.pBox1,'visible','on');
    set(handles.pBox2,'visible','on');
    set(handles.pBox3,'visible','on');
    set(handles.pBox4,'visible','on');
    set(handles.pBox5,'visible','on');
    set(handles.pBox6,'visible','on');
    set(handles.buOKTab,'visible','on');
    
end



function writeCells()
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



% --- Executes on button press in buOKTab.
function buOKTab_Callback(hObject, eventdata, handles)
set(handles.textFill,'visible','on');
set(handles.textSave,'visible','on');
writeCells();
winopen('SettingsDB.xlsx');

% --- Executes on button press in buFinish.
function buFinish_Callback(hObject, eventdata, handles)
close(gcf);
