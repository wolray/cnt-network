from lib import *

cl=10;l=1;den=10
x,y,a=RandNet(cl,l,den)
xc,yc=Cross(cl,x,y,a)
x,y,xc,yc=Trim(x,y,xc,yc)

beta=0
ToSpice(cl,l,beta,a,xc)
