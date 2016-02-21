clear
close all

[r10,X]=data_load('rX15_l1d10b10.mat')
[r20,X]=data_load('rX15_l1d10b20.mat')
[r50,X]=data_load('rX15_l1d10b50.mat')

[r10,rmean10]=data_clean(r10,5,6,0.5)
[r20,rmean20]=data_clean(r20,5,6,0.5)
[r50,rmean50]=data_clean(r50,5,6,0.5)

figure
hold on
plot(X,r10,'ko')
f1=plot(X,rmean10,'k');
plot(X,r20,'rx')
f2=plot(X,rmean20,'r');
plot(X,r50,'bo')
f3=plot(X,rmean50,'b');
axis([2,20,0,90],'square')
xlabel('Channel length (\mum)')
ylabel('Channel resistance (k\Omega)')
legend([f1,f2,f3],'\beta=10','\beta=20','\beta=50','Location','NorthWest')