for activeNum = 6:8
%activeNum = 2;
%      tt=tic;
%      [optsolution optTemp opt_b opt_rho] = PayBurstOnlyOnceThermal(TM,alpha,...
%      deadline, wcets, tswons, tswoffs, step, scope, activeNum, 1); %brutal searching
%      time1 = toc(tt);
%      TemPBOO1 = [TemPBOO1,optTemp];
%      TimePBOO1 = [TimePBOO1, time1]
%      
%      tt=tic;
%      TimePBOO0
%      [optsolution optTemp opt_b opt_rho] = PayBurstOnlyOnceThermal(TM,alpha,...
%      deadline, wcets, tswons, tswoffs, step, scope, activeNum, 0); %brutal searching
%      time1 = toc(tt);
%      TemPBOO0 = [TemPBOO0,optTemp];
%      TimePBOO0 = [TimePBOO0, time1]
    
    
    
   tt=tic;
   TimeDPA
   [optTemp optsolution optpartition] = thermalDPALSC(TM,alpha,...
       deadline,wcets,tswons,tswoffs,step, scope, activeNum);
   time1 = toc(tt);
   TemDPA = [TemDPA,optTemp];
   TimeDPA = [TimeDPA,time1]
 %   save newSTEP5DPA2-6 TemPBOO0 TimePBOO0 TemPBOO1 TimePBOO1 deadline stream wcets_factor step
  save STEP10DPALSC2-8 TemDPA TimeDPA deadline stream wcets_factor step
 end