clear
close all

[r,l]=data_load('rl5_X10d10b20.mat');
rmean=mean(r,1);

plot(l,rmean,'rx-')
axis([1.5,4,0,1.7],'square')
xlabel('Average tube length (\mum)')
ylabel(['Channel resistance (k\Omega)'])
