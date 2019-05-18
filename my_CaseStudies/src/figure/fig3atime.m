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
str8='Intelstagenumvarying';


minnum = 2;
maxnum = 8;

%% load data
[resultData] = mergerResultsfromdisk(minnum:maxnum, 'a');
[Timeall, config] = getTimefromResults(resultData);


step = config(1).step;
name=[str1, str7,'.eps'];
%Temall = Temall - 320;
ida = Timeall(1,:) > 0;
idb = Timeall(2,:) > 0;
ids = Timeall(3,:) > 0;
idf = Timeall(4,:) > 0;

TimeA = Timeall(1, ida );
TimeB = Timeall(2, idb );
TimeS = Timeall(3, ids );
TimeF = Timeall(4, idf );

%TemA = TemA - TemF(ida) ;
%TemB = TemB - TemF(idb) ;
%TemS = TemS - TemF(ids) ;


%% plot
lowy = 323;
upy = 410;

semilogy(2:1:size(TimeA,2)+1, TimeA,'Color',[0.04313, 0, 0.42352],'Marker','v',...
    'MarkerSize',msize,'linewidth',2);
hold on
semilogy(2:1:size(TimeB,2)+1, TimeB, 'g-o', 'MarkerSize',msize,'linewidth',2);
hold on
semilogy(2:1:size(TimeS,2)+1, TimeS,'Color',[0.4784,0.02745,0.02745],'Marker',...
    'h', 'MarkerSize',msize,'linewidth',2);
hold on 
semilogy(2:1:size(TimeF,2)+1, TimeF,'Color','r','Marker','*', 'MarkerSize',msize,...
    'linewidth',2);
hold on 




%% post processing
set(gca,'xlim',[minnum-0.1, maxnum+0.1],'xtick',minnum:1:maxnum,'FontSize',fsize,...
    'FontName','Times New Roman','Position',[0.1 0.15 0.8 0.6]);
 xlabel('Stage number ','FontSize',fsize)
 ylabel('Computing time / s','FontSize',fsize, 'Rotation', 90)
box on;


%% legend
h=legend('ANSA','BS','SDP','FBGD','Orientation','horizontal');
pos = get(h,'pos');
pos(1) = pos(1) - 0.05;
pos(2) = pos(2) + 0.01;
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
