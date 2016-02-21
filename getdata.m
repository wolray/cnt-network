clear
close all

X=10;
l=1.5:0.5:4;
den=10;
beta=20;
times=2;

r=rl(X,l,den,beta,times)
data=[l;r]

% save('rl1_05_4x5b20','r')
