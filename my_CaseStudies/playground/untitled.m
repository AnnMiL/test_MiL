function [x,fval,exitflag,output] = PBOOSA(x0,lb,ub,TolFun_Data,DisplayInterval_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = saoptimset;
%% Modify options setting
options = saoptimset(options,'TolFun', TolFun_Data);
options = saoptimset(options,'Display', 'iter');
options = saoptimset(options,'DisplayInterval', DisplayInterval_Data);
[x,fval,exitflag,output] = ...
simulannealbnd(@OptTest,x0,lb,ub,options);
