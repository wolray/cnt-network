from numpy import *

def cross(x,y,a,Xs,Xd):
    k=tan(a)
    b=y[0:-1]-k*x[0:-1]
    cut,n=a.shape
    xc=yc=zeros((n,n))
    for j1 in range(n-1):
        for j2 in range(j1+1,n):
            for i1 in range(cut):
                for i2 in range(cut):
                    xx=-(b[i1,j1]-b[i2,j2])/(k[i1,j1]-k[i2,j2])
                    yy=-(b[i1,j1]*k[i2,j2]-b[i2,j2]*k[i1,j1])/(k[i1,j1]-k[i2,j2])
                    if min(x[i1,j1],x[i1+1,j1])<xx<max(x[i1,j1],x[i1+1,j1]) and\
                       min(y[i1,j1],y[i1+1,j1])<yy<max(y[i1,j1],y[i1+1,j1]) and\
                       min(x[i2,j2],x[i2+1,j2])<xx<max(x[i2,j2],x[i2+1,j2]) and\
                       min(y[i2,j2],y[i2+1,j2])<yy<max(y[i2,j2],y[i2+1,j2]) and\
                       Xs<xx<Xd:
                        xc[j1,j2]=xx
                        yc[j1,j2]=yy
    for j in range(n):
        if (x[0,j]-Xs)*(x[1,j]-Xs)<0:
            xc[j,j]=Xs
            yc[j,j]=y[0,j]-(x[0,j]-Xs)*tan(a[0,j])
        elif (x[0,j]-Xd)*(x[1,j]-Xd)<0:
            xc[j,j]=Xd
            yc[j,j]=y[0,j]-(x[0,j]-Xd)*tan(a[0,j])
    return xc,yc

def trim(x,y,xc,yc):
    n=x.shape[1]
    for times in range(15):
        conv=count_nonzero(xc)
        for j in range(n):
            if count_nonzero(xc[j,:])+count_nonzero(xc[:,j])-(xc[j,j]!=0)<=1:
                xc[j,:]=xc[:,j]=yc[j,:]=yc[:,j]=0
        if conv==count_nonzero(xc):
            break
    xc2=xc+xc.T-diag(diag(xc))
    yc2=yc+yc.T-diag(diag(yc))
    for j in range(n):
        if count_nonzero(xc2[j,:])>1:
            pos=where(xc2[j,:]!=0)
            if x[0,j]<x[1,j]:
                x[0,j]=xc2[j,pos].min(1)
                x[1,j]=xc2[j,pos].max(1)
                y[0,j]=yc2[j,pos].min(1)
                y[1,j]=yc2[j,pos].max(1)
            else:
                x[0,j]=xc2[j,pos].max(1)
                x[1,j]=xc2[j,pos].min(1)
                y[0,j]=yc2[j,pos].max(1)
                y[1,j]=yc2[j,pos].min(1)
        else:
            x[:,j]=y[:,j]=0
    return x,y,xc,yc,times

def out(l,beta,a,Xs,Xd,xc):
    sp=open('netpy.sp','w')
    sp.writelines('netpy\n.op\n')
    sp.writelines('v source drain 10\n')
    secx=abs(1/cos(a))
    n=xc.shape[0]
    xc2=xc+xc.T-diag(diag(xc))
    sig=s0=0
    for i in range(n):
        jwhere=where(xc2[i,:]!=0)[0]
        if count_nonzero(xc2[i,:])>1:
            s=argsort(xc2[i,jwhere])
            xcsort=xc2[i,jwhere[s]]
            if xc[i,jwhere[s[0]]]==Xs:
                net2='source'
            elif xc[i,jwhere[s[0]]]==Xd:
                net2='drain'
            else:
                net2=''.join([str(i),'x',str(jwhere[s[0]])])
            for si in range(len(s)-1):
                net1=net2
                if xc2[i,jwhere[s[si+1]]]==Xs:
                    net2='source'
                elif xc[i,jwhere[s[si+1]]]==Xd:
                    net2='drain'
                else:
                    net2=''.join([str(i),'x',str(jwhere[s[si+1]])])
                ri=''.join(['r',str(sig+si)])
                r=l*secx[0,i]*(xcsort[si+1]-xcsort[si])
                sp.writelines(''.join([ri,' ',net1,' ',net2,' ',str(r),'\n']))
            sig+=si+1
        jupwhere=where(xc[i,:]!=0)[0]
        jup=count_nonzero(xc[i,:])
        if jup>1:
            for s in range(jup):
                rci=''.join(['rc',str(s+s0)])
                net1=''.join([str(i),'x',str(jupwhere[s])])
                net2=''.join([str(jupwhere[s]),'x',str(i)])
                rstr=str(beta)
                if i!=jupwhere[s]:
                    sp.writelines(''.join([rci,' ',net1,' ',net2,' ',rstr,'\n']))
            s0+=s+1
    sp.writelines('.end')
    sp.close()
