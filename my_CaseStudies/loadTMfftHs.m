for j = 1:48
    name = strcat('TMfftH',num2str(j));
    
    cmd1 = strcat(['load ', name]);
    eval(cmd1);
    for i = 1:48;
        cmd2 = strcat(['TM.fftH(:,i,j) = ', name,'(:,i)']);
        eval(cmd2);
    end
    cmd3 = strcat(['clear ', name]);
    eval(cmd3);
end
         