 clear;
p = 0.01;  % resolution
L = 100;    % time interval length
x = 0:p:L; % sample points
Pa1=8; Ps1=2;  %active and sleep power



%% construct impluse function

scaler1 = -0.163;
H11 = 10.*exp(scaler1.*x);

tmax21 = 10;
maxH21 = 1;
scaler = sqrt(maxH21)/tmax21;
xx = 0:p:tmax21*2;
H21=-(scaler.*(xx-tmax21)).^2 + scaler*scaler*tmax21*tmax21;
%H21 = H21 -min(H21);
%critX = tmax21 - scaler1/2/scaler/scaler;
critX = tmax21*8/5;
indexcritX = round(critX/p);
YcritX = H21(indexcritX);
XcritX = indexcritX*p;
scaler2 = - scaler*scaler * 2 * (critX - tmax21)/YcritX; 
for tempx = indexcritX:1:size(x,2)
    H21(tempx) = YcritX*exp(scaler2*(tempx*p-XcritX));
    %H21(tempx) = YcritX*exp(scaler1*(tempx*p-XcritX));
end


%plot(x,H21,'r',x,H11,'b');




%% construct power consumption function
%for i = 1: 500
    i = 50;
    tinv1 = (i+10)/10;
    tvld1 = 0.75 * tinv1;
    toff1 = tinv1 - 0.5;
    ton1  = tvld1 + 0.5;
    ton2 = ton1 - 2;
    ton3 = ton1 + 2;
    toff2 = toff1+2;
    toff3 = toff1-2;
    t2 = ton2 + toff2;
    t3 = ton3 + toff3;
    t1 = ton1 + toff1; 
for index = 1:size(x,2)
    m1 = mod(x(index),t1);
    if m1<= ton1
        u1(index) = Pa1;
    else 
        u1(index) = Ps1;
    end
end

for index = 1:size(x,2)
    m2 = mod(x(index),t2);
    if m2<= ton2
        u2(index) = Pa1;
    else 
        u2(index) = Ps1;
    end
end

for index = 1:size(x,2)
    m3 = mod(x(index),t3);
    if m3<= ton3
        u3(index) = Pa1;
    else 
        u3(index) = Ps1;
    end
end

%plot(x,H11,'r',x,H21,'b');

fc = conv(u1,H11);
fc = fc * p;
 f0 = 0;
 f3 = size(fc,2)-1;
 x3 = f0:p:(f3*p+f0);

fc2 = conv(u2,H21);
fc2 = fc2 * p;

fc3 = conv(u3,H21);
fc3 = fc3 * p;

MaxIm(i) = max(fc2);
MaxIn(i) = max(fc);
Toff(i) = tinv1;

sum12 = fc+fc2;
sum13 = fc+fc3;
sum = fc+fc2+fc3;
%end
%[H] = plot(x3,fc,'r',x3,fc2,'g',x3,fc3,'k',x3,fc+fc2+fc3,'b');
[H] = plot(x3,fc,'r',x3,fc2,'g',x3,fc3,'k',x3,sum12,'b',x3,sum13,'k',x3,sum,'m');
grid on;
%set(gca,'xtick',[0:4:120])
peaks1=[];
peaks12=[];
peaks13=[];
peaks=[];
for i = 6000:1:10000
    if fc(i-1)< fc(i) && fc(i+1)< fc(i)
      peaks1=[peaks1;x3(i)];
    end
    if sum12(i-1)< sum12(i) && sum12(i+1)< sum12(i)
      peaks12=[peaks1;x3(i)];
    end
    if sum13(i-1)< sum13(i) && sum13(i+1)< sum13(i)
      peaks13=[peaks1;x3(i)];
    end
    if sum(i-1)< sum(i) && sum(i+1)< sum(i)
      peaks=[peaks1;x3(i)];
    end
end


t=68;
nt2 = 63.97;
nt3 = 65.4;
% xcor = find(MaxIm == min(MaxIm))
% 
% ycor = find(MaxIn == min(MaxIn))
% plot(Toff,MaxIm,'r',Toff,MaxIn,'b')

