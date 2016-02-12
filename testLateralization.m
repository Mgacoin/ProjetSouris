function [vecPos, vecDirPos, vecCorrect] = testLateralization ()


Pos = 0;
DirPos = 0;
vecPos = []
vecDirPos = []
vecCorrect = []
while DirPos <= 0.9
    NumberList = [0.2 0.7]
    vecCorrect = [vecCorrect; NumberList(1 + floor(rand * length(NumberList)))]
    x = rand()
    if x <0.5 
        Pos = 0.2
    else
        Pos = 0.7
    end
    DirPos = DirPos+0.1;
    vecPos = [vecPos; Pos]
    vecDirPos = [vecDirPos; DirPos]
end
disp(vecPos)
disp(vecCorrect)

end