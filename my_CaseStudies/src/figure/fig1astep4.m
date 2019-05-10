clear;
%% parameters
Fig_No = 1.1;
fsize = 20;

str1='PBOOComputing_Time_for_';
str2='PBOOPeak_Temperature_for_';
str3='ARM3cores';
str4='ARM4cores';
str5='Intel3cores';
str6='Intel4cores';
str7='stagenumvarying';

%%
[op] = pathoptiset(mfilename('fullpath'), 'o','d','ARM3and4stagesround2Step4.mat');
load(op.fpath);
[Temall, config] = getTemfromResults(resultData);


step = config(1).step;
name=[str2, str3, 'step',num2str(step),'.eps'];
tem = Temall(:,1:3)';
%tem = tem - 340;  % data to plot

%% plot
txx=1:1:size(tem,1);
NoUsea = 500*ones(1,3);
[AH,H1,H2]=plotyy(txx,tem,txx,NoUsea,'bar','scatter');



%% post processing
set(AH,'Position',[0.1 0.15 0.8 0.6]);
box on;
%set(AH,'MarkerFaceColor','red','MarkerEdgeColor','red','SizeData',144,'LineWidth',0.5)
set(H2,'MarkerFaceColor','red','MarkerEdgeColor','red','SizeData',80,'LineWidth',0.5)
set(AH(1),'xlim',[0.5 3.5],'xtick',1:1:3,'ylim',[340 365],'ytick',340:5:365,...
    'FontSize',fsize ,'Xcolor','k','Ycolor','k','FontName','Times New Roman');

upy = 45 + 325;
lowy = 10 + 325;
set(AH(2),'xlim',[0.5 3.5],'ylim',[lowy upy],'FontSize',fsize ,'Ycolor',...
    'k','FontName','Times New Roman');
set(get(AH(1),'Ylabel'),'string','Peak temperature / K','Interpreter',...
    'latex','FontSize',fsize ,'FontName','Times New Roman','Rotation', 90);
%% remove original labels
set(AH(1),'XTickLabel',{'H.263','MP3','MADplayer'},'Fontsize',fsize   );
set(AH(2),'XTickLabel',[]);
xtl=get(AH(1),'XTickLabel');
xt=get(AH(1),'XTick');
yt=get(AH(1),'YTick');
%% new labels
xtextp=xt-0.1;
ytextp=(yt(1)-0.2*(yt(2)-yt(1)))*ones(1,length(xt))-1;
text(xtextp,ytextp,xtl,'HorizontalAlignment','left','rotation',0,'fontsize',fsize,'FontName','Times New Roman');
set(AH(1),'XTickLabel',[]);
set(AH(1), 'FontSize',fsize ,'FontName','Times New Roman');

%% legend
h=legend('ANSA','BS','SDP','FBGD');
pos = get(h,'pos');
pos(1) = pos(1) - 0.2;
pos(2) = pos(2) + 0.02;
set(h,'pos',pos);
set(h,'FontName','Times New Roman','fontsize',fsize ,'box','on');
grid on
% title('3-stage','fontsize',fsize );

%% saving
[op] = pathoptiset(mfilename('fullpath'), 'o','f',name);
saveas(gca, op.fpath ,'psc2') ;
