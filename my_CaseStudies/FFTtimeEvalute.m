 clear;
 load dataforFFT
 
 origin_ptrace = (origin_ptrace(1:150000))';

t= 0:0.0001:16;
TM = fftThermalModel(t);
[A_a, A_i, B_a, B_i, INVC, H, T_init,T_inf_a, A, B, beta_a, beta_i, StimesT0,isCore] = ThermalModel(t);


out2= conv(H(:,1,1),origin_ptrace);

length = 21/TM.p;
p=TM.p;
%fftH = fft(H(:,1,1),length);

%max(abs(fftH - TM.fftH(:,1,1)))




%fftH = fft(H11,length);
%H11= [H11,zeros(1,length-size(H11,2))];
T=tic;
%origin_ptrace = [origin_ptrace,zeros(1,length-size(origin_ptrace,2))];
fts2=fft(origin_ptrace,length);
out = ifft(TM.fftH(:,1,1).*fts2);
%outn = ifft(fftH'.*fts2);
time1=toc(T)
out1 = out(1:size(t,2))*p;
%out1n = outn(1:size(t,2))*p;
out22= out2(1:size(t,2)) *p;

%plot(t,out1);

%plot(t,out2(1:size(t,2



err = max(abs(out22-out1))
%errn = max(abs(out22-out1n))


T=tic;
fftt = exp(0.2548*pi*t);
time1=toc(T)

        