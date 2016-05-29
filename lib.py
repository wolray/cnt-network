from numpy import *

def RandNet(cl,l,den):
    cw=10;
    n=round((cl+2)*(cw+2)*den)
    crd=random.rand(3,n)
    a=2*pi*crd[2:3]
    x=cumsum(r_[(cl+2)*crd[0:1],l*cos(a)],0)
    y=cumsum(r_[(cw+2)*crd[1:2],l*sin(a)],0)
    return x,y,a

def Cross(cl,x,y,a):
    xs,xd=1,cl+1
    k=tan(a)
    b=y[0:1]-k*x[0:1]
    n=a.shape[1]
    xc=zeros((n,n))
    yc=zeros((n,n))
    for j1 in range(n-1):
        for j2 in range(j1+1,n):
            xx=-(b[0,j1]-b[0,j2])/(k[0,j1]-k[0,j2])
            yy=-(b[0,j1]*k[0,j2]-b[0,j2]*k[0,j1])/(k[0,j1]-k[0,j2])
            if min(x[0,j1],x[1,j1])<xx<max(x[0,j1],x[1,j1]) and\
               min(y[0,j1],y[1,j1])<yy<max(y[0,j1],y[1,j1]) and\
               min(x[0,j2],x[1,j2])<xx<max(x[0,j2],x[1,j2]) and\
               min(y[0,j2],y[1,j2])<yy<max(y[0,j2],y[1,j2]) and\
               xs<xx<xd:
                xc[j1,j2]=xx
                yc[j1,j2]=yy
    for j in range(n):
        if (x[0,j]-xs)*(x[1,j]-xs)<0:
            xc[j,j]=xs;
            yc[j,j]=y[0,j]-(x[0,j]-xs)*tan(a[0,j])
        elif (x[0,j]-xd)*(x[1,j]-xd)<0:
            xc[j,j]=xd
            yc[j,j]=y[0,j]-(x[0,j]-xd)*tan(a[0,j])
    return xc,yc

def Trim(x,y,xc,yc):
    n=x.shape[1]
    for times in range(15):
        conv=count_nonzero(xc)
        for j in range(n):
            if count_nonzero(xc[j,:])+count_nonzero(xc[:,j])-(xc[j,j]!=0)<=1:
                xc[j,:]=xc[:,j]=yc[j,:]=yc[:,j]=0
        if conv==count_nonzero(xc):
            break
    print('trimming iterations: '+str(times))
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
    return x,y,xc,yc

def ToSpice(cl,l,beta,a,xc):
    xs,xd=1,cl+1
    sp=open('netpy.sp','w')
    sp.writelines('network (python)\n.op\n')
    sp.writelines('v source drain 10\n')
    secx=abs(1/cos(a))
    n=xc.shape[0]
    xc2=xc+xc.T-diag(diag(xc))
    sig=s0=0
    for i in range(n):
        jw=where(xc2[i,:]!=0)[0]
        if count_nonzero(xc2[i,:])>1:
            s=argsort(xc2[i,jw])
            xcsort=xc2[i,jw[s]]
            if xc2[i,jw[s[0]]]==xs:
                net2='source'
            else:
                net2=''.join([str(i),'x',str(jw[s[0]])])
            for si in range(len(s)-1):
                net1=net2
                if xc2[i,jw[s[si+1]]]==xd:
                    net2='drain'
                else:
                    net2=''.join([str(i),'x',str(jw[s[si+1]])])
                ri=''.join(['r',str(sig+si)])
                r=l*secx[0,i]*(xcsort[si+1]-xcsort[si])
                sp.writelines(' '.join([ri,net1,net2,str(r),'\n']))
            sig+=si+1
        jcw=where(xc[i,:]!=0)[0]
        if len(jcw)>1:
            for s in range(len(jcw)):
                rci=''.join(['rc',str(s+s0)])
                net1=''.join([str(i),'x',str(jcw[s])])
                net2=''.join([str(jcw[s]),'x',str(i)])
                if i!=jcw[s]:
                    sp.writelines(' '.join([rci,net1,net2,str(beta),'\n']))
            s0+=s+1
    sp.writelines('.end')
    sp.close()
