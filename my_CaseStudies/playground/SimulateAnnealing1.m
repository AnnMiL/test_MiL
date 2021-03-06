function [BestX,BestY]=SimulateAnnealing1
clear;
clc;
%// ??????????,???????
XMAX= 4;
YMAX = 4;
%?????
MarkovLength = 10000; %// ??????
DecayScale = 0.95; %// ????
StepFactor = 0.02; %// ????
Temperature=30; %// ????
Tolerance = 1e-4; %// ??
AcceptPoints = 0.0; %// Metropolis???????
rnd =rand;
% ???? ????
PreX = -XMAX * rand ;
PreY = -YMAX * rand;
PreBestX  = PreX;
PreBestY = PreY;
PreX = -XMAX * rand ;
PreY = -YMAX * rand;
BestX = PreX;
BestY = PreY;
% ?????????(??), ??????????
mm=abs( ObjectFunction( BestX,BestY)-ObjectFunction (PreBestX, PreBestY));
count = 1;
while mm > Tolerance
    count
    Temperature=DecayScale*Temperature;
    AcceptPoints = 0.0;
    % ?????T???loop(?MARKOV???)?
    for i=0:MarkovLength
        % 1) ???????????
        p=0;
        while p==0
            NextX = PreX + StepFactor*XMAX*(rand-0.5);
            NextY = PreY + StepFactor*YMAX*(rand-0.5);
            if p== (~(NextX >= -XMAX && NextX <= XMAX && NextY >= -YMAX && NextY <= YMAX))
                p=1;
            end
        end
        % 2) ???????
        if (ObjectFunction(BestX,BestY) > ObjectFunction(NextX,NextY))
            % ????????
            PreBestX =BestX;
            PreBestY = BestY;
            % ???????
            BestX=NextX;
            BestY=NextY;
        end
        % 3) Metropolis??
        if( ObjectFunction(PreX,PreY) - ObjectFunction(NextX,NextY) > 0 )
            %// ??, ??lastPoint????????????????
            PreX=NextX;
            PreY=NextY;
            AcceptPoints=AcceptPoints+1;
        else
            changer = -1 * ( ObjectFunction(NextX,NextY) - ObjectFunction(PreX,PreY) ) / Temperature ;
            rnd=rand;
            p1=exp(changer);
            double (p1);
            if p1 > rand             %// ???, ????
                PreX=NextX;
                PreY=NextY;
                AcceptPoints=AcceptPoints+1;
            end
        end
    end
    mm=abs( ObjectFunction( BestX,BestY)-ObjectFunction (PreBestX, PreBestY));
    count = count + 1;
end
disp('?????:');
BestX
BestY
disp( '????:{0}');
ObjectFunction(BestX, BestY)
end
