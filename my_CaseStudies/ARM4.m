%
% stagenumber = 3-4
% applications:  MP3 decoder; H.263 decoder; MADPlayer
% period = 100;
% deadline = period
clear;
% option1 = pathoptiset(mfilename('fullpath'), 'i','d','ARM4coresTM1e-05p.mat');
% [path1, savefile1] = getPath(option1);
% option2 = pathoptiset(mfilename('fullpath'), 'i','d','ARM4coresfloorplan.mat');
% [~, savefile2] = getPath(option2);

savefile1 = 'ARM4coresTM1e-05p.mat';
savefile2 =  'ARM4coresfloorplan.mat';
load(savefile1);
load(savefile2);
disp('loaded!')

%% system setup

%streams = [100 150 0];
%all_wcets = [14.2,9,3.6, 5.7]; %H.263 init

%  streams = [55 150 0];%H.263
%  all_wcets = [1.3,7.2,5.4, 2.2]; %H.263

% streams = [60 150 0];%MP3
% %all_wcets = [1.8 10.8 8.1 4.59]; 
% all_wcets = [1.9 12 9 5.1];

streams = [30 50 0];%MADPlayer
all_wcets = [3.4,4.4,5.1, 6.8]; 


%deadline_factor = 1.2;
deadline_factor = 2;


step = 2;
tswoffs = ones(1,4);
tswons = tswoffs;

%% prepare for config
san = 4;

%% for different deadline factor

for deadlinefactor = 0.7 : 0.01 : 0.71


resultData = getresultData();

% option2 = pathoptiset(mfilename('fullpath'), 'o','d',['ARM4Test',num2str(step),'.mat']);

% [path2, savefile2] = getPath(option2);

savefile3 = ['ARM4Test',num2str(step),'.mat'];

activeNum = 4;

i = 1;
%% construct input event stream arrival curve
period = streams(i,1);
jitter = streams(i,2);
d = streams(i,3);
deadline = period * deadline_factor;
alpha = rtcpjd(period,jitter,d);
wcets = all_wcets(i,:);

%% construct configuration
config = ObtainConfig(alpha, deadline, wcets, tswons, tswoffs, step, activeNum, flp, TM.N, TM.n, san);
disp('start complete TM');

[TM] = completeTM(TM, config);


control = zeros(1,5);
control(2) = 1;


[newresultData] = varyingCoreNum(TM, config,control,0,'ARM4Test');
resultData = mergeResultData(resultData, newresultData);

save(savefile3,'resultData');
end







% clear;
% option1 = pathoptiset(mfilename('fullpath'), 'i','d','ARM8coresTM0.0001p.mat');
% [path1, savefile1] = getPath(option1);
% option2 = pathoptiset(mfilename('fullpath'), 'i','d','ARM8coresfloorplan.mat');
% [~, savefile2] = getPath(option2);
%
% load(savefile1);
% load(savefile2);
% disp('loaded!')
%
% %% system setup
%
% streams = [55 0 0;
%     65 0 0;
%     30 0 0];
% all_wcets3 = [[14.2,9,3.6]; %H.263
%     [13.9,9,5.1];  %MP3
%     [4.6 3 4]]; % MADPlayer
% all_wcets4 = [[2.2 12 9 3.6]; %H.263
%     [1.9 12 9 5.1];  %MP3
%     [2 2.6 3 4]]; % MADPlayer
% deadline_factor = 1;
%
% step = 2;
% tswoffs = ones(1,8);
% tswons = tswoffs;
%
% %% prepare for config
% activeCoreIdx3 = chooseActCores(flp, 3);
% allWCET3 = retrieveVars(all_wcets3, activeCoreIdx3, 8);
% allWCET3(allWCET3==0) = inf;
%
% activeCoreIdx4 = chooseActCores(flp, 4);
% allWCET4 = retrieveVars(all_wcets4, activeCoreIdx4, 8);
% allWCET4(allWCET4==0) = inf;
% san = 4;
%
% %% arm 3-4 cores
% resultData = getresultData();
%
% option2 = pathoptiset(mfilename('fullpath'), 'o','d',['ARM3and4stagesround2Step',num2str(step),'.mat']);
% [path2, savefile2] = getPath(option2);
% for activeNum = 3:4
%     if activeNum==3
%        %
%         all_wcets = allWCET3;
%     else
%        % continue
%         all_wcets = allWCET4;
%     end
%
%
%
%     for i = 1:3
%         if i ~= 1
%          %   continue
%         end
%         %% construct input event stream arrival curve
%         period = streams(i,1);
%         jitter = streams(i,2);
%         d = streams(i,3);
%         deadline = period * deadline_factor;
%         alpha = rtcpjd(period,jitter,d);
%         wcets = all_wcets(i,:);
%
%         %% construct configuration
%         config = ObtainConfig(alpha, deadline, wcets, tswons, tswoffs, step, activeNum, flp, TM.N, TM.n, san);
%         disp('start complete TM');
%
%         [TM] = completeTM(TM, config);
%
%
%         control = zeros(1,5);
%         control([1:3,5]) = 1;
%
%
%         [newresultData] = varyingCoreNum(TM, config,control,0,'ARM3&4stages');
%         resultData = mergeResultData(resultData, newresultData);
%
%         save(savefile2,'resultData');
%     end
%
% end



