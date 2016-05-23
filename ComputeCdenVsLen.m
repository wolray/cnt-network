function c=ComputeCdenVsLen(x,l,den,beta,times)

for i=1:times
    for j=1:length(l)
        cden(i,j)=GenNw(x,l(j),den,beta)
    end
end
