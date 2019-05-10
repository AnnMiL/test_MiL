
wer = CellImpulse();
ciInit(wer,5,4);

impulse = PeriodSample();
psPush(impulse, rand(1,200), 1, 16);
tt = tic;
for i = 1 : 5000
    ciAppendToff(wer, i , i+2, impulse);
end
t1 = toc(tt)



wer2 = CellImpulseV1();
ciInitV1(wer2,5,4);

impulse = PeriodSample();
psPush(impulse, rand(1,200), 1, 16);
tt = tic;
for i = 1 : 5000
    ciAppendToffV1(wer2, i , i+2, impulse);
end
t2 = toc(tt)