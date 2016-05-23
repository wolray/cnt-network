function r=ComputeChRVsChL(x,l,den,beta,times)

for i=1:times
    for j=1:length(X)
        [ids,r(i,j)]=GenNw(x(j),l,den,beta);
        r
    end
end
