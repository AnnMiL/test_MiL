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
savefig = false;
path = '../../result/figures';
path2 = '../../../talk/figs';
save_name = 'TvsToffExample.eps';
fontSize = 25;
%TM.fftH = fftH;
n = TM.n;
step = 3;
maxtoff = 2000;
id = 2;
mintoff = 2;
K = 0.1;
tswons = 1;

candidToffs = mintoff:step:maxtoff;
candidTons  =   K / (1-K) * candidToffs + tswons / (1-K);
isFast = false;
Timp = ImpulsePeriod2dMat(n, n);
peakTs2 = zeros(size(candidToffs));
peakTs3 = zeros(size(candidToffs));
tact = zeros(1, n);
tslp = tact;
for i = 1 : length(candidToffs)
    i
    
    
    tact(id) = candidTons(i) + tswons;
    tslp(id) = candidToffs(i) - tswons;
    % [Tpeak3, Timp] = CalculatePeakTemperatureV3(isFast, TM, tslp, tact,Timp);
    [Tpeak2, Timp] = CalculatePeakTemperatureV2(isFast, TM, tslp, tact,Timp);
    peakTs2(i) = Tpeak2;
    % peakTs3(i) = Tpeak3;
end

period=candidToffs+candidTons;
p=TM.p;
sample_period   = round( period / p );
sample_tact     = round(candidTons/p);
sample_tslp     = sample_period-sample_tact;
A = [sample_period;sample_tslp;candidToffs/p;sample_tact;candidTons/p];
plot(candidToffs,peakTs2,'b','lineWidth',2);



set(gca,'FontSize',...
    fontSize,'FontName','Times New Roman','Position',[0.15 0.15 0.8 0.6]);
hold on;
%
% hold on;
xlabel('$t_{off}^i  / ms $','Interpreter','latex','FontSize',fontSize)
ylabel('Peak Temperature / K','Interpreter','latex','FontSize',fontSize, 'Rotation', 90)
grid on;




savefile = strcat([path,'/',save_name]);
savefile2 = strcat([path2,'/',save_name]);
if savefig
    saveas(gca, savefile ,'psc2') ;
    saveas(gca, savefile2 ,'psc2') ;
end
