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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on button press in buParcourirParam. %%
function buParcourirParam_Callback(hObject, eventdata, handles)
hideNumBox(handles); %Hide the new parameter configuration
global parameter;
global filename;
filename = uigetfile({'*.csv','CSV (*.csv)'});

if (filename == 0)
    hideChooseBox(handles);
    %set(handles.textErrorParam,'visible','on');
else
    tokens = regexp(filename,'(\w+).*','tokens');
    parameter = tokens{1}{1};
    %set(handles.textErrorParam,'visible','off');
    set(handles.textParameter,'string',parameter);
    set(handles.pChooseBox,'visible','on');
    set(handles.pChoiceIO,'title',parameter);
end

% --- Executes on button press in buNewParameters.
function buNewParameters_Callback(hObject, eventdata, handles)
hideChooseBox(handles);  %Hide the choosing box panel
set(handles.pNumBox,'visible','on');
set(handles.pChoiceIO,'visible','off');
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
set(handles.editNumBox,'String',' ');
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
set(handles.popupChooseBox,'String',{'','1'});
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

global nbBox

global pop1
global pop2
global pop3
global pop4
global pop5
global pop6
global pop7
global pop8
global pop9
global pop10

global A1
global A2
global A3
global A4
global A5
global A6
global A7
global A8
global A9
global A10

global B1
global B2
global B3
global B4
global B5
global B6
global B7
global B8
global B9
global B10

global C1
global C2
global C3
global C4
global C5
global C6
global C7
global C8
global C9
global C10

global D1
global D2
global D3
global D4
global D5
global D6
global D7
global D8
global D9
global D10

list = {'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''}
list = {pop1, A1, B1, C1, D1, pop2, A2, B2, C2, D2, pop3, A3, B3, C3, D3, pop4, A4, B4, C4, D4, pop5, A5, B5, C5, D5, pop6, A6, B6, C6, D6, pop7, A7, B7, C7, D7, pop8, A8, B8, C8, D8, pop9, A9, B9, C9, D9, pop10, A10, B10, C10, D10}

for i = 1:length(list)
   disp(list(i))
   dlmwrite('MyFile.csv',list(i),'delimiter','','-append')
end


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

global pop1
global pop2
global pop3
global pop4
global pop5
global pop6
global pop7
global pop8
global pop9
global pop10

global A1
global A2
global A3
global A4
global A5
global A6
global A7
global A8
global A9
global A10

global B1
global B2
global B3
global B4
global B5
global B6
global B7
global B8
global B9
global B10

global C1
global C2
global C3
global C4
global C5
global C6
global C7
global C8
global C9
global C10

global D1
global D2
global D3
global D4
global D5
global D6
global D7
global D8
global D9
global D10

list = {'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''}
list = {pop1, A1, B1, C1, D1, pop2, A2, B2, C2, D2, pop3, A3, B3, C3, D3, pop4, A4, B4, C4, D4, pop5, A5, B5, C5, D5, pop6, A6, B6, C6, D6, pop7, A7, B7, C7, D7, pop8, A8, B8, C8, D8, pop9, A9, B9, C9, D9, pop10, A10, B10, C10, D10}

for i = 1:length(list)
   disp(list(i))
   dlmwrite('MyFile.csv',list(i),'delimiter','','-append')
end


% --- Executes on button press in buCancelTab.
function buCancelTab_Callback(hObject, eventdata, handles)
close(gcf);

% --- Executes on button press in buFinish.
function buFinish_Callback(hObject, eventdata, handles)
close(gcf);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%-1-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popup1.
function popup1_Callback(hObject, eventdata, handles)
% hObject    handle to popup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup1
global pop1
contents = get(handles.popup1,'String'); 
pop1 = contents{get(handles.popup1,'Value')};


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

global pop1
pop1 = '-'
if isempty(pop1)
    pop1 = '-' 
elseif isnan(pop1)
    pop1 = '-'
end


function editA1_Callback(hObject, eventdata, handles)
% hObject    handle to editA1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA1 as text
%        str2double(get(hObject,'String')) returns contents of editA1 as a double
global A1
A1 = str2double(get(handles.editA1,'String'));
A1 = num2str(A1)

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

global A1
A1 = '-'
if isempty(A1)
    A1 = '-'  
elseif isnan(A1)
    A1 = '-'
end


function editB1_Callback(hObject, eventdata, handles)
% hObject    handle to editB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB1 as text
%        str2double(get(hObject,'String')) returns contents of editB1 as a double
global B1
B1 = str2double(get(handles.editB1,'String'));
B1 = num2str(B1)


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

global B1
B1 = '-'
if isempty(B1)
    B1 = '-'  
elseif isnan(B1)
    B1 = '-'
end

function editC1_Callback(hObject, eventdata, handles)
% hObject    handle to editC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC1 as text
%        str2double(get(hObject,'String')) returns contents of editC1 as a double
global C1
C1 = str2double(get(handles.editC1,'String'));
C1 = num2str(C1)


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

global C1
C1 = '-'
if isempty(C1)
    C1 = '-'  
elseif isnan(C1)
    C1 = '-'
end

function editD1_Callback(hObject, eventdata, handles)
% hObject    handle to editD1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD1 as text
%        str2double(get(hObject,'String')) returns contents of editD1 as a double
global D1
D1 = str2double(get(handles.editD1,'String'));
D1 = num2str(D1)


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

global D1
D1 = '-'
if isempty(D1)
    D1 = '-'  
elseif isnan(D1)
    D1 = '-'
end


%%-2-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popup2.
function popup2_Callback(hObject, eventdata, handles)
% hObject    handle to popup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup2
global pop2
contents = get(handles.popup2,'String'); 
pop2 = contents{get(handles.popup2,'Value')};


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

global pop2
pop2 = '-'
if isempty(pop2)
    pop2 = '-' 
elseif isnan(pop2)
    pop2 = '-'
end


function editA2_Callback(hObject, eventdata, handles)
% hObject    handle to editA2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA2 as text
%        str2double(get(hObject,'String')) returns contents of editA2 as a double
global A2
A2 = str2double(get(handles.editA2,'String'));
A2 = num2str(A2)


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

global A2
A2 = '-'
if isempty(A2)
    A2 = '-'  
elseif isnan(A2)
    A2 = '-'
end


function editB2_Callback(hObject, eventdata, handles)
% hObject    handle to editB2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB2 as text
%        str2double(get(hObject,'String')) returns contents of editB2 as a double
global B2
B2 = str2double(get(handles.editB2,'String'));
B2 = num2str(B2)


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

global B2
B2 = '-'
if isempty(B2)
    B2 = '-'  
elseif isnan(B2)
    B2 = '-'
end


function editC2_Callback(hObject, eventdata, handles)
% hObject    handle to editC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC2 as text
%        str2double(get(hObject,'String')) returns contents of editC2 as a double
global C2
C2 = str2double(get(handles.editC2,'String'));
C2 = num2str(C2)


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

global C2
C2 = '-'
if isempty(C2)
    C2 = '-'  
elseif isnan(C2)
    C2 = '-'
end


function editD2_Callback(hObject, eventdata, handles)
% hObject    handle to editD2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD2 as text
%        str2double(get(hObject,'String')) returns contents of editD2 as a double
global D2
D2 = str2double(get(handles.editD2,'String'));
D2 = num2str(D2)


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

global D2
D2 = '-'
if isempty(D2)
    D2 = '-'  
elseif isnan(D2)
    D2 = '-'
end


%%-3-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popup3.
function popup3_Callback(hObject, eventdata, handles)
% hObject    handle to popup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup3
global pop3
contents = get(handles.popup3,'String'); 
pop3 = contents{get(handles.popup3,'Value')};


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

global pop3
pop3 = '-'
if isempty(pop3)
    pop3 = '-' 
elseif isnan(pop3)
    pop3 = '-'
end

function editA3_Callback(hObject, eventdata, handles)
% hObject    handle to editA3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA3 as text
%        str2double(get(hObject,'String')) returns contents of editA3 as a double
global A3
A3 = str2double(get(handles.editA3,'String'));
A3 = num2str(A3)


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

global A3
A3 = '-'
if isempty(A3)
    A3 = '-'  
elseif isnan(A3)
    A3 = '-'
end


function editB3_Callback(hObject, eventdata, handles)
% hObject    handle to editB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB3 as text
%        str2double(get(hObject,'String')) returns contents of editB3 as a double
global B3
B3 = str2double(get(handles.editB3,'String'));
B3 = num2str(B3)


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

global B3
B3 = '-'
if isempty(B3)
    B3 = '-'  
elseif isnan(B3)
    B3 = '-'
end


function editC3_Callback(hObject, eventdata, handles)
% hObject    handle to editC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC3 as text
%        str2double(get(hObject,'String')) returns contents of editC3 as a double
global C3
C3 = str2double(get(handles.editC3,'String'));
C3 = num2str(C3)


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

global C3
C3 = '-'
if isempty(C3)
    C3 = '-'  
elseif isnan(C3)
    C3 = '-'
end


function editD3_Callback(hObject, eventdata, handles)
% hObject    handle to editD3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD3 as text
%        str2double(get(hObject,'String')) returns contents of editD3 as a double
global D3
D3 = str2double(get(handles.editD3,'String'));
D3 = num2str(D3)


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

global D3
D3 = '-'
if isempty(D3)
    D3 = '-'  
elseif isnan(D3)
    D3 = '-'
end


%%-4-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popup4.
function popup4_Callback(hObject, eventdata, handles)
% hObject    handle to popup4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup4
global pop4
contents = get(handles.popup4,'String'); 
pop4 = contents{get(handles.popup4,'Value')};


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

global pop4
pop4 = '-'
if isempty(pop4)
    pop4 = '-' 
elseif isnan(pop4)
    pop4 = '-'
end


function editA4_Callback(hObject, eventdata, handles)
% hObject    handle to editA4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA4 as text
%        str2double(get(hObject,'String')) returns contents of editA4 as a double
global A4
A4 = str2double(get(handles.editA4,'String'));
A4 = num2str(A4)


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

global A4
A4 = '-'
if isempty(A4)
    A4 = '-'  
elseif isnan(A4)
    A4 = '-'
end


function editB4_Callback(hObject, eventdata, handles)
% hObject    handle to editB4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB4 as text
%        str2double(get(hObject,'String')) returns contents of editB4 as a double
global B4
B4 = str2double(get(handles.editB4,'String'));
B4 = num2str(B4)


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

global B4
B4 = '-'
if isempty(B4)
    B4 = '-'  
elseif isnan(B4)
    B4 = '-'
end


function editC4_Callback(hObject, eventdata, handles)
% hObject    handle to editC4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC4 as text
%        str2double(get(hObject,'String')) returns contents of editC4 as a double
global C4
C4 = str2double(get(handles.editC4,'String'));
C4 = num2str(C4)


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

global C4
C4 = '-'
if isempty(C4)
    C4 = '-'  
elseif isnan(C4)
    C4 = '-'
end


function editD4_Callback(hObject, eventdata, handles)
% hObject    handle to editD4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD4 as text
%        str2double(get(hObject,'String')) returns contents of editD4 as a double
global D4
D4 = str2double(get(handles.editD4,'String'));
D4 = num2str(D4)


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

global D4
D4 = '-'
if isempty(D4)
    D4 = '-'  
elseif isnan(D4)
    D4 = '-'
end


%%-5-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popup5.
function popup5_Callback(hObject, eventdata, handles)
% hObject    handle to popup5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup5
global pop5
contents = get(handles.popup5,'String'); 
pop5 = contents{get(handles.popup5,'Value')};


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

global pop5
pop5 = '-'
if isempty(pop5)
    pop5 = '-' 
elseif isnan(pop5)
    pop5 = '-'
end


function editA5_Callback(hObject, eventdata, handles)
% hObject    handle to editA5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA5 as text
%        str2double(get(hObject,'String')) returns contents of editA5 as a double
global A5
A5 = str2double(get(handles.editA5,'String'));
A5 = num2str(A5)


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

global A5
A5 = '-'
if isempty(A5)
    A5 = '-'  
elseif isnan(A5)
    A5 = '-'
end


function editB5_Callback(hObject, eventdata, handles)
% hObject    handle to editB5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB5 as text
%        str2double(get(hObject,'String')) returns contents of editB5 as a double
global B5
B5 = str2double(get(handles.editB5,'String'));
B5 = num2str(B5)


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

global B5
B5 = '-'
if isempty(B5)
    B5 = '-'  
elseif isnan(B5)
    B5 = '-'
end


function editC5_Callback(hObject, eventdata, handles)
% hObject    handle to editC5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC5 as text
%        str2double(get(hObject,'String')) returns contents of editC5 as a double
global C5
C5 = str2double(get(handles.editC5,'String'));
C5 = num2str(C5)


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

global C5
C5 = '-'
if isempty(C5)
    C5 = '-'  
elseif isnan(C5)
    C5 = '-'
end


function editD5_Callback(hObject, eventdata, handles)
% hObject    handle to editD5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD5 as text
%        str2double(get(hObject,'String')) returns contents of editD5 as a double
global D5
D5 = str2double(get(handles.editD5,'String'));
D5 = num2str(D5)


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

global D5
D5 = '-'
if isempty(D5)
    D5 = '-'  
elseif isnan(D5)
    D5 = '-'
end


%%-6-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popup6.
function popup6_Callback(hObject, eventdata, handles)
% hObject    handle to popup6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup6
global pop6
contents = get(handles.popup6,'String'); 
pop6 = contents{get(handles.popup6,'Value')};


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

global pop6
pop6 = '-'
if isempty(pop6)
    pop6 = '-' 
elseif isnan(pop6)
    pop6 = '-'
end


function editA6_Callback(hObject, eventdata, handles)
% hObject    handle to editA6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA6 as text
%        str2double(get(hObject,'String')) returns contents of editA6 as a double
global A6
A6 = str2double(get(handles.editA6,'String'));
A6 = num2str(A6)


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

global A6
A6 = '-'
if isempty(A6)
    A6 = '-'  
elseif isnan(A6)
    A6 = '-'
end


function editB6_Callback(hObject, eventdata, handles)
% hObject    handle to editB6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB6 as text
%        str2double(get(hObject,'String')) returns contents of editB6 as a double
global B6
B6 = str2double(get(handles.editB6,'String'));
B6 = num2str(B6)


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

global B6
B6 = '-'
if isempty(B6)
    B6 = '-'  
elseif isnan(B6)
    B6 = '-'
end


function editC6_Callback(hObject, eventdata, handles)
% hObject    handle to editC6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC6 as text
%        str2double(get(hObject,'String')) returns contents of editC6 as a double
global C6
C6 = str2double(get(handles.editC6,'String'));
C6 = num2str(C6)


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

global C6
C6 = '-'
if isempty(C6)
    C6 = '-'  
elseif isnan(C6)
    C6 = '-'
end


function editD6_Callback(hObject, eventdata, handles)
% hObject    handle to editD6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD6 as text
%        str2double(get(hObject,'String')) returns contents of editD6 as a double
global D6
D6 = str2double(get(handles.editD6,'String'));
D6 = num2str(D6)


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

global D6
D6 = '-'
if isempty(D6)
    D6 = '-'  
elseif isnan(D6)
    D6 = '-'
end


%%-7-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popup7.
function popup7_Callback(hObject, eventdata, handles)
% hObject    handle to popup7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popup7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup7

% --- Executes during object creation, after setting all properties.
global pop7
contents = get(handles.popup7,'String'); 
pop7 = contents{get(handles.popup7,'Value')};


function popup7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global pop7
pop7 = '-'
if isempty(pop7)
    pop7 = '-' 
elseif isnan(pop7)
    pop7 = '-'
end


function editA7_Callback(hObject, eventdata, handles)
% hObject    handle to editA7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA7 as text
%        str2double(get(hObject,'String')) returns contents of editA7 as a double
global A7
A7 = str2double(get(handles.editA7,'String'));
A7 = num2str(A7)


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

global A7
A7 = '-'
if isempty(A7)
    A7 = '-'  
elseif isnan(A7)
    A7 = '-'
end


function editB7_Callback(hObject, eventdata, handles)
% hObject    handle to editB7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB7 as text
%        str2double(get(hObject,'String')) returns contents of editB7 as a double
global B7
B7 = str2double(get(handles.editB7,'String'));
B7 = num2str(B7)


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

global B7
B7 = '-'
if isempty(B7)
    B7 = '-'  
elseif isnan(B7)
    B7 = '-'
end


function editC7_Callback(hObject, eventdata, handles)
% hObject    handle to editC7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC7 as text
%        str2double(get(hObject,'String')) returns contents of editC7 as a double
global C7
C7 = str2double(get(handles.editC7,'String'));
C7 = num2str(C7)


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

global C7
C7 = '-'
if isempty(C7)
    C7 = '-'  
elseif isnan(C7)
    C7 = '-'
end


function editD7_Callback(hObject, eventdata, handles)
% hObject    handle to editD7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD7 as text
%        str2double(get(hObject,'String')) returns contents of editD7 as a double
global D7
D7 = str2double(get(handles.editD7,'String'));
D7 = num2str(D7)


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

global D7
D7 = '-'
if isempty(D7)
    D7 = '-'  
elseif isnan(D7)
    D7 = '-'
end


%%-8-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popup8.
function popup8_Callback(hObject, eventdata, handles)
% hObject    handle to popup8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popup8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup8

% --- Executes during object creation, after setting all properties.
global pop8
contents = get(handles.popup8,'String'); 
pop8 = contents{get(handles.popup8,'Value')};


function popup8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global pop8
pop8 = '-'
if isempty(pop8)
    pop8 = '-' 
elseif isnan(pop8)
    pop8 = '-'
end


function editA8_Callback(hObject, eventdata, handles)
% hObject    handle to editA8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA8 as text
%        str2double(get(hObject,'String')) returns contents of editA8 as a double
global A8
A8 = str2double(get(handles.editA8,'String'));
A8 = num2str(A8)


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

global A8
A8 = '-'
if isempty(A8)
    A8 = '-'  
elseif isnan(A8)
    A8 = '-'
end


function editB8_Callback(hObject, eventdata, handles)
% hObject    handle to editB8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB8 as text
%        str2double(get(hObject,'String')) returns contents of editB8 as a double
global B8
B8 = str2double(get(handles.editB8,'String'));
B8 = num2str(B8)


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

global B8
B8 = '-'
if isempty(B8)
    B8 = '-'  
elseif isnan(B8)
    B8 = '-'
end


function editC8_Callback(hObject, eventdata, handles)
% hObject    handle to editC8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC8 as text
%        str2double(get(hObject,'String')) returns contents of editC8 as a double
global C8
C8 = str2double(get(handles.editC8,'String'));
C8 = num2str(C8)


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

global C8
C8 = '-'
if isempty(C8)
    C8 = '-'  
elseif isnan(C8)
    C8 = '-'
end


function editD8_Callback(hObject, eventdata, handles)
% hObject    handle to editD8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD8 as text
%        str2double(get(hObject,'String')) returns contents of editD8 as a double
global D8
D8 = str2double(get(handles.editD8,'String'));
D8 = num2str(D8)


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

global D8
D8 = '-'
if isempty(D8)
    D8 = '-'  
elseif isnan(D8)
    D8 = '-'
end


%%-9-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popup9.
function popup9_Callback(hObject, eventdata, handles)
% hObject    handle to popup9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popup9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup9

% --- Executes during object creation, after setting all properties.
global pop9
contents = get(handles.popup9,'String'); 
pop9 = contents{get(handles.popup9,'Value')};


function popup9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global pop9
pop9 = '-'
if isempty(pop9)
    pop9 = '-' 
elseif isnan(pop9)
    pop9 = '-'
end


function editA9_Callback(hObject, eventdata, handles)
% hObject    handle to editA9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA9 as text
%        str2double(get(hObject,'String')) returns contents of editA9 as a double
global A9
A9 = str2double(get(handles.editA9,'String'));
A9 = num2str(A9)


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

global A9
A9 = '-'
if isempty(A9)
    A9 = '-'  
elseif isnan(A9)
    A9 = '-'
end


function editB9_Callback(hObject, eventdata, handles)
% hObject    handle to editB9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB9 as text
%        str2double(get(hObject,'String')) returns contents of editB9 as a double
global B9
B9 = str2double(get(handles.editB9,'String'));
B9 = num2str(B9)


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

global B9
B9 = '-'
if isempty(B9)
    B9 = '-'  
elseif isnan(B9)
    B9 = '-'
end


function editC9_Callback(hObject, eventdata, handles)
% hObject    handle to editC9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC9 as text
%        str2double(get(hObject,'String')) returns contents of editC9 as a double
global C9
C9 = str2double(get(handles.editC9,'String'));
C9 = num2str(C9)


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

global C9
C9 = '-'
if isempty(C9)
    C9 = '-'  
elseif isnan(C9)
    C9 = '-'
end


function editD9_Callback(hObject, eventdata, handles)
% hObject    handle to editD9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD9 as text
%        str2double(get(hObject,'String')) returns contents of editD9 as a double
global D9
D9 = str2double(get(handles.editD9,'String'));
D9 = num2str(D9)


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

global D9
D9 = '-'
if isempty(D9)
    D9 = '-'  
elseif isnan(D9)
    D9 = '-'
end


%%-10-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popup10.
function popup10_Callback(hObject, eventdata, handles)
% hObject    handle to popup10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popup10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup10

% --- Executes during object creation, after setting all properties.
global pop10
contents = get(handles.popup10,'String'); 
pop10 = contents{get(handles.popup10,'Value')};


function popup10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global pop10
pop10 = '-'
if isempty(pop10)
    pop10 = '-' 
elseif isnan(pop10)
    pop10 = '-'
end


function editA10_Callback(hObject, eventdata, handles)
% hObject    handle to editA10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA10 as text
%        str2double(get(hObject,'String')) returns contents of editA10 as a double
global A10
A10 = str2double(get(handles.editA10,'String'));
A10 = num2str(A10)


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

global A10
A10 = '-'
if isempty(A10)
    A10 = '-'  
elseif isnan(A10)
    A10 = '-'
end


function editB10_Callback(hObject, eventdata, handles)
% hObject    handle to editB10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB10 as text
%        str2double(get(hObject,'String')) returns contents of editB10 as a double
global B10
B10 = str2double(get(handles.editB10,'String'));
B10 = num2str(B10)


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

global B10
B10 = '-'
if isempty(B10)
    B10 = '-'  
elseif isnan(B10)
    B10 = '-'
end


function editC10_Callback(hObject, eventdata, handles)
% hObject    handle to editC10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC10 as text
%        str2double(get(hObject,'String')) returns contents of editC10 as a double
global C10
C10 = str2double(get(handles.editC10,'String'));
C10 = num2str(C10)


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

global C10
C10 = '-'
if isempty(C10)
    C10 = '-'  
elseif isnan(C10)
    C10 = '-'
end


function editD10_Callback(hObject, eventdata, handles)
% hObject    handle to editD10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editD10 as text
%        str2double(get(hObject,'String')) returns contents of editD10 as a double
global D10
D10 = str2double(get(handles.editD10,'String'));
D10 = num2str(D10)


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

global D10
D10 = '-'
if isempty(D10)
    D10 = '-'  
elseif isnan(D10)
    D10 = '-'
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
