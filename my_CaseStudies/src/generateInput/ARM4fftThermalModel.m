function [TM] = ARM4fftThermalModel()
% TM: the thermal model, members are:
% lc_a/lc_i:    linear coefficient of DE in active/idel mode
% ua/ui:        the vector of the constant of DE in active/idle mode
% initT:        the initial temperature
% fftH:         the fourier transform of impulse response of the thermal LTI system.
%               should be a N times N matrix
% T_inf_a:      the state steady temperature in active mode
% coreIdx:      indicates which nodes are cores.
% p:            resolution of time vector
% tend:         tend(i,j) indicates where H(:,i,j) become 0
% isCore:       if node(i) is a core, 1 is / 0 not
% Tconstmax:    the constant impulse from non-core nodes
% n:            number of processing components
% N:            number of nodes
% sizet:        the length of time vector.
% recommend: t = 0:0.0004:35;
t = 0:0.01:30;
p = 0.00001;
name = 'ARM4cores';
INVC = diag([13.6190612381 13.6190612381 13.6190612381 13.6190612381 104.2709376043	104.2709376043 104.2709376043 104.2709376043 23.4976760798 23.4976760798 23.4976760798 23.4976760798 0.9136555321 0.9136555321 0.9136555321 0.9136555321 4.4757478247 4.4757478247 4.4757478247 4.4757478247 0.1740296252 0.1740296252 0.1740296252 0.1740296252 0.1879519952 0.1879519952 0.1879519952 0.1879519952]);	


SplusG = [2.5928571429	-0.5250000000	-0.5250000000	0.0000000000	-1.5428571429	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
-0.5250000000	2.5928571429	0.0000000000	-0.5250000000	0.0000000000	-1.5428571429	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
-0.5250000000	0.0000000000	2.5928571429	-0.5250000000	0.0000000000	0.0000000000	-1.5428571429	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	-0.5250000000	-0.5250000000	2.5928571429	0.0000000000	0.0000000000	0.0000000000	-1.5428571429	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
-1.5428571429	0.0000000000	0.0000000000	0.0000000000	2.2644571429	-0.0008000000	-0.0008000000	0.0000000000	-0.7200000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	-1.5428571429	0.0000000000	0.0000000000	-0.0008000000	2.2644571429	0.0000000000	-0.0008000000	0.0000000000	-0.7200000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	-1.5428571429	0.0000000000	-0.0008000000	0.0000000000	2.2644571429	-0.0008000000	0.0000000000	0.0000000000	-0.7200000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	-1.5428571429	0.0000000000	-0.0008000000	-0.0008000000	2.2644571429	0.0000000000	0.0000000000	0.0000000000	-0.7200000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.7200000000	0.0000000000	0.0000000000	0.0000000000	16.6852173913	-0.4000000000	-0.4000000000	0.0000000000	-14.4000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.7200000000	0.0000000000	0.0000000000	-0.4000000000	16.6852173913	0.0000000000	-0.4000000000	0.0000000000	-14.4000000000	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.7200000000	0.0000000000	-0.4000000000	0.0000000000	16.6852173913	-0.4000000000	0.0000000000	0.0000000000	-14.4000000000	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.7200000000	0.0000000000	-0.4000000000	-0.4000000000	16.6852173913	0.0000000000	0.0000000000	0.0000000000	-14.4000000000	0.0000000000	-0.3826086957	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-14.4000000000	0.0000000000	0.0000000000	0.0000000000	16.1867558528	-0.4000000000	-0.4000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-14.4000000000	0.0000000000	0.0000000000	-0.4000000000	16.1867558528	0.0000000000	-0.4000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-14.4000000000	0.0000000000	-0.4000000000	0.0000000000	16.1867558528	-0.4000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-14.4000000000	0.0000000000	-0.4000000000	-0.4000000000	16.1867558528	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	76.3652173913	0.0000000000	0.0000000000	0.0000000000	-75.6000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	76.3652173913	0.0000000000	0.0000000000	0.0000000000	-75.6000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	76.3652173913	0.0000000000	0.0000000000	0.0000000000	-75.6000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	76.3652173913	0.0000000000	0.0000000000	0.0000000000	-75.6000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	-0.3826086957	0.0000000000	0.0000000000	-75.6000000000	0.0000000000	0.0000000000	0.0000000000	79.1068657430	0.0000000000	0.0000000000	0.0000000000	-1.5785714286	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	-0.3826086957	0.0000000000	-75.6000000000	0.0000000000	0.0000000000	0.0000000000	79.1068657430	0.0000000000	0.0000000000	0.0000000000	-1.5785714286	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	-75.6000000000	0.0000000000	0.0000000000	0.0000000000	79.1068657430	0.0000000000	0.0000000000	0.0000000000	-1.5785714286	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-0.3826086957	0.0000000000	-0.3826086957	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-75.6000000000	0.0000000000	0.0000000000	0.0000000000	79.1068657430	0.0000000000	0.0000000000	0.0000000000	-1.5785714286	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-1.5785714286	0.0000000000	0.0000000000	0.0000000000	2.6554945055	0.0000000000	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-1.5785714286	0.0000000000	0.0000000000	0.0000000000	2.6554945055	0.0000000000	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-1.5785714286	0.0000000000	0.0000000000	0.0000000000	2.6554945055	0.0000000000	
0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	0.0000000000	-1.5785714286	0.0000000000	0.0000000000	0.0000000000	2.6554945055];


g_amb = [0.2215384615	0.2215384615	0.2215384615	0.2215384615	0.0000000000	0.0000000000	0.0000000000	0.0000000000	1.1630769231	1.1630769231	1.1630769231	1.1630769231	1.0769230769	1.0769230769	1.0769230769	1.0769230769];
g0 = zeros(1, size(SplusG,2) - size(g_amb,2));
StimesT0 = [g0, g_amb*300];
StimesT0 = StimesT0';

% RTAS
%alpha_a = diag([0.0135 0.0135 0.0135 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]); % slope of power in active mode [W/K]
%alpha_i = diag([0.0135 0.0135 0.0135 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]); % slope of power in idle mode [W/K]
%beta_a = [16.460; 16.460; 16.460; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0]; % constant power in active mode [W]
%beta_i = [-3.811; -3.811; -3.811; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0]; % constant power in idle mode [W]

% TECS
cores = 4;
alpha_a = diag([0.025 * ones(1, cores), zeros(1, size(INVC,2)-cores)]);
alpha_i = alpha_a;

beta_a = [18.06 * ones(1, cores), zeros(1, size(INVC,2)-cores)]';
beta_i = [-7.0 * ones(1, cores), zeros(1, size(INVC,2)-cores)]';
%alpha_a = 0.5diag([0.022755102063125 0.022755102063124998 0.022755102063124998 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 zeros(1,180)]);
%alpha_i = 0.5* diag([0.022755102063125 0.022755102063124998 0.022755102063124998 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 zeros(1,180)]);
%beta_a = 0.5* [8.061353078616783; 8.061353078616783; 8.061353078616783; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; zeros(180,1)];
%beta_i = 0.5* [-5.512180221383218; -5.512180221383218; -5.512180221383218; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; zeros(180,1)];


data = struct('INVC',INVC, 'SplusG',SplusG, 'g_amb',g_amb, 'StimesT0',StimesT0, ...
    'alpha_a',alpha_a, 'alpha_i',alpha_i, 'beta_a',beta_a, 'beta_i',beta_i, 't',t...
    , 'name',name, 'p', p);

[TM] = PBOOThermalModel(data);