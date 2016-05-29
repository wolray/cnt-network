function [x,y,a]=RandNet(cl,l,den)
cw=10;
n=round((cl+2)*(cw+2)*den);
crd=rand(3,n);
cut=1;

a=cumsum([2*pi*crd(3,:);pi/6*(-1+2*rand(cut-1,n))]);
x=cumsum([(cl+2)*crd(1,:);l/cut*cos(a)]);
y=cumsum([(cw+2)*crd(2,:);l/cut*sin(a)]);
