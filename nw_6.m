
clear
close all

l=[0.5,0.6,0.7,0.8,0.9,1,1.2,1.4,1.6,1.8,2,2.5,3,3.5,4];
den=[27.0,18.7,13.9,10.3,8.6,6.5,4.9,3.6,2.9,2.3,1.8,1.23,0.93,0.71,0.58];

theta=1:0.1:10;
for i=1:length(theta)
    diff(i)=sum((theta(i)./l.^2-den).^2);
end

[diffmin,n]=min(diff,[],2);
c=theta(n)

lc=0.5:0.01:4;
denc=6.7./lc.^2;

figure
hold on
plot(l,den,'kx')
plot(lc,denc,'r')
xlabel('Average tube length (\mum)')
ylabel(['Critical tube density (\mum^{-2})'])
legend('Computed Data','Fitting Curve','Location','NorthEast')