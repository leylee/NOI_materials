#  include<iostream>
using  namespace  std;
int  f0[2000],f1[2000],n,a[2000][2000];
void  init()
{
      int i,j,k,l1,l2;
      freopen("stragedi.in","r",stdin);
      freopen("stragedi.out","w",stdout);
      scanf("%d",&n);
      for  (i=1;i<=n;i++)
      {
           scanf("%d%d",&k,&l2);
           for  (j=1;j<=l2;j++)
           {
                scanf("%d",&l1);
                a[k][++a[k][0]]=l1;
                a[l1][++a[l1][0]]=k; 
           }     
      }      
}
void  out()
{
      printf("%d\n",min(f0[0],f1[0]));
      fclose(stdin);
      fclose(stdout);    
      exit(0);
}
void  treedp(int k,int fa)
{
      int i,j;
      if  (a[k][0]==1&&a[k][1]==fa)  {f1[k]=1;return ;};
      for  (i=1;i<=a[k][0];i++)
         if  (a[k][i]!=fa)
            treedp(a[k][i],k);
      for  (i=1;i<=a[k][0];i++)
         if  (a[k][i]!=fa)
         {
             f1[k]+=min(f0[a[k][i]],f1[a[k][i]]);
             f0[k]+=f1[a[k][i]];
         }
      f1[k]++;
}
int  main()
{
     init();     
     treedp(0,-1);
     out();
}
