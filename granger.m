function p=granger(gene_1,gene_2)
n=length(gene_1);
[g1,g2]=sort_g(gene_1,gene_2);
g1_cha=g1*(300/90001);
g2_cha=g2*(300/90001);
%%lag 1
g1_t_2=g1_cha(2:end);%g1_t_1=g1_cha(1:n-1);
g2_t_1=g2_cha(1:n-1);g2_t_2=g2_cha(2:end);
X1=[ones(n-1,1),g1_t_2,g2_t_2];X2=[ones(n-1,1),g2_t_2];
[~,~,r]=regress(g2_t_1,X1);
RSSu1=r'*r;
[~,~,r1]=regress(g2_t_1,X2);
RSSr1=r1'*r1;
f_val1=((RSSr1-RSSu1)/1)/(RSSu1/(n-2*1-1));%自由度应该改为n-1-2*1-1
p_val1=fpdf(f_val1,1,n-2*1-1);
%%lag 2
g1_t2_2=g1_cha(2:n-1);g1_t2_3=g1_cha(3:end);
g2_t2_1=g2_cha(1:n-2);g2_t2_2=g2_cha(2:n-1);g2_t2_3=g2_cha(3:end);
X3=[ones(n-2,1),g1_t2_2,g1_t2_3,g2_t2_2,g2_t2_3];X4=[ones(n-2,1),g2_t2_2,g2_t2_3];
[~,~,r]=regress(g2_t2_1,X3);
RSSu2=r'*r;
[~,~,r1]=regress(g2_t2_1,X4);
RSSr2=r1'*r1;
f_val2=((RSSr2-RSSu2)/2)/(RSSu2/(n-2*2-1));%自由度应该改为n-2-2*2-1
p_val2=fpdf(f_val2,1,n-2*2-1);
%%lag 3
g1_t3_2=g1_cha(2:n-2);g1_t3_3=g1_cha(3:n-1);g1_t3_4=g1_cha(4:end);
g2_t3_1=g2_cha(1:n-3);g2_t3_2=g2_cha(2:n-2);g2_t3_3=g2_cha(3:n-1);g2_t3_4=g2_cha(4:n);
X5=[ones(n-3,1),g1_t3_2,g1_t3_3,g1_t3_4,g2_t3_2,g2_t3_3,g2_t3_4];X6=[ones(n-3,1),g2_t3_2,g2_t3_3,g2_t3_4];
[~,~,r]=regress(g2_t3_1,X5);
RSSu3=r'*r;
[~,~,r1]=regress(g2_t3_1,X6);
RSSr3=r1'*r1;
f_val3=((RSSr3-RSSu3)/3)/(RSSu3/(n-2*3-1));%自由度应该改为n-3-2*3-1
p_val3=fpdf(f_val3,1,n-2*3-1);
p=min([p_val1,p_val2,p_val3]);
end