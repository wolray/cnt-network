function [x,y,xc,yc,times]=trim(x,y,xc,yc)
n=size(x,2);

for times=1:15
    conv=length(find(xc));
    for j=1:n
        if length(find(xc(j,:)))+length(find(xc(:,j)))-(xc(j,j)~=0)<=1
            xc(j,:)=0;
            xc(:,j)=0;
            yc(j,:)=0;
            yc(:,j)=0;
        end
    end
    if conv==length(find(xc))
        break
    end
end

xc2=xc+xc'-diag(diag(xc));
yc2=yc+yc'-diag(diag(yc));
for j=1:n
    if length(find(xc2(j,:)))>1
        pos=find(xc2(j,:));
        if x(1,j)<x(2,j)
            [x(1,j),m1]=min(xc2(j,pos),[],2);
            [x(2,j),m2]=max(xc2(j,pos),[],2);
        else
            [x(1,j),m1]=max(xc2(j,pos),[],2);
            [x(2,j),m2]=min(xc2(j,pos),[],2);
        end
        y(1,j)=yc2(j,pos(m1));
        y(2,j)=yc2(j,pos(m2));
    else
        x(:,j)=[0;0];
        y(:,j)=[0;0];
    end
end