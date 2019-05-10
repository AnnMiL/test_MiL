clear;
%% configuration
fontSize = 20;
config = outfigconfig();
save_name = 'TijExample.eps';
option1 = pathoptiset(mfilename('fullpath'), 'o','f',save_name);
[path, savefile] = getPath(option1);

%% simulating
t = config.t;
[TM, H] = basicARM3ThermalModel(t);
i = config.i; 
j = config.j;
ton = config.tons(j);
toff = config.toffs(j);

[P, sample_period, maxIndex] = ObtainPeriodicPowerTrace(TM.ua(j), TM.ui(j),...
    ton*0.001, toff*0.001, config.length+2, TM.p);

out = ifft( fft(H(:,i,j)', config.fftlength/TM.p) .* ...
    fft(P, config.fftlength/TM.p) ) * TM.p;
%% setting figure
plot(t,out(1:length(t)),'b','lineWidth',2);
set(gca,'xtick', 0 : 2 : config.length,'FontSize',...
    fontSize,'FontName','Times New Roman','Position',[0.15 0.15 0.8 0.6]);
hold on;
xlabel('$\textrm{time}  / s $','Interpreter','latex','FontSize',fontSize)
ylabel('$T^{conv}_{ij} / K$','Interpreter','latex','FontSize',fontSize, 'Rotation', 90)
grid on;

saveas(gca, savefile ,'psc2') ;


