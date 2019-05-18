function z = testf1()
persistent y;
if isempty(y) || y < 0.1
    y = 1;
else
    y = y *0.1;
end
z=y;
end