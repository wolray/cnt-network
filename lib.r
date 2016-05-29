RandNet=function(cl,l,den){
  cw=10
  n=round((cl+2)*(cw+2)*den)
  crd=matrix(runif(3*n),3)
  a=matrix(2*pi*crd[3,],1)
  x=apply(rbind((cl+2)*crd[1,],l*cos(a)),2,cumsum)
  y=apply(rbind((cw+2)*crd[2,],l*sin(a)),2,cumsum)
  return(list(x,y,a))
}

Cross=function(cl,x,y,a){
  xs=1;xd=cl+1
  k=tan(a)
  b=y[1,]-k*x[1,]
  n=dim(a)[2]
  xc=yc=matrix(numeric(n^2),n)
  for (j1 in 1:(n-1)){
    for (j2 in (j1+1):n){
      xx=-(b[1,j1]-b[1,j2])/(k[1,j1]-k[1,j2])
      yy=-(b[1,j1]*k[1,j2]-b[1,j2]*k[1,j1])/(k[1,j1]-k[1,j2])
      if (min(x[1,j1],x[2,j1])<xx && xx<max(x[1,j1],x[2,j1]) &&
          min(y[1,j1],y[2,j1])<yy && yy<max(y[1,j1],y[2,j1]) &&
          min(x[1,j2],x[2,j2])<xx && xx<max(x[1,j2],x[2,j2]) &&
          min(y[1,j2],y[2,j2])<yy && yy<max(y[1,j2],y[2,j2]) &&
          xs<xx && xx<xd){
        xc[j1,j2]=xx
        yc[j1,j2]=yy
      }
    }
  }
  for (j in 1:n){
    if ((x[1,j]-xs)*(x[2,j]-xs)<0){
      xc[j,j]=xs
      yc[j,j]=y[1,j]-(x[1,j]-xs)*tan(a[j])
    } else if ((x[1,j]-xd)*(x[2,j]-xd)<0){
      xc[j,j]=xd
      yc[j,j]=y[1,j]-(x[1,j]-xd)*tan(a[j])
    }
  }
  return(list(xc,yc))
}

Trim=function(x,y,xc,yc){
  n=dim(x)[2]
  for (times in 1:15){
    conv=sum(xc!=0)
    for (j in 1:n)
      if (sum(xc[j,]!=0)+sum(xc[,j]!=0)-(xc[j,j]!=0)<=1){
        xc[j,]=xc[,j]=yc[j,]=yc[,j]=0
      }
    if (conv==sum(xc!=0)){
      break
    }
  }
  print(paste('trimming iterations:',toString(times)))
  xc2=xc+t(xc)-diag(diag(xc))
  yc2=yc+t(yc)-diag(diag(yc))
  for (j in 1:n){
    if (sum(xc2[j,]!=0)>1){
      pos=(xc2[j,]!=0)
      if (x[1,j]<x[2,j]){
        x[1,j]=min(xc2[j,pos])
        x[2,j]=max(xc2[j,pos])
        y[1,j]=min(yc2[j,pos])
        y[2,j]=max(yc2[j,pos])
      } else {
        x[1,j]=max(xc2[j,pos])
        x[2,j]=min(xc2[j,pos])
        y[1,j]=max(yc2[j,pos])
        y[2,j]=min(yc2[j,pos])
      }
    } else {
      x[,j]=y[,j]=0
    }
  }
  return(list(x,y,xc,yc))
}

ToSpice=function(cl,l,beta,a,xc){
  xs=1;xd=cl+1
  sp=file('netr.sp','w')
  writeLines('network (r)\n.op',sp)
  writeLines('v source drain 10',sp)
  secx=abs(1/cos(a))
  n=dim(xc)[1]
  xc2=xc+t(xc)-diag(diag(xc))
  sig=s0=0
  for (i in 1:n){
    jw=which(xc2[i,]!=0)
    if (length(jw)>1){
      s=order(xc2[i,jw])
      xcsort=xc2[i,jw[s]]
      if (xc[i,jw[s[1]]]==xs){
        net2='source'
      } else {
        net2=paste(toString(i),'x',toString(jw[s[1]]),sep='')
      }
      for (si in 1:(length(s)-1)){
        net1=net2
        if (xc2[i,jw[s[si+1]]]==xd){
          net2='drain'
        } else {
          net2=paste(toString(i),'x',toString(jw[s[si+1]]),sep='')
        }
        ri=paste('r',toString(sig+si),sep='')
        r=l*secx[i]*(xcsort[si+1]-xcsort[si])
        writeLines(paste(ri,net1,net2,toString(r),sep=' '),sp)
      }
      sig=sig+si
    }
    jcw=which(xc[i,]!=0)
    if (length(jcw)>1){
      for (s in 1:length(jcw)){
        rci=paste('rc',toString(s+s0),sep='')
        net1=paste(toString(i),'x',toString(jcw[s]),sep='')
        net2=paste(toString(jcw[s]),'x',toString(i),sep='')
        rstr=toString(beta)
        if (i!=jcw[s]){
          writeLines(paste(rci,net1,net2,rstr,sep=' '),sp)
        }
      }
      s0=s0+s
    }
  }
  writeLines('.end',sp)
  close(sp)
}