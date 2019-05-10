clear
alpha_in = rtccurve([0 2 0.15]);
c1 = 1;
c2 = 1;

toff1 = 5;
toff2 = 13;
d = 35;
d1 = 10;
d2 = d - d1;


a1 = rtcaffine(alpha_in,1,d1);

a1_w = rtctimes(a1,c1);

K= minspeedbdfEDG(a1_w, toff1, 1);

ton1 = K / (1-K) * toff1 ;
beta1      = rtctdma(ton1, round(ton1+toff1), 1);
bli       = beta1(2);
bli       = rtcrdivide( bli, c1);
alpha_out = rtcmindeconv( alpha_in(1), bli);

rtcplot(alpha_out,50);
grid on;
a2 = rtcaffine(alpha_out,1,d2);
%a2_w = rtctimes(a2,c2);
K2 = minspeedbdfEDG(a2, toff2, 1);
ton2 = K2 / (1-K2) * toff2 *c2 ;


a3 = rtcaffine(alpha_in,1,d);

b = toff1+toff2+c1+c2;
p = minspeedbdfEDG(a3, b, 1);

k1 = p*c1;
k2 = p*c2;

Ton1 = k1 / (1-k1) * toff1 ;
Ton2 = k2 / (1-k2) * toff2 ;










