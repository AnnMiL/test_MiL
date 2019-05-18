clear;
p = 0.01;
L = 60;
x = 0:p:L;
Pa1=8; Ps1=2;
Pa2=12; Ps2=3;

ton1=3.5;
toff1=4;
t1 = ton1 + toff1;

ton2=2.5;
toff2=3.5;
t2 = ton2 + toff2;
%%%%%
for index = 1:size(x,2)
    m1 = mod(x(index),t1);
    m2 = mod(x(index),t2);
    if m1<= ton1
        u1(index) = Pa1;
    else 
        u1(index) = Ps1;
    end
    
    if m2 <= ton2
        u2(index) = Pa1;
    else
        u2(index) = Ps1;
    end
end




scaler1 = -0.963;
H11 = 8.*exp(scaler1.*x);

tmax21 = 0.8;
maxH21 = 1.3;
scaler = sqrt(maxH21)/tmax21;
xx = 0:p:tmax21*2;
H21=-(scaler.*(xx-tmax21)).^2;
H21 = H21 -min(H21);
critX = tmax21 - scaler1/2/scaler/scaler;
indexcritX = round(critX/p);
YcritX = H21(indexcritX);
XcritX = indexcritX*p;
for tempx = indexcritX:1:size(x,2)
    H21(tempx) = YcritX*exp(scaler1*(tempx*p-XcritX));
end

plot(x,H11,'r',x,H21,'b');
% 
% fc = conv(u1,H11);
% fc = fc * p;
% f0 = 0;
% f3 = size(fc,2)-1;
% x3 = f0:p:(f3*p+f0);
% 
% fc2 = conv(u2,H21);
% fc2 = fc2 * p;
% 
% totfc = fc + fc2;

%plot(x3,fc,'r',x3,fc2,'g',x3,totfc,'b')


