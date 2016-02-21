clear
close all

l=[0.5,1,1.5,2,3,4];
den=[28,6.5,3.2,1.9,1.0,0.6];
plot(l,den,'bx-');axis([0.5,4,0,28],'square');
xlabel('Average tube length (\mum)');
ylabel(['Critical tube density(\mum^{-2})'])
