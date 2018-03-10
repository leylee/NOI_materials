#  include<iostream>
using namespace std;
int  dist[105],fa[105],f[105][105][105],w[105],a[105][105],p[105],n,k,maxx[105];
void  init()
{
      int i,j;
      freopen("river.in","r",stdin);
      freopen("river.out","w",stdout);
      scanf("%d%d",&n,&k);
      for  (i=1;i<=n;i++) 
      {
           scanf("%d%d%d",&w[i],&fa[i],&p[i]);
           a[fa[i]][++a[fa[i]][0]]=i;     
      }     
}
void  prep(int k,int sum)
{
      dist[k]=sum;
      for  (int i=1;i<=a[k][0];i++)
         prep(a[k][i],sum+p[a[k][i]]);
}
int  minn(int a,int b)
{
     if  (a==-1)
         return  (b);
     if  (a<b) 
         return  (a);
     else  return  (b);    
}
void  treedp(int k,int p)
{
      int l=104,r=104,g,i,j,m1,m2;
      if  (a[k][0])  {l=a[k][1];treedp(l,1);maxx[k]+=maxx[l];};
      if  (p<a[fa[k]][0])  {r=a[fa[k]][p+1];treedp(r,p+1);maxx[k]+=maxx[r];};
      maxx[k]++;
      for  (j=0;j<=maxx[k];j++)
        for  (g=fa[k];g!=-1;g=fa[g])
        {
             for  (m1=0;m1<=j-1&&m1<=maxx[l];m1++)
             {
                  m2=j-1-m1;     
                  if  (m2>maxx[r])  continue;
                  f[k][j][g]=minn(f[k][j][g],f[l][m1][k]+f[r][m2][g]);
             }
             for  (m1=0;m1<=j&&m1<=maxx[l];m1++)
             {
                  m2=j-m1;
                  if  (m2>maxx[r])  continue;     
                  f[k][j][g]=minn(f[k][j][g],f[l][m1][g]+f[r][m2][g]+w[k]*(dist[k]-dist[g]));
             }                       
        }                       
}
void  out()
{
      printf("%d\n",f[a[0][1]][k][0]);    
      fclose(stdin);
      fclose(stdout);
      exit(0);
}
int  main()
{
     init();     
     prep(0,0);
     fa[0]=-1;
     memset(f,-1,sizeof(f));
       for  (int g=0;g<=n;g++)
          f[104][0][g]=0;
     treedp(a[0][1],1);
     out();
}
