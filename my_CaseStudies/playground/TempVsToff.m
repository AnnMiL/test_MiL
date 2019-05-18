% load('../input/IntelSCCTM00004pV2.mat');
% if exist('fftH','var')
%     TM.fftH = fftH;
% else
%     
%     load('../input/IntelSCCTMH00004pV2.mat');
% end
% path = '../src/lib';
% addpath(genpath(path));
% load('../input/IntelSCCfloorplan.mat');
% 
% disp('loaded!')
load('ARM4coresTM1e-05p.mat');
TM = completeTM(TM);
n = TM.n;
step = 0.1;
maxtoff = 300;
id = 5;
mintoff = 2;
K = 0.4;
tswons = 1;

candidToffs = mintoff:step:maxtoff;
candidTons  =   K / (1-K) * candidToffs + tswons / (1-K);
isFast = false;
Timp = ImpulsePeriod2dMat(n, n);
peakTs2 = zeros(size(candidToffs));
peakTs3 = zeros(size(candidToffs));
    tact = [25,29,24,14,2,19,23,28];
    tslp = [22,12,18,18,28,27,1,20];
for i = 1 : length(candidToffs)
    i

    
    tact(id) = candidTons(i) + tswons;
    tslp(id) = candidToffs(i) - tswons;
    [Tpeak3, Timp] = CalculatePeakTemperatureV3(isFast, TM, tslp, tact,Timp);
    [Tpeak2, Timp] = CalculatePeakTemperatureV2(isFast, TM, tslp, tact,Timp);
    peakTs2(i) = Tpeak2;
    peakTs3(i) = Tpeak3;
end

period=candidToffs+candidTons;
p=TM.p;
sample_period   = round( period / p );
sample_tact     = round(candidTons/p);
sample_tslp     = sample_period-sample_tact;
A = [sample_period;sample_tslp;candidToffs/p;sample_tact;candidTons/p];
plot(candidToffs,peakTs3,'r',candidToffs,peakTs2,'b');
