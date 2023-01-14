function [A1,B1]=lasso_regress(gene_1,gene_2,degree,lambda)
le_g1=length(gene_1);
co=max(gene_1)-min(gene_1);
%st=co/le_g1;
t=linspace(min(gene_1),max(gene_1),le_g1);
[a1,b1]=sort_g(gene_1,gene_2);
ap1=polytran(a1,degree);
a_mean=mean(ap1);
a_var=std(ap1);
ap1=(ap1-a_mean)./a_var;
bp1=polytran(b1,degree);
bp1=(bp1-a_mean)./a_var;
%t=zscore(t);%归一化处理
[B,fit]=lasso(ap1,t','Alpha',1,'Lambda',lambda);%,'Lambda',0.04);%,'Intercept',false);
A1=ap1*B+fit.Intercept;
B1=bp1*B+fit.Intercept;
%gene_1=A1;gene_2=B1;
end
