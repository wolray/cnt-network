function [ids,r]=getr()
lis=fopen('networks.lis');
fseek(lis,0,-1);

while ~feof(lis)
    if strcmp(fgetl(lis),' ****  voltage sources')
       break
    end
end

fseek(lis,77,0);
ids0=fgetl(lis);
if ids0(end)=='k'
    ids=abs(sscanf(ids0,'%f')*1e3);
elseif ids0(end)=='m'
    ids=abs(sscanf(ids0,'%f')*1e-3);
elseif ids0(end)==' '
    ids=abs(str2num(ids0));
else
    ids=inf;
end

r=10/ids;
fclose('all');