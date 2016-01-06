function out(l,a,Xs,Xd,xc)
sp=fopen('networks.sp','wt');
fprintf(sp,['networks\n','.op\n']);
fprintf(sp,['v source drain 10\n']);
secx=abs(sec(a));
n=size(xc,1);
xc2=xc+xc'-diag(diag(xc));
sig=0;
for i=1:n
    jfind=find(xc2(i,:));
    if length(jfind)>1
        [xcsort,s]=sort(xc2(i,jfind));
        istr=num2str(i);
        if xc2(i,jfind(s(1)))==Xs;
            net2='source';
        elseif xc2(i,jfind(s(1)))==Xd;
            net2='drain';
        elseif i<jfind(s(1))
            net2=[istr,'x',num2str(jfind(s(1)))];
        else
            net2=[num2str(jfind(s(1))),'x',istr];
        end
        for si=1:length(s)-1
            net1=net2;
            if xc2(i,jfind(s(si+1)))==Xs
                net2='source';
            elseif xc2(i,jfind(s(si+1)))==Xd
                net2='drain';
            elseif i<jfind(s(si+1))
                net2=[istr,'x',num2str(jfind(s(si+1)))];
            else
                net2=[num2str(jfind(s(si+1))),'x',istr];
            end
            ri=['r',num2str(sig+si)];
            r=l*secx(i)*(xcsort(si+1)-xcsort(si));
            rstr=num2str(r);
            fprintf(sp,[ri,' ',net1,' ',net2,' ',rstr,'\n']);
        end
        sig=sig+si;
    end
end
fprintf(sp,'.end');
fclose('all');