clear
close all

[r,X]=data_load('rX10_l1d10b0');
[r,rmean]=data_clean(r,2,3,0.3);

figure
hold on
f1=plot(X,r,'kx');
f2=plot(X,rmean,'b');
rf=data_fit(X,rmean,1)
f3=plot(X,rf,'r');
xlabel('Channel Length (\mum)')
ylabel('Total R (k\Omega)')
legend([f1(1),f2,f3],'Computed Data','Mean Value','Linear Regression','Location','NorthWest')