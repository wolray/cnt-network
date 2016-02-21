function r=rl(X,l,den,beta,times)

for i=1:times
    for j=1:length(l)
        [ids,r(i,j)]=networks(X,l(j),den,beta);
        r
    end
end
