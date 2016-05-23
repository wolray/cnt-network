function [ids,r]=GenNw(cl,l,den,beta)

cw=10;cl=10;
xs=1;xd=xs+cl;
range=[xs,xd,1,cw+1];
cut=1;
n=round((cl+2)*(cw+2)*den);
angle=rand(3,n);

a=cumsum([2*pi*angle(3,:);pi/6*(-1+2*rand(cut-1,n))]);
x=cumsum([(cl+2)*angle(1,:);l/cut*cos(a)]);
y=cumsum([(cw+2)*angle(2,:);l/cut*sin(a)]);
[xc,yc]=Cross(x,y,a,xs,xd);

figure
hold on
plot(x,y,'k');axis([xs,xd,1,cw+1],'square')
plot(xc(find(xc)),yc(find(yc)),'ro','markersize',3)
plot(xs*ones(1,2),[1,cw+1],'k','linewidth',3)
plot(xd*ones(1,2),[1,cw+1],'k','linewidth',3)
AddTextSD(range,12,'(a)')
axis off
box on

[x,y,xc,yc,t]=Trim(x,y,xc,yc);

figure
hold on
plot(x,y,'k');axis(range,'square')
plot(xc(find(xc)),yc(find(yc)),'ro','markersize',3)
plot(xs*ones(1,2),[1,cw+1],'k','linewidth',3)
plot(xd*ones(1,2),[1,cw+1],'k','linewidth',3)
AddTextSD(range,12,'(b)')
axis off
box on

% Out(l,beta,a,xs,xd,xc);
% disp('Paused: Press any key')
% pause()
% [ids,r]=GetR();

% cden=size(find(xc~=0),1)/(x*(cw+2));
