from math import pi
import numpy as np

X=10
l=1
beta=20
Xs=1
Xd=Xs+X
Y=10
cut=1
den=10
n=round((X+2)*(Y+2)*den)
A=np.random.rand(3,n)

a_head=2*pi*A[2:3]
a_cut=pi/6*(-1+2*np.random.rand(cut-1,n))
a=(np.row_stack((a_head,a_cut))).cumsum(0)
x_head=(X+2)*A[0:1]
x_cut=l/cut*np.cos(a)
x=(np.row_stack((x_head,x_cut))).cumsum(0)
y_head=(Y+2)*A[1:2]
y_cut=l/cut*np.sin(a)
y=(np.row_stack((y_head,y_cut))).cumsum(0)

from mydef import *
[xc,yc]=cross(x,y,a,Xs,Xd)
[x,y,xc,yc,times]=trim(x,y,xc,yc)
out(l,beta,a,Xs,Xd,xc)
