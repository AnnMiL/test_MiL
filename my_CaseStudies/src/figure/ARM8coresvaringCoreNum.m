
clear;
path = '../lib';
addpath(genpath(path));
%load('../../input/IntelSCCTM0001pV2.mat');
%load('../../input/IntelSCCTMH0001pV2.mat');



option1 = pathoptiset(mfilename('fullpath'), 'i','d','ARM8coresTM0.0001p.mat');
[path1, savefile1] = getPath(option1);
option2 = pathoptiset(mfilename('fullpath'), 'i','d','ARM8coresfloorplan.mat');
[path2, savefile2] = getPath(option2);
disp('loaded!')

load(savefile1);
load(savefile2);
stream = [100,0,0];
alpha = rtcpjd(100 , 0 ,0);
deadline = 120;

wcets_factor = 1;
san = 4;
step = 4;
wcets0 = [8.200000,6.200000,7,5.800000,7.400000,6.200000,7.800000,7.800000,...
    7.800000,7,5.400000,5.800000,8.600000,5.800000,8.200000,7,9,5.400000,...
    6.600000,5.400000,9,5,8.200000,8.200000,8.600000,5.400000,6.600000,6.200000,...
    8.200000,6.600000,8.600000,5.800000,6.200000,5.400000,5.400000,8.600000,...
    7.400000,7,5.400000,8.600000,7.400000,6.600000,7,6.600000,5.400000,5.800000,...
    5.400000,5.800000,zeros(1,204-48)]*0.7 ;

% wcets0 = [6.400000,5.600000,5.900000,6.300000,6.900000,6.900000,5.700000,...
%     6.900000,6.900000,6.200000,6.700000,5.700000,6.100000,6.800000,6.600000,...
%     6.900000,6.400000,5.500000,6.700000,6.900000,6.500000,6.600000,6.600000,...
%     6,6.400000,5.700000,6.500000,5.500000,5.900000,5.500000,5.600000,6.700000,...
%     6.500000,5.900000,6.900000,5.500000,6.100000,6,6.600000,6.600000,5.700000,...
%     6.200000,6.100000,6.400000,6.500000,6.600000,5.900000,6.500000,zeros(1,204-48)];
wcets = wcets0 *wcets_factor;
wcets = wcets(1:8);
tswoffs = ones(1,8);
tswons = tswoffs;


for activeNum = 8
    deadline = activeNum * 5 * wcets_factor + 40;
    config = ObtainConfig(alpha, deadline, wcets, tswons, tswoffs, step, activeNum, flp, TM.N, TM.n, san);
    disp('start complete TM');
  
    [TM] = completeTM(TM, config);
    control = zeros(1,5);
control(3) = 1;
    
  [resultData] = varyingCoreNum(TM, config,control,1,'RevisedresultObject_ARM8cores');

end

