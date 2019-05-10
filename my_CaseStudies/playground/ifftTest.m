k = 0
Fs = 50e6
df = 1e3
f = 0:df:Fs-df; % Notice the end point
w = 2*pi*f; % Need a factor of 2 pi
N = Fs/df % 5e4 = 50,000
fc = df*(-N/2:N/2-1); % Explicit negative frequencies
wc = 2*pi*fc;

dt = 1/Fs % 2e-8
T = N*dt % 1e-3
t = 0:dt:T-dt;
t = dt*(0:N-1);

I0 = 1e3
a = 0.17e6
b = 3.17e6

y0 = I0*(exp(-a*t)-exp(-b*t));

% Only plot until exp(-a*t) ~ exp(-4)
M = [1 : 1 + round(4/a/dt)]; % 1 : 1177
tM = t(M);

k = k+1, figure(k) % fig 1
plot(tM,y0(M))
ylabel('y0')
xlabel('Time')
title('Original Time Function')

Y1 = I0*(1./(a+i*w)-1./(b+i*w));
y1 = (1/dt)*ifft(Y1); % Note 1/dt scale factor

k = k+1, figure(k) % fig 2
subplot(2,1,1)
plot(tM,real(y1(M)))
title('Incorrect IFFT')
ylabel('Real Part')
subplot(2,1,2)
plot(tM,imag(y1(M))) % Note SIGNIFICANT imag part
ylabel('Imag Part')

Yc = I0*(1./(a+i*wc)-1./(b+i*wc));
yc = (1/dt)*ifft(ifftshift(Yc));

k = k+1, figure(k) % fig 3
subplot(2,1,1)
plot(tM,real(yc(M)))
title('Correct IFFT')
ylabel('Real Part (y)')
subplot(2,1,2)
plot(tM,imag(yc(M)))
ylabel('Imag Part (Roundoff Err)')

y = real(yc);
ERR = y0 - y;
[maxERR ind] = max(abs(ERR)) % ERR(1) = -6.0784
MAE = mean(abs(ERR)) % MAE = 1.8704e-004
RMSE = sqrt(mean(ERR.^2)) % RMSE = 2.76e-2

k = k+1, figure(k), hold on % fig 4
plot(tM,y0(M))
plot(tM,y(M),'r')
legend('y0','y')

k = k+1, figure(k) % fig 5
plot(t(1:10),ERR(1:10))
xlabel('Time')
title('Conversion Error for IFFT of CFT')

for j = k:-1:1
    figure(j)
end