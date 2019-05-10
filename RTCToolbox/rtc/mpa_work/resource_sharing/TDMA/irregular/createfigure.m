function createfigure(ymatrix1)
%CREATEFIGURE(YMATRIX1)
%  YMATRIX1:  bar matrix data

%  Auto-generated by MATLAB on 23-Oct-2009 13:44:58

% Create figure
figure1 = figure('XVisual',...
    '0x24 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)');

% Create axes
axes1 = axes('Parent',figure1,'XTickLabel',{'','','',''},'XTick',[1 2 3 4],...
    'FontSize',16);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim([0 75]);
box('on');
hold('all');

% Create ylabel
ylabel('Worst Case Responce Time [ms]','FontSize',16);

% Create title
title('Different access models, regular TDMA arbiter','FontSize',16);

% Create multiple lines using matrix input to bar
bar1 = bar(ymatrix1,'Parent',axes1);
set(bar1(2),'FaceColor',[1 0.6941 0.3922],...
    'DisplayName','8 sequential superblocks');
set(bar1(1),'FaceColor',[0.04314 0.5176 0.7804],...
    'DisplayName','82 sequential superblocks');

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Position',[0.1448 0.7819 0.4044 0.1234]);

