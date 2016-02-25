function y=data_polyfit(ivar,dvar,n)

p=polyfit(ivar,dvar,n);
y=ivar*p(1)+p(2);