function [nbBox] = settings(varargin)
%Retrieves data from the Settings.xls file,
%for inputs/outputs and box's number settings
%@author: Maëva GACOIN
fileSet = 'Settings.xlsx';%the file we read
sheet = 1;%the sheet we read
%xlRange = 'B3';%the cell/cell's range we read


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function that retrieves data from Excel sheet%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global inRack inPort inOffset outRack outPort outOffset outValue
inRack = xlsread(fileSet,1,'B3')
inPort = xlsread(fileSet,1,'B4')
inOffset = xlsread(fileSet,1,'B5')

outRack = xlsread(fileSet,1,'B8')
outPort = xlsread(fileSet, 1, 'B9')
outOffset = xlsread(fileSet, 1, 'B10')
outValue = xlsread(fileSet, 1, 'B11')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that counts the number of boxes%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         function  [nbBox] = getNbBox(varargin)
%Reads the first column and records it as a string
[~,findBox,~] = xlsread(fileSet,1,'A:A')
%Regular expression that searches the string "Box" in the previous
%string and counts the number of occurences in the variable nbBox
nbBox = sum(~cellfun('isempty',regexp(findBox,'^Box')))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function that converts the Output signal%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         function convertSignal()
%CONVERSION DU SIGNAL - I/O
%A terme, il s'agira de la variable qui récupèrera le calllib
myVal=255

%I/O values
bit=[1 2 4 8 16 32 64 128]

%Search and converter
while myVal - max(bit(bit<=myVal)) >0
    [~,pos] = (max(bit(bit<=myVal)))
    sprintf ('Input %d',pos) % STOCKER pos DANS UNE LISTE
    myVal = myVal - max(bit(bit<=myVal))
    if myVal - max(bit(bit<=myVal))== 0
        [~,pos] = (max(bit(bit<=myVal)))
        sprintf ('Input %d',pos) % STOCKER pos DANS UNE LISTE
        break
    end
end



