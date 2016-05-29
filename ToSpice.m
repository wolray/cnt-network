function ToSpice(cl,l,beta,a,xc)
xs=1;xd=cl+1;
sp=fopen('netm.sp','wt');
fprintf(sp,['network (matlab)\n','.op\n']);
fprintf(sp,['v source drain 10\n']);
secx=abs(sec(a));
n=size(xc,1);
xc2=xc+xc'-diag(diag(xc));
sig=0;
s0=0;
for i=1:n
    jw=find(xc2(i,:));
    if length(jw)>1
        [xcsort,s]=sort(xc2(i,jw));
        istr=num2str(i);
        if xc2(i,jw(s(1)))==xs;
            net2='source';
        else
            net2=[istr,'x',num2str(jw(s(1)))];
        end
        for si=1:length(s)-1
            net1=net2;
            if xc2(i,jw(s(si+1)))==xd
                net2='drain';
            else
                net2=[istr,'x',num2str(jw(s(si+1)))];
            end
            ri=['r',num2str(sig+si)];
            r=l*secx(i)*(xcsort(si+1)-xcsort(si));
            rstr=num2str(r);
            fprintf(sp,[ri,' ',net1,' ',net2,' ',rstr,'\n']);
        end
        sig=sig+si;
    end
    jcw=find(xc(i,:));
    if length(jcw)>1
        for s=1:length(jcw)
            rci=['rc',num2str(s+s0)];
            net1=[num2str(i),'x',num2str(jcw(s))];
            net2=[num2str(jcw(s)),'x',num2str(i)];
            if i~=jcw(s)
                fprintf(sp,[rci,' ',net1,' ',net2,' ',num2str(beta),'\n']);
            end
        end
        s0=s0+s;
    end
end
fprintf(sp,'.end');
fclose('all');
