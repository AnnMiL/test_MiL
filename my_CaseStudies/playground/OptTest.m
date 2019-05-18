function T = OptTest(tslp)

global TMg;
global Timp;
id = 5;

K = 0.4;
tswons = 1;

candidToffs = tslp;
candidTons  =   K / (1-K) * candidToffs + tswons / (1-K);
isFast = false;

   
%tact = [25,29,24,14,2,19,23,28];
  %  tslp = [22,12,18,18,28,27,14,20];
    tact = [75,39,54,104,2,49,393,123];
    tslp = [62,52,68,118,28,107,101,120];
 
  %  tact  =   K / (1-K) *tslp + tswons / (1-K);
%for i = 1 : length(candidToffs)
   

    
    tact(id) = candidTons + tswons;
    tslp(id) = candidToffs - tswons;
   
    [T, Timp, TMg] = CalculatePeakTemperatureV2(isFast, TMg, tslp, tact,Timp);
    
  