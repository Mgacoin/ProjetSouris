function varargout = welcomeWindow(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @welcomeWindow_OpeningFcn, ...
                   'gui_OutputFcn',  @welcomeWindow_OutputFcn, ...
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


% --- Executes just before welcomeWindow is made visible.
function welcomeWindow_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for welcomeWindow
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



function varargout = welcomeWindow_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in buNext.
function buNext_Callback(hObject, eventdata, handles)
global numbBox
numbBox = str2double(get(handles.editNbBox,'String'))
if isnan(numbBox) %numerical value check
    labErrorNum = uicontrol('Style','text',...
        'BackgroundColor',[0.94 0.94 0.94],...
        'ForegroundColor',[1.0 0.0 0.0],...
        'FontWeight','bold',...
        'Position',[255 74 180 15],...
        'String','Please enter a numeric value');
elseif numbBox<=0 %positive value check
    labErrorNeg = uicontrol('Style','text',...
        'BackgroundColor',[0.94 0.94 0.94],...
        'ForegroundColor',[1.0 0.0 0.0],...
        'FontWeight','bold',...
        'Position',[255 74 180 15],...
        'String','Please enter a positive value');
else
    close(gcf)
    open(firstWindow);
end


% --- Executes on button press in buClose.
function buClose_Callback(hObject, eventdata, handles)
close(gcf)
