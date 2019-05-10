





% dt = 0.0001; % fs = 1000
% T = 20 ;
% N = T/dt;
% 
% Fs = 1 / dt;
% df = Fs / N;
% fc = df *(-N/2:N/2-1);
% wc = 2*pi*fc;
% x = 0:dt:T- dt;
% 
% 
% y = cos(2*x);
% ffty=fft(y);
% plot(wc*dt, ffty/N)



N = 800;

t2 = 2*N*pi;
Fs = 1000;
dt = 1/Fs;
t = 0 : dt : t2;
n = length(t);
df = Fs/n;
fc = df*( - n/2:n/2-1);
wc = 2*pi*fc;

x = 2* cos(2*t);


%omega = linspace(-5.5, 5.5, 500);
omega = wc;
tt = tic;
X = sin(pi*N*(omega-2))./(omega-2) + sin(pi*N*(omega+2))./(omega+2);
X = 2*X;
t2 =toc(tt)




