function [matrix, header] = test_list ()

header = {'Stage', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time', 'Variable', 'Value', 'Time'}
list = {'Stage', 'Session timer', '8', 'nothing', 'Current state', '4', 'nothing'}
display list

%for i = 1:length(list)
%    display list[i]
%end

while length(list) < 46
    list = [list, {''}]
end
%display list

matrix = {}
matrix = [matrix; list]
display matrix
