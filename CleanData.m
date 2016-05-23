function [y,ymean]=CleanData(y,headcut,endcut,scale)

m=size(y,1);
y=sort(y,1);

y=y(headcut+1:end-endcut,:);

ymean=mean(y,1);
for i=1:(m-(headcut+endcut))
    y(i,:)=y(i,:)-scale*rand()*(y(i,:)-ymean);
end
