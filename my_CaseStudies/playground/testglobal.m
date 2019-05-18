function [EXETTL]= testglobal()

global EXETTL;
t1 = rand(1,1);
t2 = rand(1,1);
t3 = rand(1,1);

if isempty(EXETTL)
    EXETTL = zeros(1,4);
end
EXETTL = EXETTL + [t1,t2,t3,1];