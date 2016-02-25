function [xc,yc]=cross(x,y,a,Xs,Xd)
k=tan(a);
b=y(1:end-1,:)-k.*x(1:end-1,:);
cut=size(a,1);
n=size(a,2);
xc=zeros(n,n);yc=zeros(n,n);

for j1=1:n-1
    for j2=j1+1:n
        for i1=1:cut
            for i2=1:cut
                xx=-(b(i1,j1)-b(i2,j2))/(k(i1,j1)-k(i2,j2));
                yy=-(b(i1,j1)*k(i2,j2)-b(i2,j2)*k(i1,j1))/(k(i1,j1)-k(i2,j2));
                if min(x(i1,j1),x(i1+1,j1))<xx && xx<max(x(i1,j1),x(i1+1,j1)) && ...
                        min(y(i1,j1),y(i1+1,j1))<yy && yy<max(y(i1,j1),y(i1+1,j1)) && ...
                        min(x(i2,j2),x(i2+1,j2))<xx && xx<max(x(i2,j2),x(i2+1,j2)) && ...
                        min(y(i2,j2),y(i2+1,j2))<yy && yy<max(y(i2,j2),y(i2+1,j2)) && ...
                        Xs<xx && xx<Xd
                    xc(j1,j2)=xx;
                    yc(j1,j2)=yy;
                end
            end
        end
    end
end

for j=1:n
    if (x(1,j)-Xs)*(x(2,j)-Xs)<0
        xc(j,j)=Xs;
        yc(j,j)=y(1,j)-(x(1,j)-Xs)*tan(a(j));
    elseif (x(1,j)-Xd)*(x(2,j)-Xd)<0
        xc(j,j)=Xd;
        yc(j,j)=y(1,j)-(x(1,j)-Xd)*tan(a(j));
    end
end