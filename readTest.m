function [p] = readTest ()
%--- Library declaration ---
%
% hfile =(fullfile(matlabroot, 'lib','win32', '704IO.h'))
% %loadlibrary('704IO',hfile,'alias','lib')
% loadlibrary('704IO.dll', hfile);

location = 'C:\Users\admin\Documents\MATLAB\';
mylib = [location '704IO.lib'];
mex('-g', 'Test704.cpp', mylib)


% for i = [0:1:3]
%     th = timer('startfcn','tic','timerfcn','toc',...
%         'period',60,'executionmode','fixedrate');
%     start(th);
%     pause(60);
%     stop(th);
%     calllib('x704IO','PortWrite',1,792,0,1);%Activates the output
%     calllib('x704IO','PortWrite',1,792,0,0);%Deactivates the output
%     stop(th);
%     delete(th);
% end

%
% a = 1;
% b = 780;
% c = -1;
%
% p = calllib('x704IO','PortRead',a,b,c);
% setdatatype(p,'uint8Ptr',1)
% p.Value
% p.datatype

% p = calllib('x704IO','PortRead',1,780,-1)
% setdatatype(p,'doublePtr',1)
% p.Value
% get(p)

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Function that converts the Output signal%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %-- PORTREAD --%
% 
% myVal = double(Test704()) %Resoudre pbr lecture lente >> addition des inputs
% %myVal = 6
% %         function convertSignal()
% %CONVERSION DU SIGNAL - I/O
% %I/O values
% bit=[1 2 4 8 16 32 64 128]
% %Search and converter
% while myVal-max(bit(bit<=myVal)) >= 0
%     [~,pos] = (max(bit(bit<=myVal)))
%     sprintf ('Input %d',pos) % STOCKER pos DANS UNE LISTE
%     myVal = myVal - max(bit(bit<=myVal))
%     if myVal - max(bit(bit<=myVal))== 0
%         [~,pos] = (max(bit(bit<=myVal)))
%         sprintf ('Input %d',pos) % STOCKER pos DANS UNE LISTE
%         break
%     end
% end

%-- PORTWRITE --%
%calllib('x704IO','PortWrite',1,792,0,0);

%myVal = double(Test704())
portVal = 1;
rackVal = 780;
offsetVal = -1;
myVal = double(Test704(portVal, rackVal, offsetVal))




