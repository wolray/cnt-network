function r=rX(X,l,den,beta,times)

for i=1:times
    for j=1:length(X)
        [ids,r(i,j)]=network(X(j),l,den,beta);
        r
    end
end
