"""Résolution d'un problème d'ordonnancement de tyype flow shop a n produits et m machines"""



int n=...;
int m=...;
range I=1..n;
range K=1..m;
int p [j in K][i in I]= ...;
int M = 1000;
//var de décision
dvar int+ C[K][I][I];
dvar int+ Cmax;
dvar boolean x[K][I][I];
//F.O
minimize Cmax;
//S.C
subject to{


forall(i in I)
   forall(k in 1..m-1)
       sum(j in I)(C[k+1][j][i]-C[k][j][i])>=p[k+1][i];
       
forall(j in 1..n-1)
   forall(k in K)
       sum(i in I)(C[k][j+1][i]-p[k][i]*x[k][j+1][i]-C[k][j][i])>=0;

forall(i in I)
   forall(j in I)
       forall(k in K)
            Cmax>=C[k][j][i];
            
forall(k in K)
   forall(j in I)
       (sum(i in I)(x[k][j][i]))==1 ;

forall(k in K)
   forall(i in I)
       (sum(j in I)(x[k][j][i]))==1 ;
       
forall(k in K)
   forall(j in I)
       forall(i in I)
            C[k][j][i]-M*x[k][j][i]<=0;

forall(k in 2..m)
   forall(j in I)
       forall(i in I)
            x[k][j][i]==x[k-1][j][i];            

forall(i in I)
   forall(j in I)
       (sum(j in I)C[1][j][i]-p[1][i])>=0;

 }
