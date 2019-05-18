clear;
fid = fopen('arm8core.flp','r');

stop = 0;
node = cell(8,1);
properties = [];
table = [];
line = 0;
column = 1;
while ~stop
    [read count] = fscanf(fid,'%f',1);
    if count == 0
        [read count] = fscanf(fid,'%s',1);
        if count == 0
            stop = 1;
            table = [table;properties];
        else
        line = line + 1;
        node{line} = read;
        column = 1;
        table = [table;properties];
        end
    else
        column = column + 1;
        properties(column-1) = read;
    end
end

dist = [];
[x0, y0] = getCenter(table(1,1), table(1,2), table(1,3), table(1,4));
for i = 1 : size(table,1)
    
    [x, y] = getCenter(table(i,1), table(i,2), table(i,3), table(i,4));
    distance = ( (x - x0)^2 + (y - y0)^2 )^0.5;
    dist = [dist; distance];
end
    
    
    
flp = struct('node',{},'table',{},'dist',{});
flp(1).node =node;
flp(1).table  =table;
flp.dist = dist;

save armfloorplan flp;
fclose(fid);
    