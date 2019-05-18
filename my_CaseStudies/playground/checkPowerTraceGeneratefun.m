function [flag] = checkPowerTraceGeneratefun(unit,remain_num)
ptrace_c = [];
for i = 1:remain_num
    ptrace_c = [ptrace_c,unit];
end
ptrace = powerTrace(unit, remain_num);
if size(ptrace) == size(ptrace_c) 
    if ptrace == ptrace_c
        flag = 1;
    else
        flag = 0;
    end
else
    flag = 0;
end