function varargout = storageTest(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @storageTest_OpeningFcn, ...
                   'gui_OutputFcn',  @storageTest_OutputFcn, ...
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
location = 'C:\Users\admin\Documents\MATLAB\';
mylib = [location '704IO.lib'];
mex('-g', 'Test704.cpp', mylib)

% --- Executes just before storageTest is made visible.
function storageTest_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% n=1
% r=1
 
%     myVal = double(Test704(1, 780, -1))
%     if myVal == 1
%         n = n + 1
%     end
%     if myVal == 4
%         r = r + 1
%     end
%     %d = [n];
%     save('testSave1.mat')%Fichier temporaire
%     m = matfile('testSave1.mat')

    %d = [0;0]

%%%%%%%%%%%%%%%%%%%%%%
%methode 1
    %m = test()
    %d = [m.n;m.r]
     t = uitable('ColumnWidth',{50}, ...
        'Position',[100 100 461 146],...
        'Tag', 't',...
        'visible','off');
%     t.Position(3) = t.Extent(3);
%     t.Position(4) = t.Extent(4);
    
%%AFFICHER LE TABLEAU REPRENANT LES DONNEES EN APPUYANT SUR UN BOUTON
     test(t)
     drawnow

%%%%%%%%%%%%%%%%%%%%%%
%methode2
% data = [1];
%     t = uitable('Data',data,'ColumnWidth',{50});
%     test()
%%%%%%%%%%%%%%%%%%%%%




% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = storageTest_OutputFcn(~, eventdata, handles) 
varargout{1} = handles.output;



% function theVariable()
% n = 1;
% while n < 5
%     %on récupère la variable de la table/matrice
%     n = n + 1;
%     %on enregistre la variable dans une table/matrice
%     %on affiche la variable
%     n = 0; % on "vide" la variable
% end





