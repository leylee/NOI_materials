#  include<iostream>
using  namespace  std;
int  f0[6008],f1[6008],n,next[6008],last[6008],v[6008],root;
struct  arr
{
    int x,y;        
}a[6008];
void  add(int  i,int y)
{
      next[i]=last[y];      
      last[y]=i;
}
void  init()
{
      int i,j;
      freopen("party.in","r",stdin);
      freopen("party.out","w",stdout);
      scanf("%d",&n);
      for  (i=1;i<=n;i++)
           scanf("%d",&v[i]);
      root=n*(n+1)/2;
      for  (i=1;i<=n-1;i++)
      {
           scanf("%d%d",&a[i].x,&a[i].y);
           root-=a[i].x;
           add(i,a[i].y);
      }       
      scanf("%d%d",&i,&j);
}
void  out()
{
      printf("%d\n",max(f0[root],f1[root]));
      fclose(stdin);
      fclose(stdout);    
      exit(0);
}
void  treedp(int k)
{
      int g,x;
      for  (g=last[k];g;g=next[g])
      {
           x=a[g].x;
           treedp(x);
           f1[k]+=f0[x];
           f0[k]+=max(f1[x],f0[x]);
      }
      f1[k]+=v[k];
}
int  main()
{
     init();     
     treedp(root);
     out();
}
