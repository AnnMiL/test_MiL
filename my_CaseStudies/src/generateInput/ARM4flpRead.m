clear;
path = '../lib';
addpath(genpath(path));
path = '../../input';
save_name = 'ARM4coresfloorplan';
addpath(genpath(path));
fid = fopen('arm4core.flp','r');

[node, table] = scanfFlp(fid);

if size(node, 1) ~= size(table, 1)
    error('file is wrong');
end

flp = generateFlp(node, table);

savefile = strcat([path,'/',save_name]);
save(savefile, 'flp');
fclose(fid);
rmpath(genpath(path));
    