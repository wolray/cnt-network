function [x,y]=data_load(filename)

load(filename);
x=data(1,:);
y=data(2:end,:);
