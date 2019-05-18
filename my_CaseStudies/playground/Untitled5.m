b = 4e+07;


tt = tic;
A = zeros(5,b);
% a1 = rand(1,b);
% A(1,:) = a1;
% A(2,:) = a1;
% A(3,:) = a1;
% A(4,:) = a1;
% A(5,:) = a1;
s1 = sum(A);
t1 = toc(tt)


tt = tic;
s2 = zeros(1,b);
a1 = rand(1,b);
for i = 1 : 5
    s2 = s2 + a1;
end
t2 = toc(tt)