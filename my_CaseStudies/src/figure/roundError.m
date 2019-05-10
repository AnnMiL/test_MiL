toffs = [42.5000000000000,14.6000000000000,33.1000000000000,48,29.5000000000000];

% TM arm8cores
config = defaultConfig();
K = [0.3,0.25,0.4,0.6,0.19];
X = [];
Y = [];
id1 = 3;
id2 = 4;
direction = zeros(1,5);
direction(id1) = 1;
direction(id2) = -1;
[tact, tslp]= prepareTacts(toffs, config.tswons, config.tswoffs, K, config);
isFast = false;
Timp = ImpulsePeriod2dMat(8,8);
    tempT = CalculatePeakTemperatureV3(isFast, TM, tslp, tact, Timp);
for i = 0:0.1:10
    i
    [grd, ~, ~] = getGradient(tempT,TM, config, toffs, K, Timp,i,direction);
    X = [X,i];
    Y = [Y,grd];
end

toff3 = toffs(id) + X;
ton3 = K / (1-K) * toff3 + 1 / (1-K);

roundtond = round(ton3, 1);
roundtond2 = round(ton3, 2);
error = roundtond- ton3;
error2 = roundtond2- ton3;
sound(sin(0.3*pi*25*(1:4000)/100))
sound(sin(0.2*pi*25*(1:4000)/100))
sound(sin(0.3*pi*25*(1:4000)/100))
sound(sin(0.2*pi*25*(1:4000)/100))
sound(sin(0.3*pi*25*(1:4000)/100))
sound(sin(0.2*pi*25*(1:4000)/100))
sound(sin(0.3*pi*25*(1:4000)/100))
sound(sin(0.2*pi*25*(1:4000)/100))
plot(X,Y)



% l=[];
% for k = 0.001:0.001:0.99
%     ll = safePeriod(10, k, 0.1);
%     l=[l,ll];
% end
% 
% 
% 




