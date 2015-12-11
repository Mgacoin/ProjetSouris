function testParameters()
% -- pour portRead
location = 'C:\Users\admin\Documents\MATLAB\';
mylib = [location '704IO.lib'];
mex('-g', 'Test704.cpp', mylib)

% -- pour portWrite
hfile =(fullfile(matlabroot, 'lib','win32', '704IO.h'))
loadlibrary('704IO.dll', hfile);

myVal = double(Test704())

%Faire une boucle qui change de box
if myVal == 1 
    if strcmp(Input1Box1,noseP)== 1
        nosePoke = 1
    elseif strcmp (Input1Box1,leftL) == 1
        leftLever = 1
    elseif strcmp (Input1Box1,rightL) ==1
        rightLever = 1
    end 
elseif myVal == 2
    if strcmp(Input2Box1,noseP)== 1
        nosePoke = 1
    elseif strcmp (Input2Box1,leftL) == 1
        leftLever = 1
    elseif strcmp (Input2Box1,rightL) ==1
        rightLever = 1
    end
elseif myVal == 255
    sprintf 'Every/no inputs'
end
    