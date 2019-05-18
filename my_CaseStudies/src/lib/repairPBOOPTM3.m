function [miniT, solution] = repairPBOOPTM(TM, config, dynamicData, solution)

n           = config.activeNum;
actcoreIdx  = config.actcoreIdx;
wcets       = config.wcets;
tons        = solution(2,actcoreIdx) - config.tswons;
toffs       = solution(1,actcoreIdx) + config.tswons;
k           = wcets * dynamicData.rho;
isFast      = false;
Timp        = dynamicData.Timp;
alln        = TM.n;

budget = zeros(1,n);
slope = zeros(1,n);
step = 0.2;
for i = 1 : n
    id = actcoreIdx(i);

    if tons(i) < wcets(i)
        tons(i) = wcets(i);
    else
        tons(i) = floor(tons(i) / wcets(i)) * wcets(i);
        if tons(i)/k(i) - tons(i) < config.tswons(i)
            tons(i) = ceil(tons(i) / wcets(i)) * wcets(i);
        end
    end
	
	newtoff = tons(i)/k(i) - tons(i);
    budget(i) = toffs(i) - newtoff;
    if budget(i) >= 0 % toff gets smaller
        toffs(i) = newtoff;
    else % toff may get bigger
       
    end
    
end





if any(slope > 0)
    error('not correct');
end
Q = sum(budget(budget > 0));




while Q > 0
	for i = 1 : n
	id = actcoreIdx(i);
	if budget(i) < 0
		slope(i) = getSlope(toffs, tons, id, min(Q, abs(budget(i))));
	else
			slope(i) = 0;
	end
	end

    [~, ic] = min(slope);
    if budget(ic) < 0
        allo = min(Q, abs(budget(ic)));
        toffs(ic) = toffs(ic) + allo;
        budget(ic) = budget(ic) + allo;
		Q = Q - allo;       
    else
        
        break
    end
    
    
end



toffs = toffs - config.tswons;
tons  = tons + config.tswons;
tactfinal = tons + config.tswoffs;
tslpfinal = toffs - config.tswoffs;
tact2 = zeros(1, alln);
tslp2 = tact2;
tact2(actcoreIdx) = tactfinal;
tslp2(actcoreIdx) = tslpfinal;
[miniT, Timp, ~] = CalculatePeakTemperatureV3(isFast, TM, tslp2, tact2, Timp);
solution(1,actcoreIdx) = toffs;
solution(2,actcoreIdx) = tons;


function slope2 = getSlope(toffs, tons, index, step2)
	if nargin < 4
		step2 = 0.2;
	end
		
    tact = zeros(1, alln);
    tslp = tact;
    tact1 = tons + config.tswons + config.tswoffs;
    tslp1 = toffs - config.tswons - config.tswoffs;
    tact(actcoreIdx) = tact1;
    tslp(actcoreIdx) = tslp1;
    [beforeChange, Timp, ~] = CalculatePeakTemperatureV3(isFast, TM, tslp, tact, Timp);
    tslp(index) = tslp(index) + step2;
    [afterChange, Timp, ~] = CalculatePeakTemperatureV3(isFast, TM, tslp, tact, Timp);
    slope2 = (afterChange - beforeChange)/step2;
end

end







