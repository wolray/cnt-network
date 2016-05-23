function [x,y]=LoadData(filename)
load(filename);
x=data(1,:);
y=data(2:end,:);
