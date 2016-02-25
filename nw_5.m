clear
close all

[r,l]=data_load('rl7_X10d10b20.mat');
[r,rmean]=data_clean(r,2,0,0);

[rfit,p1,p2]=data_fit(log(l),log(rmean),1);
lc=1.5:0.01:4;
rc=exp(p2)*lc.^p1;

figure
hold on
f1=plot(l,r,'kx');
f2=plot(l,rmean,'b');
f3=plot(lc,rc,'r');
axis([1.5,4,0,1.9],'square')
xlabel('Average tube length (\mum)')
ylabel(['Channel resistance (k\Omega)'])
legend([f1(1),f2,f3],'Computed Data','Mean Value','Fitting Curve','Location','NorthEast')
