clear;
path = '../lib';
addpath(genpath(path));
path = '../../input';
save_name = 'intel6700coresfloorplan';
addpath(genpath(path));
fid = fopen('intel6700.flp','r');

[node, table] = scanfFlp(fid);

if size(node, 1) ~= size(table, 1)
    error('file is wrong');
end

flp = generateFlp(node, table);

savefile = strcat([path,'/',save_name]);
save(savefile, 'flp');
fclose(fid);
rmpath(genpath(path));
    