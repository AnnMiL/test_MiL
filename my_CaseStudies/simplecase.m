clear;

load thermalModelData;
% t=0:0.0001:16;
% [A_a, A_i, B_a, B_i, INVC, H, T_init, T_inf_a,A, B, beta_a, beta_i, StimesT0,isCore] = ThermalModel(t);
% [initTrace] = PbooTinitSimTrace(A,T_init,t);



N=size(A_a,2);
n=sum(isCore);
sizet=size(t,2);
step=1;
b=30;
rho=0.1;
wcets=[5,4,6];
tswons=[0.5,0.5,0.5];
tswoffs=tswons;
ua=B_a;
ui=B_i;


p = t(sizet)/(sizet-1);  % resolution
%% input  check

fftLength = 50/p;
%% find the point where H(:,i,j) and initTrace(i,:) become 0
epsilon = 1*10^-4;
epsilon2 = 1*10^-2;
tend=[];
TinitEnd = [];
for i = 1:size(H,2)
    for j = 1:size(H,3)
        peak =  find(H(:,i,j)==max(H(:,i,j)));
        pointEnd = sizet;
        while (pointEnd-peak>=5)
            midP = round((pointEnd + peak)/2);
            if H(midP,i,j) <= epsilon
                pointEnd = midP;
            else
                peak = midP;
            end
        end
        tend(i,j)=t(pointEnd); %unit: sec
    end
%     peak =  find(initTrace(i,:)==max(initTrace(i,:)));
%     pointEnd = sizet;
%     while (pointEnd-peak>=5)
%         midP = round((pointEnd + peak)/2);
%         if initTrace(i,midP) <= epsilon2
%             pointEnd = midP;
%         else
%             peak = midP;
%         end
%     end
%     TinitEnd(i)=t(pointEnd);
    
end


%% get the constant impulse 
tt=tic;
Tcont=zeros(N,sizet);
for i = 1:N
   % Tcont(i,:)=Tcont(i,:) + initTrace(i,:);
    for j = 1:N
        if isCore(j) == 0 && ui(j) ~= 0
            Tcont(i,:)=Tcont(i,:) + part_convWithOneConstantForPBOO(ui(j),H(:,i,j),1,sizet)*p;
        end
    end
end

Tconstmax=[];
for i=1:N
    Tconstmax(i) = max(Tcont(i,:));
end
  time1=toc(tt)         
clear Tcont;
%% compute N times n cell matrix, Timp.
%  Timp is a N*n matrix which is composed by  N*n cells
%  Timp(k,l) is a function of toff^l and describes the maxmum of the impulse
%  response for the given toff^l, rho, and wcets.
%  structure of Timp(k,l) :
% 1.              inside Timp(k,l)  is a  2*n_j matrix, n_j  varies in different columns
% 2.              the first line of the 2*n_j matrix indicates the vector of
%                  toff
% 3.             the second line represents the corresponding result, which
%                 is  maxmum of the impulse  H(i,j) for the current t`off.
%%%%%%%%%%%%%%%%%%%%%


%  determin the feasible region of toff^l
sumWcet = sum(wcets);
sumTswoff = sum(tswoffs);
feasibleRegion = zeros(N,2); % feasibleRegion, (*,1) the lower bounds, (*,2) the upper bpounds
for i=1:N
    if isCore(i) == 1
    feasibleRegion(i,1) = 2*tswoffs(i);
    feasibleRegion(i,2) = b - sumWcet - sumTswoff + tswoffs(i);
    end
end


Timp = cell(N,N);  % construct Timp

for j = 1:N % the processing component
     if isCore(j) == 0
         continue;
     end


   maxImpluse=[];
    K = rho*wcets(j); % ton/(ton+toff)
    Pa = ua(j);       % DE constant in active
    Pi = ui(j);    % DE constant in idle
    maxTon = K/(1-K)*feasibleRegion(j,2) + tswons(j)/(1-K);  % the max ton for node n
    ptraceLength = max(tend(:,j)) + 2*(feasibleRegion(j,2)+maxTon)/1000; % the minimum sample length for all nodes and toffs
    maxIndex = ceil(ptraceLength/p);  % the index of the sampleLength in vector t
    Toff = [];
    ImpluseMaxim = [];
    for tempToff = feasibleRegion(j,1):step:feasibleRegion(j,2)
        Toff= [Toff,tempToff];
        tempToff = 8;
        ton = K/(1-K)*tempToff + tswons(j)/(1-K); % calculate ton while considering mode switching overhead
        tact = ton + tswoffs(j);  % tact
        tslp = tempToff - tswoffs(j);  % tslp
        period_t = tact + tslp;  % period, unit: msec
        
        periodSamplePoints = round(period_t/1000/p);
        period_t = periodSamplePoints*p;
        tslp = tslp/1000;
        tact = period_t - tslp;
        % construct power trace
        
        p_number = ceil(maxIndex/periodSamplePoints);
        single_p=[];
        for index=1:ceil(tact/p);
                single_p(index)= Pa;  % active mode power consumption
        end
        for index = ceil(tact/p)+1:periodSamplePoints
                single_p(index)= Pi;  % idle mode power consumption
        end
      
        
      [origin_ptrace] = powerTrace(single_p,p_number);
      conv_result_N = [];
      
      %calculate results 
        for i = 1: N    %calculate the maximum of impulses from core j to all the nodes with given toff and ton
            sampleStart=floor(tend(i,j)/p);  
            local_maxIndex = sampleStart + round(periodSamplePoints*1.1);
            ptrace = origin_ptrace(1:local_maxIndex);
            tick=tic;
           conv_result = part_convForPBOO(ptrace,H(1:local_maxIndex,i,j),sampleStart,local_maxIndex)*p;
           time1=toc(tick)% the maximum of impulse
           conv_result = max( conv_result(sampleStart:local_maxIndex));
           conv_result_N = [conv_result_N;conv_result];  
   %  convlre= conv(ptrace,H(1:local_maxIndex,i,j));
        end
%         convlre = convlre *p;
%         plot(t,convlre(1:size(t,2)));
        
        maxImpluse = [maxImpluse, conv_result_N ];      % accumulate the results for the N nodes as toff varies
    end
    
    % collect the result and save them into cells
    
    for i = 1:N
        result = [Toff;maxImpluse(i,:)];
        Timp{i,j}=result;
    end
 end

% Tmin_indep=zeros(1,N);
% Tmin_impul = zeros(N,N);
% 
% for i=1:N
%     for j=1:N
%         if isCore(j)==0
%             continue
%         end
%         Tmin_impul(i,j) = min(Timp{i,j}(2,:));
%         Tmin_indep(i) = Tmin_indep(i) + Tmin_impul(i,j)  ;
%     end
%     Tmin_indep(i) = Tmin_indep(i) + Tconstmax(i);
% end
% 
% T_LowBound = max(Tmin_indep);
% 
% 
% upBound = max(T_inf_a);
% lowBound = T_LowBound;
% 
% while(upBound - lowBound >= 0.1)
%     Tsh = (upBound+lowBound)/2;
%     [solution,flag]=checkIfSolutionExist(Timp,Tconstmax,Tmin_impul,Tmin_indep,isCore,T_LowBound,Tsh,N,b,sumWcet);
%     if flag==1
%         upBound = Tsh;
%     else
%         lowBound = Tsh;
%     end
% end
% 
% Tsh = upBound;
% [solution,flag]=checkIfSolutionExist(Timp,Tconstmax,Tmin_impul,Tmin_indep,isCore,T_LowBound,Tsh,N,b,sumWcet);
% save result solution flag Timp Tsh;
    
    

















