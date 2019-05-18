
p = 0.00001;
Length = 30;

x = 0 : p : Length;
fftLength = size(x,2)*2-1;
scaler1 = -0.963;
H11 = 4.*exp(scaler1.*x);

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




tact = 25.5456;
tslp = 37.8145;
Pa = 20;
Pi = 2;
period_number = ceil(Length/ (tact*0.001 + tslp*0.001));

[P, ~, ~] = ObtainPeriodicPowerTrace(Pa, Pi, tact*0.001, tslp*0.001, Length, p);

out             = ifft( fft(H11, fftLength) .* fft( P, fftLength) ) * p;


m1 = max(out)


p = 0.0001;

x = 0 : p : Length;
fftLength = size(x,2)*2-1;

H11 = 4.*exp(scaler1.*x);


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







[P, sample_period, maxIndex] = ObtainPeriodicPowerTrace(Pa, Pi, tact*0.001, tslp*0.001, Length, p);

out             = ifft( fft(H11, fftLength) .* fft( P, fftLength) ) * p;


m2 = max(out)
sample_tact     = round(tact*0.001/p);
error = 0;
stop = 0;
id = sample_tact;

while ~stop
    error = error + p*H11(id)*(Pa-Pi);
    id = id + sample_period;
    if id > size(H11,2)
        stop = 1;
    end
    
end

error
m2-m1













