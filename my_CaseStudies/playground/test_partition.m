clear;
deadline = 120;
wcets_factor = 0.7;
step = 10;
wcets = [8.200000,6.200000,7,5.800000,7.400000,6.200000,7.800000,7.800000,...
    7.800000,7,5.400000,5.800000,8.600000,5.800000,8.200000,7,9,5.400000,...
    6.600000,5.400000,9,5,8.200000,8.200000,8.600000,5.400000,6.600000,6.200000,...
    8.200000,6.600000,8.600000,5.800000,6.200000,5.400000,5.400000,8.600000,...
    7.400000,7,5.400000,8.600000,7.400000,6.600000,7,6.600000,5.400000,5.800000,...
    5.400000,5.800000,zeros(1,204-48)]*wcets_factor ;

tswoffs = [ones(1,48),zeros(1,204-48)];
tswons = tswoffs;
alpha = rtcpjd(100 , 0 ,0);
n = 6;

[activeCoreIdx] = chooseCoresFromFlp(n);  % get the indexs of the active cores
activeCoreIdx = sort(activeCoreIdx);
feasibleDeadline = zeros(n,2);
sumw = 0;
sumtswon = 0;
for i = 1:n
    index = activeCoreIdx(i);
    sumw = wcets(index) + sumw;
    sumtswon = sumtswon + tswons(index);
end
    
for i = 1:n
    index = activeCoreIdx(i);
    feasibleDeadline(i, 1) = wcets(index) + tswons(index);
    feasibleDeadline(i, 2) = deadline - ( sumw + sumtswon - wcets(index) - tswons(index));
end

candidDeadline = cell(1, n-1);
limit = zeros(1,n-1);
for i = 1 : n-1
    % deadline candidcates
    candidDeadline{i} = feasibleDeadline(i, 1) : step : feasibleDeadline(i, 2);
    limit(i) = size(candidDeadline{i},2);
end

limit
if min(limit)<1
    error('deadline too small');
end
% initialize the deadline index as [1,1,....,1]
deadlineIdx = ones(1, n-1);

% predict the number of total loops
total = 1;
for i = 1 : n - 1
    total = total * limit(i);
end
total

count = 99;

stop = 0;

while count < 100
        partition = zeros(1,n);
    for i = 1:n-1
        partition(i) = candidDeadline{i}(deadlineIdx(i));
    end
    partition(n) = deadline - sum( partition(1 : n-1) );
    % check if feasible 
    if partition(n) >= feasibleDeadline(n, 1) &&...
            partition(n) <= feasibleDeadline(n, 2) % feasible
                fesbl = zeros(n,2);
        cand = cell(1,n);
        limitoff = zeros(1,n);
        
        for j=1:n
            index = activeCoreIdx(i);
            fesbl(j,1) = tswoffs(index) ;
            fesbl(j,2) = partition(j) - tswons(index);
            cand{j} = fesbl(j,1) : step : fesbl(j,2);
            limitoff(j) = size(cand{j},2);
        end
     
        limitoff
        if min(limitoff) < 1
            [deadlineIdx flag] = updateIndex(n-1, limit, deadlineIdx);
            count = count +1
            total
            % flag == 1 means all the possible solutions have been checked
            if flag
                stop = 1;
            end
            continue;
        end
        total2 = 1;
        for i = 1 : n
            total2 = total2 * limitoff(i);
        end
        toff_idx = ones(1,n);
        stop2 = 0;
        %count2 = 0;
        
        
        %% all toff combinations
        while ~stop2
            %count2 = count2  + 1;
            toffs = zeros(1,n);
            for i = 1:n
                toffs(i) = cand{i}(toff_idx(i));
            end
            alpha_in = alpha;
            tons = zeros(1,n);
            toffsfeasible = 1;
            for k = 1 : n
                id = activeCoreIdx(i);
                alpha_deadline = rtcaffine( alpha_in(1), 1 , partition(k));
                rho = minspeedbdfEDG( alpha_deadline, toffs(k) + tswons(id), step);
                K = rho * wcets(id);
                if K >= 1
                    toffsfeasible = 0;
                    break;
                end
                tons(k) = K/(1-K) * toffs(k) + tswons(id)/(1-K);

                if tons(k) >= 5000
                    toffsfeasible = 0;
                    break;
                end
                if k ~= n
                    % calculate the output arrival curve for the next core
                    ton = max(round(tons(k) - tswons(id)), 1);
                    beta = rtctdma( ton, round(ton + toffs(k)) , 1);
                    bli = beta(2);
                    bli = rtcrdivide(bli, wcets(id));
                    %save rtc bli alpha_in
                    alpha_out = rtcmindeconv(alpha_in(1),bli);
                    alpha_in = alpha_out;
                end    
            end
            
            if toffsfeasible
                disp('feasible');

            end

           [toff_idx flag2] = updateIndex(n, limitoff, toff_idx); 
           
           if flag2
               stop2 = 1;
           end
        end
    end
    
    [deadlineIdx flag] = updateIndex(n-1, limit, deadlineIdx);
    count = count +1
    total
    % flag == 1 means all the possible solutions have been checked
    if flag
        stop = 1;
    end
    
end


    
