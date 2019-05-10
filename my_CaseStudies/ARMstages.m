% 
% stagenumber = 2-3 
% applications:  MP3 decoder; H.263 decoder; MADPlayer
% period = 100;
% deadline = period


clear;
streams = [50 0 0;
           60 0 0;
           50 0 0];
% 2.2 12 9 3.6
% 0.4 1.5 12 9 5.1
% 2 1 1.6 3 4 
all_wcets3 = [[14.2,9,3.6]*0.6; %H.263
        [13.9,9,5.1]*0.9;  %MP3
        [4.6 3 4]*1.7]; % MADPlayer
    
all_wcets4 = [[2.2 12 9 3.6]*0.6; %H.263
        [1.9 12 9 5.1]*0.9;  %MP3
        [2 2.6 3 4]*1.7]; % MADPlayer
deadline_factor = 1;

step = 3;
%% arm 3 cores

load ARM8TM00002p
disp('loaded ARM3cores!')


% wcets = [8.200000,6.200000,7,5.800000,7.400000,6.200000,7.800000,7.800000,...
%     7.800000,7,5.400000,5.800000,8.600000,5.800000,8.200000,7,9,5.400000,...
%     6.600000,5.400000,9,5,8.200000,8.200000,8.600000,5.400000,6.600000,6.200000,...
%     8.200000,6.600000,8.600000,5.800000,6.200000,5.400000,5.400000,8.600000,...
%     7.400000,7,5.400000,8.600000,7.400000,6.600000,7,6.600000,5.400000,5.800000,...
%     5.400000,5.800000,zeros(1,204-48)]*0.5;

N = TM.N;

wcets = zeros(1,N);

scope = 'part';

TimePBOO1=[];
TimePBOO0=[];
TimeDPA=[];

TemPBOO1=[];
TemPBOO0=[];
TemDPA=[];

for activeNum = 3:4
    if activeNum==3
        all_wcets = all_wcets3;
    else
        all_wcets = all_wcets4;
    end
    tswoffs = [ones(1,activeNum),zeros(1,N-activeNum)];
    tswons = tswoffs;
    j = activeNum - 2;
    
for i = 1:3 
%i=3;
    wcets = zeros(1,N);
    period = streams(i,1);
    jitter = streams(i,2);
    d = streams(i,3);
    deadline = period * deadline_factor;
    alpha = rtcpjd(period,jitter,d);
    wcets(1:activeNum) = all_wcets(i,1:activeNum);

    tt=tic;
    [optsolution1 optTemp opt_b opt_rho] = PayBurstOnlyOnceThermal(TM,alpha,...
    deadline, wcets, tswons, tswoffs, step, scope, activeNum, 1); %brutal searching
    time1 = toc(tt);
    TemPBOO1(j,i) = optTemp;
    TimePBOO1(j,i) =  time1;
    
    tt=tic;
    
    [optsolution0 optTemp opt_b opt_rho] = PayBurstOnlyOnceThermal(TM,alpha,...
    deadline, wcets, tswons, tswoffs, step, scope, activeNum, 0); %brutal searching
    time1 = toc(tt);
    TemPBOO0(j,i) = optTemp;
    TimePBOO0(j,i) =  time1;
    
        tt=tic;
    [optTemp optsolution optpartition] = thermalDPALSCFast(TM,alpha,...
        deadline,wcets,tswons,tswoffs,step, scope, activeNum);
    time1 = toc(tt);
    TemDPA(j,i) = optTemp;
    TimeDPA(j,i) = time1;
end
end

save fig1ARM TemDPA TimeDPA TemPBOO1 TimePBOO1 TemPBOO0 TimePBOO0



    
    
