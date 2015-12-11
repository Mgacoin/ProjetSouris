function [listRand] = randomizer()

countOccur=0
countFollow = 0
occurLeftLever=0
occurRightLever=0

while countFollow < 500 % We check that the same value does not appear more than 3 times in a row
    while countOccur < 500 % We check that the same value does not appear more than 7 times in 10 trials
        for fourty = 1:1:40
            aleat = rand() % To randomly obtain a value of 2 or 3
            if aleat > 0.5
                randVal=2
            else
                randVal=4
            end
            listRand(fourty) = randVal; % listRand is a list of 40 random values
        end
        occurLeftLever = histc(listRand,2) % Give the number of occurence of the value/char
        occurRightLever = histc(listRand,4)
        
        if occurLeftLever > 12 && occurLeftLever <=28 % The value appears more than 3 times over 10 trials
            break
        end
        countOccur = countOccur+1
    end
    
    followLeftLever = [2 2 2 2] % REMPLACER VALEURS PAR VARIABLE
    followRightLever = [4 4 4 4]
    if strfind(listRand, followLeftLever)
        countFollow = countFollow + 1
    elseif strfind(listRand, followRightLever)
        countFollow = countFollow + 1
    else
        break
    end
end