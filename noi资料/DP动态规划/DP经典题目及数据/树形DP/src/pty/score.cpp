# include<iostream>
using  namespace  std;
int  a[500][500],f[500][500],n,m,v[500];
void  init()
{
      int i,fa;
      scanf("%d%d",&n,&m);
      for (i=1;i<=n;i++)
      {
          scanf("%d%d",&fa,&v[i]);    
          a[fa][++a[fa][0]]=i;
      }      
}
void  treedp(int fa,int k)
{
      int  p,l,r,i,j;
      p=a[fa][k];      
      if  (a[p][0])  treedp(p,1);
      l=a[p][1];
      if  (k<a[fa][0])  treedp(fa,k+1);
      r=a[fa][k+1];
      int  m1,m2;
      for  (i=1;i<=m;i++)
      {
           f[p][i]=f[r][i];
           for  (m1=0;m1<=i-1;m1++)
           {
                m2=i-1-m1;     
                f[p][i]=max(f[l][m1]+f[r][m2]+v[p],f[p][i]);
           }
      }
}
int  main()
{
     freopen("score.in","r",stdin);
     freopen("score.out","w",stdout);
     init();
     treedp(0,1);
     printf("%d\n",f[a[0][1]][m]);   
     fclose(stdin);
     fclose(stdout);
     return  0; 
}
