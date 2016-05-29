clear
close all

cl=10;l=1;den=10;
[x,y,a]=RandNet(cl,l,den);
[xc,yc]=Cross(cl,x,y,a);

region=[1,cl+1,1,11];
figure
hold on
plot(x,y,'k');axis(region,'square')
plot(xc(find(xc)),yc(find(yc)),'ro','markersize',3)
plot(region(1)*ones(1,2),region([3,4]),'k','linewidth',3)
plot(region(2)*ones(1,2),region([3,4]),'k','linewidth',3)
AddTextSD(region,12,'(a)')
axis off
box on

[x,y,xc,yc]=Trim(x,y,xc,yc);

figure
hold on
plot(x,y,'k');axis(region,'square')
plot(xc(find(xc)),yc(find(yc)),'ro','markersize',3)
plot(region(1)*ones(1,2),region([3,4]),'k','linewidth',3)
plot(region(2)*ones(1,2),region([3,4]),'k','linewidth',3)
AddTextSD(region,12,'(b)')
axis off
box on

beta=0;
ToSpice(cl,l,beta,a,xc);

% disp('Paused: Press any key')
% pause()
% [ids,r]=ReadR();

% cden=size(find(xc~=0),1)/(x*(cw+2));
