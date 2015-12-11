function m = luminance (t)
%function [pos, dirPos] = luminance () % to get lateralization graph
%--- Library declaration ---
%-- For portWrite --
hfile =(fullfile(matlabroot, 'lib','win32', '704IO.h'))
loadlibrary('704IO',hfile,'alias','lib')

%-- For portRead --
% The file has to be created at each Test704() call is Rack, Port and
% Offset change!
location = 'C:\Users\admin\Documents\MATLAB\';
mylib = [location '704IO.lib'];
mex('-g', 'Test704.cpp', mylib)

%--- Variables initialization ---
%Pellet retrieval increment
nbPelletRetrievalP1 = 0;
nbPelletRetrievalP2 = 0;
nbPelletRetrievalP3 = 0;
nbPelletRetrievalP4 = 0;

%To display the state number
stateNum = 0;
%Box and devices parameters
nosePoke = 0; % boolean: false (0) when nose poke is not activated
leftLever = 0; % idem
rightLever = 0; % idem
pelletVal = 1;
box = 0;
portVal = 1;
rackVal = 780;
offsetVal = -1;
pelletVal = 1;% 2 et 3 sont assignés aux ARDUINO
nosePokeVal  = 1;
leftLeverVal = 2;
rightLeverVal = 4;


state = 'start';
underState3 = 'US3S1'; % for "Under State 3, Stage 1"
underState4 = 'US4S1';
underState5 = 'US5S1';

%--- State machine ---
while(1)
    %pause(0.1);	% wait between each cycle >> pas forcément besoin car ralenti le programme
    switch state
        case 'start'
            % mainTimer = clock; % starts main timer
            state = 'stage3';
            stateNum = 0;
             t.Data = { 'Session timer' nbPelletRetrievalP1 'nothing' ; 'Current state' stateNum 'nothing';}% The first value is the first column, the second value is in the second column... semicolons indicate a new row 
            % fprintf(logfile_fid,'%s\t%s\n',datestr(clock, 'dd-mmm-YYYY HH:MM:SS.FFF'),'Entering Phase 1');
        case 'stage1'
            stateNum = 1;
            %--- Stage 1 ---
            while nbPelletRetrievalP1 < 5 %&& nbPelletRetrievalBox2 < 5% La premiere ne doit pas compter
                %                 box = box + 1 % Box's change
                %                 if box == 3
                %                     box = 1
                %                 end
                
                %if box == 1 % The box number is incremented at the end of each loop 1 -> 2 -> 1 -> 2 ...
                %                 portVal = 1;
                %                 rackVal = 780;
                %                 offsetVal = -1;
                %                 pelletVal = 1;% 2 et 3 sont assignés aux ARDUINO
                %                 nosePokeVal  = 1;
                %                 leftLeverVal = 2;
                %                 rightLeverVal = 4;
                %                 elseif box == 2
                %                     portVal = 1;
                %                     rackVal = 781;
                %                     offsetVal = -1;
                %                     pelletVal = 4; % 5 et 6 sont assignés aux ARDUINO
                %                     nosePokeVal = 8; %par exemple
                %                     leftLeverVal = 16;
                %                     rightLeverVal = 32;
                %                 end
                
                pause(5); % PBR: le programme attend 60 secondes
                calllib('lib','PortWrite',1,792,0,pelletVal);%Activates the output
                calllib('lib','PortWrite',1,792,0,0);%Deactivates the output
                
                myVal = double(Test704(portVal, rackVal, offsetVal)) %où les valeurs sont modifiés dans le if box == ...
                if myVal == nosePokeVal
                    nosePoke = 1;
                else
                    nosePoke = 0;
                end
                if nosePoke == 1
                    %if box == 1%nosePoke est la valeur récupée par mex
                    nbPelletRetrievalP1 = nbPelletRetrievalP1 + 1
                    % elseif box == 2
                    %     nbPelletRetrievalBox2 = nbPelletRetrievalBox2 + 1
                    % end
                end
                t.Data = { 'Session timer' 'session timer here' 'nothing' 'Pellet retrievedP1' nbPelletRetrievalP1 'nothing';...
                    'Current state' stateNum 'nothing' 'State final durationP1' 'duration here' 'nothing';...
                    'State timer' 'state timer here' 'nothing' 'nothing' 'nothing' 'nothing'};
                drawnow
            end
           % nbPelletRetrieval = 0; %A ce stade, nbPelletRetrievalP1 = 5
            while nbPelletRetrievalP1 < 10 
                myVal = double(Test704(portVal,rackVal,offsetVal))
                if myVal == nosePokeVal
                    nosePoke = 1;
                else
                    nosePoke = 0;
                end
                if nosePoke == 1
                    nbPelletRetrievalP1 = nbPelletRetrievalP1 + 1;
                    calllib('lib','PortWrite',1,792,0,pelletVal);
                    calllib('lib','PortWrite',1,792,0,0);
                end
                t.Data = { 'Session timer' 'session timer here' 'nothing' 'Pellet retrievedP1' nbPelletRetrievalP1 'nothing';...
                    'Current state' stateNum 'nothing' 'State final durationP1' 'duration here' 'nothing';...
                    'State timer' 'state timer here' 'nothing' 'nothing' 'nothing' 'nothing'};
                drawnow
            end
            state = 'stage2';
            
			while nb
        case 'stage2'
            %--- Stage 2 ---
            stateNum = 2;
            nbPelletRetrievalP2 = 0;
            pushTime = 0;
            leverTimeP2 = 0;
            tempoP2 = 0;
            timeOutP2 = 0;
            while nbPelletRetrievalP2<10 
                myVal = double(Test704(portVal, rackVal, offsetVal))
                if myVal == leftLeverVal
                    leftLever = 1;
                    rightLever = 0;
                elseif myVal == rightLeverVal
                    leftLever = 0;
                    rightLever = 1;
                end
                
                if leftLever == 1| rightLever == 1 % NB : il faut que ça blink !
                    leverTimeP2 = leverTimeP2 + 1;
                    if leverTimeP2 == 1
                        %calllib('lib','PortWrite',1,792,0,pelletVal); % pellet dispensation
                        calllib('lib','PortWrite',1,792,0,0);
                    end
                    tic
                    pushTime = 0; % To avoid nbPelletRetrieval to be incremented when nothing is retrieved (in case of nose pokes)
                end
                    %Initialization of left & right levers
                    leftLever = 0;
                    rightLever = 0;
                    
                    if myVal == nosePokeVal
                        nosePoke = 1;
                    else
                        nosePoke = 0;
                    end
                    if nosePoke == 1 % this condition cannot be included in the previous one
                        pushTime = pushTime + 1;
                        toc
                        tempoP2 = toc % measures the time elapsed between lever's pushing and nose poke
                        if tempoP2 <15 && pushTime == 1
                            nbPelletRetrievalP2 = nbPelletRetrievalP2 + 1 
                            nbPelletRetrievalP2
                        elseif tempoP2 > 15 && pushTime == 1
                            timeOutP2 = tempoP2; %In case of time out, this variable is created to be displayed
                            nbPelletRetrievalP2 = 0; % NB : il faut remettre à 0 si pas pris dans les temps !
                        end
                        leverTime = 0;
                    end
                     t.Data = { 'Session timer' 'session timer here' 'nothing' 'Pellet retrievedP1' nbPelletRetrievalP1 'nothing' 'Pellet retrievedP2' nbPelletRetrievalP2 tempoP2;...
                         'Current state' stateNum 'nothing' 'State final duration P1' 'state duration here' 'nothing' 'Lever pressP2' leverTimeP2 'nothing';...
                         'State timer' 'state timer here' 'nothing' 'nothing' 'nothing' 'nothing' 'Total pellet retrieved (w/ time out)' nbPelletRetrievalP1 timeOutP2;...
                         'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'State finale duration' 'state duration here' 'nothing';}
                    
                     %save('testSave1.mat','nbPelletRetrievalP2','-append') %The matfile. "-append" is to add a new variable to the matfile
                     %m = matfile('testSave1.mat')
                     drawnow
            pause(1)
            end
            state = 'stage3';
            
        case 'stage3'
            %--- Stage 3 ---
            stateNum = 3;
            tempo = 0;
            pushTime = 0;
            listRand = randomizer() % NB : fonction erronée comme on en a parlé !! il faut que le pseudo-random se fasse sur chaque essai et non a priori
            nbPelletRetrievalP3 = 1; % Beginning at 1 gives a positive value to randomizer()
            while nbPelletRetrievalP3 < 11
                pause(1)% Delay of 5secs  NB : oui mais dans ce cas met 5 et pas 1
                
                switch underState3 % So the portWrite are not mistaken
                    case 'US3S1'
                        myVal = double(Test704(portVal, rackVal, offsetVal))
                        if myVal == nosePokeVal
                            nosePoke = 1;
                        else
                            nosePoke = 0;
                        end
                        if nosePoke == 1
                            writeVal = listRand(([nbPelletRetrievalP3])) % The randomised value of the PortWrite %NB: Les deux écrans s'allument à ce stade.
                            calllib('lib','PortWrite',1,792,0,writeVal); %ARDUINO on %A REACTIVER !!!!! %NB : les deux écrans blanc ici donc pourquoi un seul output ??
                            tic
                            underState3 = 'US3S2';
                        end
                        nosePoke = 0;
                    case 'US3S2'
                        myVal = double(Test704(portVal, rackVal, offsetVal))
                        if myVal == leftLeverVal
                            leftLever = 1;
                            rightLever = 0;
                        elseif myVal == rightLeverVal
                            leftLever = 0;
                            rightLever = 1;
                        end
                        if leftLever == 1 | rightLever == 1 % One of the levers is pressed % NB : il faut que ça blink !
                            toc
                            tempoP3 = toc
                            tic
                            if tempoP3 < 60
                                underState3 = 'US3S3'
                                pushTime =0;
                            else
                                calllib('lib','PortWrite',1,792,0,0);%ARDUINO off
                                underState3 = 'US3S1'; % The mouse has to nose poke again
                            end
                        end
                        leftLever = 0;
                        rightLever = 0;
                        
                    case 'US3S3'
                        %pause(5)
                        myVal = double(Test704(portVal, rackVal, offsetVal))
                        if myVal == nosePokeVal
                            nosePoke = 1;
                        else
                            nosePoke = 0;
                        end
                        if nosePoke == 1
                            pushTime = pushTime + 1;
                            toc
                            tempo2P3 = toc
                            if tempo2P3 <15 && pushTime == 1
                                calllib('lib','PortWrite',1,792,0,pelletVal);
                                calllib('lib','PortWrite',1,792,0,0);%ARDUINO & food dispenser off
                                nbPelletRetrievalP3 = nbPelletRetrievalP3 + 1
                                underState3 = 'US3S1';
                            else
                                calllib('lib','PortWrite',1,792,0,0);%ARDUINO off
                                underState3 = 'US3S1'; % The mouse has to nose poke again NB : et on remet compteur pellets retrieved à 0!
                            end
                        end
                end
                
%                 t.Data = { 'Session timer' 'session timer here' 'nothing' 'Pellet retrievedP1' nbPelletRetrievalP1 'nothing' 'Pellet retrievedP2' nbPelletRetrievalP2 'tempoP2' 'Last Screen on (1:Left, 2 Right)P3' 'nothing' 'nothing';...
%                          'Current state' stateNum 'nothing' 'State final duration P1' 'state duration here' 'nothing' 'Lever pressP2' 'leverTimeP2' 'nothing' 'Lever pressP3' 'leverTimeP3' 'time of answer';...
%                          'State timer' 'state timer here' 'nothing' 'nothing' 'nothing' 'nothing' 'Total pellet retrieved (w/ time out)P2' nbPelletRetrievalP1 'timeOutP2' 'Time out leverP3' 'nothing' 'nothing';...
%                          'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'State final durationP2' 'state duration here' 'nothing' 'Pellet retrievedP3' nbPelletRetrievalP3 'tempoP3';...
%                          'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'Pellet retrieval time-out' 'time out' 'nothing';...
%                          'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'Total pellet retrieved (w/ time out)P3' 'nothing' 'nothing';...
%                          'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'State final durationP3' 'state duration here' 'nothing';};
                t.Data = { 'Session timer(h)' '356' '' 'Pellet retrievedP1' '10' '5secs' 'Pellet retrievedP2' '10' '10secs' 'Last Screen on (1:Left, 2 Right)P3' '1' '' 'Running reversal? (1:Yes, 0:No)' '1' '';...
                     'Current state' stateNum '' 'State final duration P1' '11min' '' 'Lever pressP2' '310' '35secs' 'Lever pressP3' '978' '43secs' 'Reversal done' '0' '';...
                     'State timer(min)' '20' '' '' '' '' 'Total pellet retrieved (w/ time out)P2' '43' '364secs' 'Time out leverP3' 'time out' '' 'Successful trials/40' '0' '0';...
                     '' '' '' '' '' '' 'State final durationP2' 'state duration here' '' 'Pellet retrievedP3' nbPelletRetrievalP3 'tempoP3' 'Total trials' 'totalTrials' '';...
                     '' '' '' '' '' '' '' '' '' 'Pellet retrieval time-out' 'time out' '' 'Last Screen on (1:Left, 2 Right)P4' 'screen' '';...
                     '' '' '' '' '' '' '' '' '' 'Total pellet retrieved (w/ time out)P3' 'total' 'time last one' 'Lever pressP4' 'leverTimeP4' 'time of answer';...
                     '' '' '' '' '' '' '' '' '' 'State final durationP3' 'state duration here' '' 'Time out leverP4' 'timeOut' '';...
                     '' '' '' '' '' '' '' '' '' '' '' '' 'Pellet retrieval time-outP4' 'time out' '';...
                     '' '' '' '' '' '' '' '' '' '' '' '' 'Pellet retrieved' 'nbPelletRetrievalP4' 'time last pellet';...
                     '' '' '' '' '' '' '' '' '' '' '' '' 'Total pellet retrieved (w/ time out)P4' 'nbPelletRetrievalP4' 'timeOutP4';...
                     '' '' '' '' '' '' '' '' '' '' '' '' 'State final durationP3' 'state duration here' ''};  
drawnow
            end
            state = 'stage4';
            
        case 'stage4'
            %--- Stage 4 --- 
            stateNum = 4;
            listRand = randomizer();
            y = 1;
            tempo = 0;
            tempo2 = 0;
            pushTime = 0;
            reversalCounter = 0;
            nbPelletRetrievalP4 = 0;
            reversalDone = 0;
            while reversalCounter < 6 
                reversalRand = rand()
                if reversalRand > 0.5 % No reversal
                    reversalDone = 0;
                    leftScreen = 2;
                    rightScreen = 4;
                    %underState4 = 'US4S2';
                else % Reversal
                    reversalDone = 1;
                    sprintf REVERSAL
                    rightScreen = 2;% NB : ton listrand ne prend que 2 ou 3 comme valeur or là tu u tilises 2 et 4
                    leftScreen = 4;
                    %underState4 = 'US4S2bis';
                end
                
                
                % NB : toute la logique de ce qui suit est erronée, sorry :/
                % déjà y a pas de fenêtre glissante, tu computes par bloc donc
                % ce n'est pas bon... ensuite selon ton code, tu détermines si
                % reversal ou pas avant chaque bloc de 40 essais (si critère de
                % 32 atteint) mais ce n'est pas bon ! Si elle atteint 32/40
                % mais tu avais prédeterminé que ce bloc pas de reversal, et
                % bien elle va se taper 40 nouveaux essais pour rien alors que
                % crière déjà atteint avec en plus le risque qu'elle tombe dans
                % un bloc sans reversal ! Et puis d'ailleurs, c'est reversals
                % dans 100% des cas quand critère atteint c'est pour ca que je
                % ne compute pas par bloc (ce qui ferait qu'on raterait des
                % critères atteints et qu'on poursuivrait donc sans reverser)
                % mais par fenêtre glissante essai après essai en regardant sur
                % les 40 derniers essais! Comme ça dès que critère atteint, bim
                % ! on reverse :)
                % autre problème: tes reversals en eux même... comme c'est
                % codé, c'est non fonctionnel car imagine tu es sur un bloc ou
                % faudra faire reversal si critère atteint et donc ton
                % rightscreen = 2 et leftscreen = 4. Le critère de 32 est
                % atteint donc on reverse. bémol, quand on revient au début de
                % ta boucle, si le reversalrand n'est pas supérieur à 0.5 alors
                % on se retrouve dans la même configuration, à savoir
                % rightscreen et leftscreen tjrs avec la même valeur... il faut
                % repenser tout ce codage malheureusement et faire comme j'ai
                % fait, à savoir une variable qui détermine quelle est la bonne
                % couleur/figure, une variable random qui détermine le côté où
                % dot être affichée la bonne couleur/figure et ensuite
                % en fonction de la combinaison, tu détermines quel écran doit
                % afficher quoi. Et concernant la réponse, tout bête car tu as
                % déterminé au préalable de quel côté doit s'afficher la bonne
                % figure donc comparaison de ta variable de latéralisation avec
                % le levier pressé et voilà ! Mais ceci doit être fait pour
                % chaque essai ! Quand reversal, il faut juste changer la
                % variable qui détermine la figure correcte (blanc => noir et
                % vice versa) mais ça doit être déterminé A LA FIN DE L'ESSAI!
                
                % Et je répète, il faut changer ce codage par bloc !! Il faut
                % une fenêtre glissante, c'est-à-dire qu'à chaque essai, on
                % compte le nombre de réponse correcte sur les 40 derniers
                % (essai actuel compris).
                
                
                while y < 41 % A 'for loop' incrementation cannot be controlled here so we used a while loop
                    
                    % ceci ne donne pas une fenêtre glissante mais
                    % une computation par bloc de 40... et ce
                    % n'est pas ce qu'il faut !! Il faut que ça
                    % glisse essai après essai en prenant tjrs les
                    % 40 derniers essais !!! c'est pourquoi on
                    % commence à computer les perfs qu'à partir du
                    % 40e essai...
                    
                    pause(2)% Delay %NB: 5secs
                    switch underState4 % So the portWrite's calls are not mistaken
                        case 'US4S1'
                            myVal = double(Test704(portVal, rackVal, offsetVal))
                            if myVal == nosePokeVal
                                nosePoke = 1;
                            else
                                nosePoke = 0;
                            end
                            if nosePoke == 1
                                writeVal = listRand(([y])) % The randomised value of the PortWrite
                                y = y + 1;
                                calllib('lib','PortWrite',1,792,0,writeVal); %%ARDUINO on %A REACTIVER /!\ NB : deux outputs pour faire blanc !
                                tic
                                underState5 = 'US4S2';
                            end
                            nosePoke = 0;
                        case 'US4S2'
                            % Variables initialization
                            rightLever = 0;
                            leftLever = 0;
                            myVal = double(Test704(portVal, rackVal, offsetVal))
                            if myVal == leftLeverVal
                                leftLever = 1;
                                rightLever = 0;
                            elseif myVal == rightLeverVal
                                leftLever = 0;
                                rightLever = 1;
                            elseif myVal == nosePokeVal
                                leftLever = 0;
                                rightLever = 0;
                            end
                            if writeVal == leftScreen % left screen's on if non reversal(2) /if reversal, right screen's on(4)
                                if leftLever == 1
                                    toc % NB : il faut que ça blink durant 15s ou jusqu'à récup pellet (et donc off screens avant!)
                                    tempo = toc
                                    tic
                                    if tempo < 60
                                        underState4 = 'US4S3'
                                        pushTime =0;
                                    else
                                        calllib('lib','PortWrite',1,792,0,0);%ARDUINO off
                                        underState4 = 'US4S1'; % The mouse has to nose poke again
                                    end
                                elseif rightLever == 1
                                    sprintf AversiveLed %Aversive LED for 5secs
                                    underState4 = 'US4S2';
                                    writeVal
                                end
                            elseif writeVal == rightScreen % right screen's on(4)/ if reversal, left screen's on(2)
                                if rightLever == 1
                                    toc
                                    tempo = toc
                                    tic
                                    if tempo < 60
                                        underState4 = 'US4S3'
                                        pushTime = 0;
                                    else
                                        calllib('lib','PortWrite',1,792,0,0);%ARDUINO off
                                        underState4 = 'US4S1'; % The mouse has to nose poke again
                                    end
                                elseif leftLever == 1
                                    sprintf AversiveLed %Aversive LED for 5secs
                                    underState4 = 'US4S2';
                                    writeVal
                                end
                            end
                        case 'US4S3'
                            myVal = double(Test704(portVal, rackVal, offsetVal))
                            if myVal == nosePokeVal
                                nosePoke = 1;
                                leftLever = 0;
                                rightLever = 0;
                            else
                                nosePoke = 0;
                                leftLever = 0;
                                rightLever = 0;
                            end
                            if nosePoke == 1
                                pushTime = pushTime + 1;
                                toc
                                tempo2 = toc
                                if tempo2 <15
                                    if pushTime == 1
                                        calllib('lib','PortWrite',1,792,0,pelletVal);
                                        calllib('lib','PortWrite',1,792,0,0);%ARDUINO & food dispenser off
                                        nbPelletRetrievalP4 = nbPelletRetrievalP4 + 1
                                        if nbPelletRetrieval == 32 && reversalDone == 1
                                            reversalCounter = reversalCounter + 1
                                            break
                                        end
                                    else
                                        underState4 = 'US4S1';
                                    end
                                else
                                    calllib('lib','PortWrite',1,792,0,0);%ARDUINO off
                                    underState4 = 'US4S1'; % The mouse has to nose poke again
                                end
                            end
                    end
                end
             t.Data = { 'Session timer' 'session timer here' 'nothing' 'Pellet retrievedP1' nbPelletRetrievalP1 'nothing' 'Pellet retrievedP2' nbPelletRetrievalP2 'tempoP2' 'Last Screen on (1:Left, 2 Right)P3' 'nothing' 'nothing' 'Running reversal? (1:Yes, 0:No)' 'nothing' 'nothing';...
                     'Current state' stateNum 'nothing' 'State final duration P1' 'state duration here' 'nothing' 'Lever pressP2' 'leverTimeP2' 'nothing' 'Lever pressP3' 'leverTimeP3' 'time of answer' 'Reversal done' reversalCounter 'nothing';...
                     'State timer' 'state timer here' 'nothing' 'nothing' 'nothing' 'nothing' 'Total pellet retrieved (w/ time out)P2' nbPelletRetrievalP2 'timeOutP2' 'Time out leverP3' 'nothing' 'nothing' 'Successful trials/40' 'nothing' 'percentage';...
                     'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'State final durationP2' 'state duration here' 'nothing' 'Pellet retrievedP3' nbPelletRetrievalP3 'tempoP3' 'Total trials' 'nothing' 'nothing';...
                     'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'Pellet retrieval time-out' 'time out' 'nothing' 'Last Screen on (1:Left, 2 Right)P4' 'nothing' 'nothing';...
                     'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'Total pellet retrieved (w/ time out)P3' 'nothing' 'nothing' 'Lever pressP4' 'leverTimeP4' 'time of answer';...
                     'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'State final durationP3' 'state duration here' 'nothing' 'Time out leverP4' 'nothing' 'nothing';...
                     'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'Pellet retrieval time-outP4' 'time out' 'nothing',...
                     'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'Pellet retrieved' nbPelletRetrievalP4 'nothing',...
                     'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'Total pellet retrieved (w/ time out)P4' nbPelletRetrievalP4 'timeOutP4',...
                     'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'nothing' 'State final durationP3' 'state duration here' 'nothing'};
            drawnow
            end
    end
    %t.Data = { 'Session timer' nbPelletRetrieval;}
    %save('testSave1.mat','nbPelletRetrieval') %The matfile
    %m = matfile('testSave1.mat')
    %     box = box + 1 % Box's change
    %     if box == 3
    %         box = 1
    %     end
end
end


