#  include<iostream>
using  namespace std;
int  f[108][108],n,m,len[108];
struct  arr
{
     int y,z;   
}a[108][108];
void  init()
{
      int i,j,x,y;
      freopen("apple.in","r",stdin);
      freopen("apple.out","w",stdout);
      scanf("%d%d",&n,&m); 
      for  (i=1;i<=n-1;i++)
      {
           scanf("%d%d",&x,&y);
           a[x][++len[x]].y=y;
           scanf("%d",&a[x][len[x]].z);
      }     
}
void  out()
{
      printf("%d\n",f[1][m]);
      fclose(stdin);
      fclose(stdout);
      exit(0);      
}
void  treedp(int k)
{
      int i,j,l,r;
      if  (len[k]==0)  return;
      treedp(a[k][1].y);
      l=a[k][1].y;
      treedp(a[k][2].y);
      r=a[k][2].y;     
      int m1,m2;     
      for  (i=1;i<=m;i++)
      {
           for  (m1=0;m1<=i-2;m1++)    
           {
                m2=i-2-m1;     
                f[k][i]=max(f[l][m1]+a[k][1].z+f[r][m2]+a[k][2].z,f[k][i]);
           }
           f[k][i]=max(f[l][i-1]+a[k][1].z,f[k][i]);
           f[k][i]=max(f[r][i-1]+a[k][2].z,f[k][i]);
      }    
}
int  main()
{
     init();     
     treedp(1);
     out();
}
