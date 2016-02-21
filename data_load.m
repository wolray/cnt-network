function [r,var]=data_load(filename)

load(filename);
var=data(1,:);
r=data(2:end,:);
