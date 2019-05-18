function [isPeriodic, isActived] = isPeriodic(tact, tslp, p)
isPeriodic      = true;
isActived       = true; 

if tact < p
    isPeriodic = 0;
    isActived  = false;
    return;
else if tslp < p && tact > p
        isPeriodic = 0;
        return;
    end
end
end