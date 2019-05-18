clear;

%% configuration
fontSize = 20;
config = outfigconfig();
option1 = pathoptiset(mfilename('fullpath'), 'o','f','Tem_iExample.eps');
[path, savefile] = getPath(option1);

%% simulating
t = config.t;
i = config.i; 
j = config.j;
tons = config.tons;
toffs = config.toffs;
[TM, H] = basicARM3ThermalModel(t);

N = TM.N;
O = zeros(1, length(t));
for j = 1 : N
    if TM.isCore(j)
        [P, sample_period, maxIndex] = ObtainPeriodicPowerTrace(TM.ua(j),...
            TM.ui(j), tons(j)*0.001, toffs(j)*0.001, max(t)+2, TM.p);
        
    else
        P = ones(1, round( (max(t)+2)/TM.p)) * TM.ui(j);   
    end
    out = ifft( fft(H(:,i,j)', config.fftlength/TM.p) .* fft(P, config.fftlength/TM.p)   ) * TM.p;
    O(1,:) = O(1,:) + out(1:length(t));
end

Tinit = H2Tinit(H, TM.B,  TM.initT, i);
O(1,:) = O(1,:) + Tinit;
%% setting figure
TM.tend = tendFromH(H, config.epsilon, config.p);
localmin = min(  O(  round(TM.tend(i,j)/TM.p) : end )  );
index1 = find(  abs( O - localmin ) < 1e-6, 1,'last' );     
t1 = t(index1);
t2 = config.lcmp + t1;                   
plot(t,O,'b','lineWidth',1.5);
set(gca,'xtick',0:2:config.length,'FontSize',...
    fontSize,'FontName','Times New Roman','Position',[0.15 0.15 0.8 0.6]);
hold on;
xlimits = get(gca, 'xlim'); 
ylimits = get(gca, 'ylim');
X = getpartition([t1, t2], xlimits);
Y = getpartition([localmin-12, localmin-12], ylimits);
correct = [0.006, -0.03];
X = X + correct;
annotation('doublearrow', X , Y,'Units','normalized','LineStyle','-','color','k');
hold on;
plotlines([t1,t1],[localmin-10,localmin-1],'k');
hold on;
plotlines([t2,t2],[localmin-10,localmin-1],'k');
text((t1+t2)*0.5-0.5, 348 ,'$t^p_{lcm}$','Interpreter','latex','FontSize',fontSize);


xlabel('$\textrm{time}  / s $','Interpreter','latex','FontSize',fontSize)
ylabel('$T_{i} / K$','Interpreter','latex','FontSize',fontSize, 'Rotation', 90)
grid on;

saveas(gca, savefile ,'psc2') ;


