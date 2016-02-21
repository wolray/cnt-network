clear
close all

[r,X]=data_load('rX10_l1d10b0');
[r,rmean]=data_clean(r,1,0);

figure
hold on
f1=plot(X,r,'kx');
f2=plot(X,rmean);
p=polyfit(X,rmean,1);
f3=plot(X,X*p(1)+p(2));
xlabel('Channel Length (\mum)')
ylabel('Total R (k\Omega)')
legend([f1(1),f2,f3],'Computed Data','Average Value','Regression Line','Location','NorthWest')