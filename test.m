function m=test(t)
%mex  C:\Users\admin\Documents\MATLAB\Test704\Test704.cpp 
%mex C:\Users\admin\Documents\MATLAB\MFCApplication1\MFCApplication1\MainFrm.cpp

% location = 'C:\Program Files\MATLAB\R2011b\extern\lib\win64\microsoft\';
% lapacklib = [location 'libmwlapack.lib'];
% blaslib = [location 'libmwblas.lib'];
% mex('-v', '-largeArrayDims', 'qpip.c','qpip_sub.c', blaslib, lapacklib)
% 
%  location = 'C:\Users\admin\Documents\MATLAB\';
%  mylib = [location '704IO.lib'];
%  mex('-g', 'Test704.cpp', mylib)
% x = Test704()
% 
% if x == 1
%     sprintf ok
% else
%     sprintf no
% end

% 
% n=1
% r=1
% while n < 5 && r < 5
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
% end
% %%%%%%%%%%%%%%%%%%%%%%
% %methode 1
n = 1;
r = 0;
 while n < 5
     myVal = double(Test704(1, 780, -1))
     if myVal == 1
         n = n +1
     end
     t.Data = { 'Session timer' n ;}
     save('testSave1.mat','n') %The matfile
     m = matfile('testSave1.mat')
     %pause(0.25);
     drawnow
 end

 while r < 5
    myVal = double(Test704(1, 780, -1))
    if myVal == 2
         r = r +1
    end
  %  if r == 0
   %     t.Data(end+1,:) = { 'Session timerbis' r ;}
   % else
        t.Data = { 'Session timerbis' r ;}
  %  end
    save('testSave1.mat','r','-append') %The matfile
    m = matfile('testSave1.mat')
    drawnow
 end
 

 

%%%%%%%%%%%%%%%%%%%%%%%%%
%methode 2
% t = evalin('caller','t')
% 
%     n = 1;
%     while n < 5
%         newVal = input('Enter a number:');
%         data = get(t,'Data');
%         set(t,'Data', [data; newVal]);
%         n = n + 1;
%     end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%r = 4;
% function theVariable()
% n = 1;
% while n < 5
%     %on récupère la variable de la table/matrice
%     n = n + 1;
%     %on enregistre la variable dans une table/matrice
%     %on affiche la variable
%     n = 0; % on "vide" la variable
% end%save('testSave1.mat','r')



