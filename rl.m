function r=rl(X,l,den,beta,times)

for i=1:times
    for j=1:length(l)
        [ids,r(i,j)]=network(X,l(j),den,beta);
        r
        i
    end
end
