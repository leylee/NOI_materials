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
      ft[0]=0;//�������� 
      for  (g=last[k];g;g=next[g])//����
      { 
           for  (i=1;i<=m;i++)
                ff[i]=-21474836;
           ff[0]=0;    
           for  (j=1;j<=maxx[k];j++)
           {
                for  (l=1;l<=maxx[a[g].y];l++)//ע������ 
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
/*  ����DP��һ����ע��
    ����Ҫ����m���ﵽ�����ޣ�������ɻ��ң�ͬʱҲ�ﵽ��֦��Ч�� 
    �������Լ���ġ�f[i][j]��ʾ��IΪ������������J���ͻ�ʱ����׬��������Ǯ 
*/
