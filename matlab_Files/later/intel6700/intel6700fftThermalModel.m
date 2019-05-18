function [TM] = intel6700fftThermalModel()
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
% sizet1.96189	0.00000	-1.26667	-0.63333	-0.06189	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
% recommend: t = 0:0.0004:35;
t = 0:0.001:50;
p = 0.00001;
name = 'intel6700cores';
INVC = diag([29.28643	29.28643	29.28643	29.28643	960.96096	960.96096	960.96096	960.96096	21.65546	21.65546	21.65546	21.65546	1.28750	1.28750	1.28750	1.28750	4.54947	4.54947	4.54947	4.54947	0.27048	0.27048	0.27048	0.27048	0.12573	0.12573	0.12573	0.12573]);
    
SplusG = [4.35625	-0.22500	-0.22500	0.00000	-3.90625	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
-0.22500	4.35625	0.00000	-0.22500	0.00000	-3.90625	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
-0.22500	0.00000	4.35625	-0.22500	0.00000	0.00000	-3.90625	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	-0.22500	-0.22500	4.35625	0.00000	0.00000	0.00000	-3.90625	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
-3.90625	0.00000	0.00000	0.00000	11.71891	-0.00008	-0.00008	0.00000	-7.81250	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	-3.90625	0.00000	0.00000	-0.00008	11.71891	0.00000	-0.00008	0.00000	-7.81250	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	-3.90625	0.00000	-0.00008	0.00000	11.71891	-0.00008	0.00000	0.00000	-7.81250	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	-3.90625	0.00000	-0.00008	-0.00008	11.71891	0.00000	0.00000	0.00000	-7.81250	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	-7.81250	0.00000	0.00000	0.00000	25.02295	-0.40000	-0.40000	0.00000	-15.62500	0.00000	0.00000	0.00000	-0.39273	0.00000	0.00000	-0.39273	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	-7.81250	0.00000	0.00000	-0.40000	25.02295	0.00000	-0.40000	0.00000	-15.62500	0.00000	0.00000	-0.39273	0.00000	-0.39273	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-7.81250	0.00000	-0.40000	0.00000	25.02295	-0.40000	0.00000	0.00000	-15.62500	0.00000	0.00000	-0.39273	0.00000	-0.39273	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-7.81250	0.00000	-0.40000	-0.40000	25.02295	0.00000	0.00000	0.00000	-15.62500	0.00000	-0.39273	-0.39273	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-15.62500	0.00000	0.00000	0.00000	17.28819	-0.40000	-0.40000	0.00000	0.00000	0.00000	0.00000	0.00000	-0.39273	0.00000	0.00000	-0.39273	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-15.62500	0.00000	0.00000	-0.40000	17.28819	0.00000	-0.40000	0.00000	0.00000	0.00000	0.00000	-0.39273	0.00000	-0.39273	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-15.62500	0.00000	-0.40000	0.00000	17.28819	-0.40000	0.00000	0.00000	0.00000	0.00000	0.00000	-0.39273	0.00000	-0.39273	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-15.62500	0.00000	-0.40000	-0.40000	17.28819	0.00000	0.00000	0.00000	0.00000	0.00000	-0.39273	-0.39273	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-0.39273	-0.39273	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	75.16045	0.00000	0.00000	0.00000	-74.37500	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-0.39273	-0.39273	0.00000	0.00000	0.00000	0.00000	0.00000	75.16045	0.00000	0.00000	0.00000	-74.37500	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-0.39273	0.00000	-0.39273	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	75.16045	0.00000	0.00000	0.00000	-74.37500	0.00000	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-0.39273	0.00000	-0.39273	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	75.16045	0.00000	0.00000	0.00000	-74.37500	0.00000	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-0.39273	-0.39273	0.00000	0.00000	-74.37500	0.00000	0.00000	0.00000	76.80603	0.00000	0.00000	0.00000	-1.27556	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-0.39273	-0.39273	0.00000	-74.37500	0.00000	0.00000	0.00000	76.80603	0.00000	0.00000	0.00000	-1.27556	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-0.39273	0.00000	-0.39273	0.00000	0.00000	-74.37500	0.00000	0.00000	0.00000	76.80603	0.00000	0.00000	0.00000	-1.27556	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-0.39273	0.00000	-0.39273	0.00000	0.00000	0.00000	0.00000	-74.37500	0.00000	0.00000	0.00000	76.80603	0.00000	0.00000	0.00000	-1.27556	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-1.27556	0.00000	0.00000	0.00000	2.07158	0.00000	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-1.27556	0.00000	0.00000	0.00000	2.07158	0.00000	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-1.27556	0.00000	0.00000	0.00000	2.07158	0.00000	
0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	0.00000	-1.27556	0.00000	0.00000	0.00000	2.07158];
    
g_amb = [0.07774	0.07774	0.07774	0.07774	0.00000	0.00000	0.00000	0.00000	0.37002	0.37002	0.37002	0.37002	0.79602	0.79602	0.79602	0.79602];

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
alpha_a = diag([0.042 * ones(1, cores), zeros(1, size(INVC,2)-cores)]);
alpha_i = alpha_a;

beta_a = [13 * ones(1, cores), zeros(1, size(INVC,2)-cores)]';
beta_i = [-7.0 * ones(1, cores), zeros(1, size(INVC,2)-cores)]';
%alpha_a = 0.5diag([0.022755102063125 0.022755102063124998 0.022755102063124998 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 zeros(1,180)]);
%alpha_i = 0.5* diag([0.022755102063125 0.022755102063124998 0.022755102063124998 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 zeros(1,180)]);
%beta_a = 0.5* [8.061353078616783; 8.061353078616783; 8.061353078616783; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; zeros(180,1)];
%beta_i = 0.5* [-5.512180221383218; -5.512180221383218; -5.512180221383218; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; zeros(180,1)];


data = struct('INVC',INVC, 'SplusG',SplusG, 'g_amb',g_amb, 'StimesT0',StimesT0, ...
    'alpha_a',alpha_a, 'alpha_i',alpha_i, 'beta_a',beta_a, 'beta_i',beta_i, 't',t...
    , 'name',name, 'p', p);

[TM] = PBOOThermalModel(data);