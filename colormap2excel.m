function colormap2excel

if exist(fullfile(tempdir,'colormap.xlsx'),'file')==2
    delete(fullfile(tempdir,'colormap.xlsx'));
end

Excel = actxserver('Excel.Application');

Excel.Visible = false;

Workbook = Excel.Workbooks.Add;

N = 64;

a{1} = autumn(N);
a{2} = bone(N);
a{3} = colorcube(N);
a{4} = cool(N);
a{5} = copper(N);
a{6} = flag(N);
a{7} = gray(N);
a{8} = hot(N);
a{9} = hsv(N);
a{10} = jet(N);
a{11} = lines(N);
a{12} = pink(N);
a{13} = prism(N);
a{14} = spring(N);
a{15} = summer(N);
a{16} = white(N);
a{17} = winter(N);

for k = 1:numel(a)
      
    for n = 1:N   

        rgb = a{k}(n,:);
       
        Excel.ActiveSheet.get('Cells', n, 2*k-1).Interior.Color = 256.^(0:2)*round(255*rgb(:));

    end
    
end

Excel.Cells.ColumnWidth = 2.5;

Workbook.SaveAs(fullfile(tempdir,'colormap.xlsx'));

Workbook.Close;

Excel.Quit;

delete(Excel)
