% clear
% close all

% X=13;
% times=12;
% % r20=zeros(length(X),times);
% for i=1:length(X)
%     for j=1:times
%         [ids,r20(12,13)]=networks(X(i),1,20);
%         r20
%     end
% end

% r16_19=r50

% load('r19x12l1b20.mat')
% r1=r20
% load('r19x3l1b20.mat')
% r2=r20
% % load('r10_15.mat')
% % r3=r10_15
% % load('r16_19.mat')
% r20=[r1,r2]

% save('r19x15l1b50','r20')

% load('r19x15l1b50.mat')
load('r19x15l1b20.mat')
% load('r19x15l1b10.mat')

figure
hold on
X=2:20;
plot(X',r10,'ko')
plot(X',r20,'rx')
plot(X',r50,'bo');axis([2,20,0,90],'square');
xlabel('Channel length (\mum)');ylabel('Channel resistance (k\Omega)')

% r1_2=r50(1:2,:)
% save('r1_2','r1_2')
