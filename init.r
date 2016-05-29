setwd('D:/sync/nel/cnt-network')
source('lib.r')

cl=10;l=1;den=10
ls1=RandNet(cl,l,den)
x=ls1[[1]]
y=ls1[[2]]
a=ls1[[3]]
ls2=Cross(cl,x,y,a)
xc=ls2[[1]]
yc=ls2[[2]]
ls3=Trim(x,y,xc,yc)
xc=ls3[[3]]

beta=0
ToSpice(cl,l,beta,a,xc)