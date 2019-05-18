p = 0.1;
T = [1.3, 1.7, 1.8, 2.1];
phase = 2 * pi * [0.25, -0.25, 0.7, 0.4];
a = 2 * pi ./ T;
amp = [2, 4, 1.7, 2.1];
 p = 0.01;
t = 0 : p : 160;
Y = zeros(size(T, 2), length(t));
sum = zeros(size(t));

for i = 1 : size(T, 2)
    Y(i,:) = sin( a(i) * t + phase(i));
    sum = sum + Y(i,:);
end

% for i = 1 : size(T, 2)
%     plot(t, Y(i,:));
%     hold on;
% end

plot(t,sum,'r');