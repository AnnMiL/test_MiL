% clear;
% load newSTEP3
clear;
Fig_No = 3.1;
fsize = 20;
msize = 15;

str1='PBOOComputing_Time_for_';
str2='PBOOPeak_Temperature_for_';
str3='ARM3cores';
str4='ARM4cores';
str5='Intel3cores';
str6='Intel4cores';
str7='ARMstagenumvarying';
str8='Intelstagenumvarying2-11';
str9='Intelstagenumvarying11-24';

minnum = 12;
maxnum = 24;

%% load data
[resultData] = mergerResultsfromdisk(minnum:maxnum, 'i');
[Temall, config] = getTemfromResults(resultData);


step = config(1).step;
name=[str9,'.eps'];
%Temall = Temall - 320;
ida = Temall(1,:) > 0;
idb = Temall(2,:) > 0;
ids = Temall(3,:) > 0;
idf = Temall(4,:) > 0;

TemA = Temall(1, ida );
TemB = Temall(2, idb );
TemS = Temall(3, ids );
TemF = Temall(4, idf );

%TemA = TemA - TemF(ida) ;
%TemB = TemB - TemF(idb) ;
%TemS = TemS - TemF(ids) ;


%% plot
lowy = 340;
upy = 365;

plot(minnum:1:maxnum, TemA,'Color',[0.04313, 0, 0.42352],'Marker','v',...
    'MarkerSize',msize,'linewidth',2);
hold on
%plot(2:1:size(TemB,2)+1, TemB, 'g-o', 'MarkerSize',13,'linewidth',2);
%hold on
%plot(2:1:size(TemS,2)+1, TemS,'Color',[0.4784,0.02745,0.02745],'Marker',...
%    'h', 'MarkerSize',13,'linewidth',2);
%hold on 
plot(minnum:1:maxnum, TemF,'Color','r','Marker','*', 'MarkerSize',msize,...
    'linewidth',2);
hold on 




%% post processing
set(gca,'xlim',[minnum-0.1, maxnum+0.1],'xtick',minnum:1:maxnum, 'ylim',[lowy upy],'FontSize',fsize,...
    'FontName','Times New Roman','Position',[0.1 0.15 0.8 0.6]);
 xlabel('Stage number ','FontSize',fsize)
 ylabel('Peak temperature / K','FontSize',fsize, 'Rotation', 90)
box on;


%% legend
h=legend('ANSA','FBGD',0);
pos = get(h,'pos');
%pos(2) = pos(2) - 0.2;
set(h,'pos',pos);
set(h,'FontName','Times New Roman','fontsize',fsize ,'box','on');
grid on
% title('3-stage','fontsize',fsize );

%% saving
[op] = pathoptiset(mfilename('fullpath'), 'o','f',name);
saveas(gca, op.fpath ,'psc2') ;














































% leftx=0.9;
% rightx = 12.9;
% 
% %%
% subplot(1,2,1);
% semilogy(2:1:size(TimePBOO1,2)+1, TimePBOO1,'Color',[0.04313, 0, 0.42352],'Marker','v', 'MarkerSize',13,'linewidth',2);
% hold on
% 
% semilogy(2:1:size(TimePBOO0,2)+1, TimePBOO0, 'g-o', 'MarkerSize',13,'linewidth',2);
% hold on
% semilogy(2:1:size(TimeDPA,2)+1, TimeDPA,'Color',[0.4784,0.02745,0.02745],'Marker','h', 'MarkerSize',13,'linewidth',2);
% hold on
% 
% axis([leftx rightx 0 1000000]);
% h=legend('BS','GD','EDP',2);
% set(gca,'xtick',2:1:12, 'FontSize',fsize,'FontName','Times New Roman','Position',[0.08 0.15 0.4 0.45]);
% xlabel('Stage number ','FontSize',fsize);
% ylabel('Computing Time / s','FontSize',fsize, 'Rotation', 90);
% set(h,'FontSize',fsize2);
% % pos = get(h,'pos');
% % %pos(1) = pos(1) + 0.01;
% % pos(2) = pos(2) - 0.25;
% % set(h,'pos',pos);
% grid on;
% title('(a)','fontsize',fsize );
% 
% %%
% subplot(1,2,2);
% lowy = 325;
% upy = 345;
% 
% plot(2:1:size(TemPBOO1,2)+1, TemPBOO1,'Color',[0.04313, 0, 0.42352],'Marker','v', 'MarkerSize',13,'linewidth',2);
% hold on
% plot(2:1:size(TemPBOO0,2)+1, TemPBOO0, 'g-o', 'MarkerSize',13,'linewidth',2);
% hold on
% plot(2:1:size(TemDPA,2)+1, TemDPA,'Color',[0.4784,0.02745,0.02745],'Marker','h', 'MarkerSize',13,'linewidth',2);
% hold on 
% % load arm8cores2-8
% % plot(2:1:size(TemPBOO1,2)+1, TemPBOO1,'m-d', 'MarkerSize',13,'linewidth',2);
% % hold on
% % plot(2:1:size(TemPBOO0,2)+1, TemPBOO0, 'r-*', 'MarkerSize',13,'linewidth',2);
% % hold on
% % plot(2:1:size(TemDPA,2)+1, TemDPA,'k-x', 'MarkerSize',13,'linewidth',2);
% axis([leftx rightx lowy upy]);
% h=legend('BS','GD','EDP');
% set(gca,'xtick',2:1:12, 'ylim',[lowy upy],'FontSize',15,'FontName','Times New Roman','Position',[0.58 0.15 0.4 0.45]);
% xlabel('Stage number ','FontSize',fsize)
% ylabel('Peak temperature / K','FontSize',fsize, 'Rotation', 90)
% set(h,'FontSize',fsize2);
% pos = get(h,'pos');
% pos(1) = pos(1) + 0.01;
% pos(2) = pos(2) - 0.25;
% set(h,'pos',pos);
% grid on
% title('(b)','fontsize',fsize );
% 
% %saveas(gca, str ,'psc2') ;

