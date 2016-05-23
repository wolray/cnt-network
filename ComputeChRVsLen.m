function r=ComputeChRVsLen(x,l,den,beta,times)

for i=1:times
    for j=1:length(l)
        [ids,r(i,j)]=GenNw(x,l(j),den,beta);
        r
        i
    end
end
