clear;

%% configuration
fontSize = 20;
textheight = 0.1;
config = outfigconfig();
save_name = 'HijTendExample.eps';
option1 = pathoptiset(mfilename('fullpath'), 'o','f',save_name);
[path, savefile] = getPath(option1);

%% find the point where H(:,i,j) and initTrace(i,:) become 0
t = config.t;
[TM, H] = basicARM3ThermalModel(t);
i = config.i; 
j = config.j;
TM.tend = tendFromH(H, config.epsilon, config.p);

stopx = TM.tend(i,j);
plot(t,H(:,i,j),'b','lineWidth',2);
set(gca,'xtick',0 : 2 : config.length,'FontSize',...
    fontSize,'FontName','Times New Roman','Position',[0.15 0.15 0.8 0.6]);
ylimits = get(gca,'ylim');
height = ylimits(2) * textheight;
hold on;
plot(stopx, 0, '.','markersize',25);
hold on;
text(stopx-1.5, height,'$t^{zero}_{ij}$','Interpreter','latex','FontSize',fontSize);
text(stopx+2.2, height,'$H_{ij}\approx 0$','Interpreter','latex','FontSize',fontSize);
xlabel('$\textrm{time}  / s $','Interpreter','latex','FontSize',fontSize)
ylabel('$H_{ii}$','Interpreter','latex','FontSize',fontSize, 'Rotation', 90)
grid on;

saveas(gca, savefile ,'psc2') ;