function c=ComputeCdenVsDen(x,l,den,beta,times)

for i=1:times
    for j=1:length(den)
        cden(i,j)=GenNw(x,l,den(j),beta)
    end
end
