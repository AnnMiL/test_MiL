% clear;
% 
% %% configuration
fontSize = 20;
config = outfigconfig();
config.length = 25;
config.t        = 0 : config.p : config.length;
option1 = pathoptiset(mfilename('fullpath'), 'o','f','neighbor1.eps');
option2 = pathoptiset(mfilename('fullpath'), 'o','f','neighbor2.eps');
[path, savefile] = getPath(option1);
[path1, savefile1] = getPath(option2);
% %% simulating
% t = config.t;
% [TM, H] = basicARM8ThermalModel(t);
% i = config.i; 
% j = config.j;
% ton = config.tons(j)-100;
% toff = config.toffs(j)-100;
% 
% [P, ~, ~] = ObtainPeriodicPowerTrace(TM.ua(j), TM.ui(j),...
%     ton*0.001, toff*0.001, config.length+2, TM.p);
% 
% out = ifft( fft(H(:,i,j)', config.fftlength/TM.p) .* ...
%     fft(P, config.fftlength/TM.p) ) * TM.p;
% 
% j= 8;
% 
% [P, ~, ~] = ObtainPeriodicPowerTrace(TM.ua(j), TM.ui(j),...
%     ton*0.001, toff*0.001, config.length+2, TM.p);
% 
% out2 = ifft( fft(H(:,i,j)', config.fftlength/TM.p) .* ...
%     fft(P, config.fftlength/TM.p) ) * TM.p;
% 
% TM.tend = tendFromH(H, config.epsilon, config.p);
localmin = min(  out(   (length(t)- (ton + toff)/1000/config.p) : length(t)   )   );
localmax = max(  out(   (length(t)- (ton + toff)/1000/config.p) : length(t)   )   );
%% setting figure
clear figure
subplot(2,1,1);
maxx = 30;
plot(t,out(1:length(t)),'b','lineWidth',2);
set(gca,'xtick', 0 : 3 : maxx,'xlim',[0,30],'FontSize',...
    fontSize,'FontName','Times New Roman','Position',[0.15 0.62 0.8 0.35]);
hold on;
xlimits = get(gca, 'xlim'); 
ylimits = get(gca, 'ylim');
X = getpartition([28, 28], xlimits);
Y = getpartition([localmin, localmax], ylimits);
correct = [0.025, -0.065];
Y = Y + correct + 0.47;
X = X - 0.02;
annotation('doublearrow', X , Y,'Units','normalized','LineStyle','-','color','k');
hold on;
plotlines([config.length-3,config.length+4],[localmax,localmax],'k');
plotlines([config.length-3,config.length+4],[localmin,localmin],'k');
tt = text(27,-3.3,'$\mathbf{2.17}K$','Interpreter','latex','FontSize',fontSize-3);
set(tt,'Rotation',90);
xlabel('$\textrm{time}  / s $','Interpreter','latex','FontSize',fontSize)
ylabel('$T^{conv}_{12} / K$','Interpreter','latex','FontSize',fontSize, 'Rotation', 90)
grid on;

%saveas(gca, savefile ,'psc2') ;


localmin2 = min(  out2(   (length(t)- (ton + toff)/1000/config.p) : length(t)   )   );
localmax2 = max(  out2(   (length(t)- (ton + toff)/1000/config.p) : length(t)   )   );

subplot(2,1,2);
maxx = 30;
plot(t,out2(1:length(t)),'b','lineWidth',2);
set(gca,'xtick', 0 : 3 : maxx,'xlim',[0,30],'FontSize',...
    fontSize,'FontName','Times New Roman','Position',[0.15 0.1 0.8 0.4]);
hold on;
xlimits = get(gca, 'xlim'); 
ylimits = get(gca, 'ylim');
X = getpartition([28, 28], xlimits);
Y = getpartition([localmax2+0.5, localmax2], ylimits);
Y2 = getpartition([localmin2-0.2, localmin2+0.01], ylimits);
sss = -0.05;
correct = [0, 0.0]+sss;
Y = Y + correct;
X = X - 0.02;
correct2 = [0, 0]+sss;
Y2 = Y2 + correct;
annotation('arrow', X , Y,'Units','normalized','LineStyle','-','color','k');
annotation('arrow', X , Y2,'Units','normalized','LineStyle','-','color','k');
hold on;
plotlines([config.length-3,config.length+4],[localmax2,localmax2],'k');
plotlines([config.length-3,config.length+4],[localmin2,localmin2],'k');
tt = text(27.5,-0.9,'$\mathbf{0.09}K$','Interpreter','latex','FontSize',fontSize-3);
set(tt,'Rotation',90);

xlabel('$\textrm{time}  / s $','Interpreter','latex','FontSize',fontSize)
ylabel('$T^{conv}_{18} / K$','Interpreter','latex','FontSize',fontSize, 'Rotation', 90)
grid on;

saveas(gca, savefile1 ,'psc2') ;


