function [r,rmean]=data_clean(r,headcut,endcut,scale)

m=size(r,1);
r=sort(r,1);

r=r(headcut+1:end-endcut,:);

rmean=mean(r,1);
for i=1:(m-(headcut+endcut))
    r(i,:)=r(i,:)-scale*rand()*(r(i,:)-rmean);
end