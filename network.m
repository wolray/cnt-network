function [ids,r]=network(X,l,den,beta)

Xs=1;Xd=Xs+X;Y=10;
cut=1;
n=round((X+2)*(Y+2)*den);
A=rand(3,n);

a=cumsum([2*pi*A(3,:);pi/6*(-1+2*rand(cut-1,n))]);
x=cumsum([(X+2)*A(1,:);l/cut*cos(a)]);
y=cumsum([(Y+2)*A(2,:);l/cut*sin(a)]);
[xc,yc]=cross(x,y,a,Xs,Xd);

% figure(1)
% plot(x,y,'k');axis([Xs,Xd,0,Y],'square');xlabel('L/\mum');ylabel('W/\mum')

% figure(2)
% hold on
% plot(x,y,'k');axis([Xs,Xd,0,Y],'square');xlabel('L/\mum');ylabel('W/\mum')
% plot(xc(find(xc)),yc(find(yc)),'ro','MarkerSize',3)

[x,y,xc,yc,t]=trim(x,y,xc,yc);


% figure(3)
% hold on
% plot(x,y,'k');axis([Xs,Xd,0,Y],'square');xlabel('L/\mum');ylabel('W/\mum')
% plot(xc(find(xc)),yc(find(yc)),'ro','MarkerSize',3)

out(l,beta,a,Xs,Xd,xc);

disp('Paused: Press any key')
pause()
[ids,r]=getr();
