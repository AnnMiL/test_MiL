tt = tic;
   [origin_ptrace, periodSamplePoints, maxIndex] = ObtainPeriodicPowerTrace(6,...
        2, 45, 36, 2000000, 0.2);
    t1 =toc(tt)