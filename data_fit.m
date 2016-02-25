function [y,p1,p2]=data_fit(ivar,dvar,n)

p=polyfit(ivar,dvar,n);
p1=p(1);
p2=p(2);
y=ivar*p(1)+p(2);