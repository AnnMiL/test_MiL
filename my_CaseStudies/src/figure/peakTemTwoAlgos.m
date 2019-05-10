clear;
%% configuration
fontSize = 20;
config = outfigconfig();
load_name = 'peakTemTwoAlgos.mat';
save_name = 'peakTemTwoAlgos.eps';
option1 = pathoptiset(mfilename('fullpath'), 'o','d',load_name);
option2 = pathoptiset(mfilename('fullpath'), 'o','f',save_name);
[path1, loadfile] = getPath(option1);
[path2, savefile] = getPath(option2);

load(loadfile);

%%
ids = 20:numel(candidToffs);

plot(candidToffs(ids),peakTs3(ids),'r',candidToffs(ids),peakTs2(ids),'b',...
    'lineWidth',1.2);

set(gca,'FontSize',...
     fontSize,'FontName','Times New Roman','Position',[0.15 0.15 0.8 0.5]);
 hold on;
% 
% hold on;
h = legend('FBPT','ANPT');
 xlabel('$t^{off}_i  / ms $','Interpreter','latex','FontSize',fontSize)
 ylabel('Peak Temperature / K','Interpreter','latex','FontSize',fontSize, 'Rotation', 90)
 grid on;
saveas(gca, savefile ,'psc2') ;