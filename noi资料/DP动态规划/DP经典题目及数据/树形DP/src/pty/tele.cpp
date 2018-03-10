#  include<iostream>
using namespace std;
int  n,m,f[3005][3005],ff[3005],ft[3005],next[3005],last[3005],p,maxx[3005];
struct  arr
{
        int  y,v;        
}a[3005];
void  add(int x,int y,int v)
{
      a[++p].y=y;
      a[p].v=v;
      next[p]=last[x];
      last[x]=p;      
}
void  init()
{
      freopen("tele.in","r",stdin);
      freopen("tele.out","w",stdout);
      int i,j,k,y,v;
      scanf("%d%d",&n,&m);
      for  (i=1;i<=n-m;i++)
      {
           scanf("%d",&k);
           for  (j=1;j<=k;j++)
           {
                scanf("%d%d",&y,&v);
                add(i,y,v);     
           }    
      }       
      for  (i=n-m+1;i<=n;i++)
           scanf("%d",&f[i][1]);
}
void  out()
{
      int i;
      for  (i=m;f[1][i]<0&&i>0;i--);
      printf("%d\n",i);
      fclose(stdin);
      fclose(stdout);
      exit(0);  
}
void  treedp(int k)
{
      int i,j,g,l;
      if  (k>=n-m+1)  {maxx[k]=1;return;};
      for  (g=last[k];g;g=next[g])
      {
           treedp(a[g].y);
           maxx[k]+=maxx[a[g].y];
      } 
      for  (i=1;i<=m;i++)
           ft[i]=-21474836;
      ft[0]=0;//滚动数组 
      for  (g=last[k];g;g=next[g])//背包
      { 
           for  (i=1;i<=m;i++)
                ff[i]=-21474836;
           ff[0]=0;    
           for  (j=1;j<=maxx[k];j++)
           {
                for  (l=1;l<=maxx[a[g].y];l++)//注意上限 
                     if  (ft[j-l]!=-21474836)     
                         ff[j]=max(ff[j],ft[j-l]-a[g].v+f[a[g].y][l]);
                ff[j]=max(ff[j],ft[j]);
           }
           for  (i=1;i<=m;i++)
                ft[i]=ff[i];
      }
      for  (i=1;i<=m;i++)
           f[k][i]=ff[i];        
}
int  main()
{
     init();    
     treedp(1);
     out();
}
/*  树形DP这一点需注意
    就是要计算m所达到的上限，以免造成混乱，同时也达到剪枝的效果 
    方程是自己想的。f[i][j]表示以I为根的子数，有J个客户时，能赚到的最多的钱 
*/
