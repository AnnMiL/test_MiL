clear;
t=0:0.1:10;
[A_a, A_i, B_a, B_i, INVC, H, T_init,A, B, beta_a, beta_i, StimesT0] = ThermalModel(t);

C = inv(INVC);
EA=cell(24,24);

for i=1:24
    for j=1:24
        EA{i,j}=zeros(size(t));
        for k=1:24
        EA{i,j} = EA{i,j} + H(:,i,k)' * C(j,k);
        end
    end
end

T0 = T_init;
Tinitt = cell(24,1);
for i =1:24
    Tinitt{i} = zeros(size(t));
    for k =1:24
        Tinitt{i} = Tinitt{i} + EA{i,k}*T0(k);
    end
end