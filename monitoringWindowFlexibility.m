function varargout = monitoringWindowFlexibility(varargin)
% Last Modified by GUIDE v2.5 12-Aug-2015 11:31:13
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @monitoringWindowFlexibility_OpeningFcn, ...
                   'gui_OutputFcn',  @monitoringWindowFlexibility_OutputFcn, ...
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


function monitoringWindowFlexibility_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

tabgp = uitabgroup('Position',[.01 .20 0.98 .75]); drawnow;
    %For the first box 
tabMonitoringFlex1 = uitab(tabgp, 'Title', 'Box1');   
    
    textStateMouse1 = uicontrol('Style','text',...
    'parent',tabMonitoringFlex1,...
    'Backgroundcolor',[0.94 0.94 0.94],...
    'Position',[5 500 160 36],...
    'visible', 'on', ...
    'String','The mouse is currently in state :');
    
    buTabBox1 = uicontrol('Style','pushButton',...
    'parent',tabMonitoringFlex1,...
    'Backgroundcolor',[0.94 0.94 0.94],...
    'Position',[5 470 70 30],...
    'visible', 'on', ...
    'String','See Tab');  
     
    buPerformBox1 = uicontrol('Style','pushButton',...
    'parent',tabMonitoringFlex1,...
    'Backgroundcolor',[0.94 0.94 0.94],...
    'Position',[90 470 150 30],...
    'visible', 'on', ...
    'String','See Performance Graph');    

     lateralizeAxes1 = axes('parent',tabMonitoringFlex1,...
         'Position',[0.1,0.1,0.7,0.7]);
     axis off
    
    buLateralizeBox1 = uicontrol('Style','pushButton',...
    'parent',tabMonitoringFlex1,...
    'Backgroundcolor',[0.94 0.94 0.94],...
    'Position',[255 470 150 30],...
    'visible', 'on', ...
    'String','See Lateralization Graph',...
    'Callback',@callLum);
    



function varargout = monitoringWindowFlexibility_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function callLum(src,event)

axis on
[Pos, DirPos, Correct] = testLateralization () % AU LIEU DE RELANCER LUMINANCE(), CHERCHER LES DONNEES DANS LA MATRICE


for i = 1:length(Pos)
    if Correct(i) == Pos(i)
        c = 'b+';
    else
        c = 'r+';
    end

    plot(DirPos(i),Pos(i),c)
    axis([0 1 0 1])
    set(gca,'YTick',[0 0.2 0.4 0.6 0.8 1]) 
    ylabel('Gauche            -            Droite');
    hold on
end

%switch to plot tab
% set (tabgp,'SelectedTab',tabMonitoringFlex1);
drawnow


