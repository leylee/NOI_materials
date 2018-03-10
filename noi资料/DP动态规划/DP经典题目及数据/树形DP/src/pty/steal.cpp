#  include<iostream>
using namespace std;
int  temp,f[2][608],n,ml,mr;
void  out()
{
      printf("%d\n",f[0][n-2*ml]);
      fclose(stdin);
      fclose(stdout);
      exit(0);      
}
void  dfstree(int p)
{
      int i,j,k,x,m,ff[608];
      scanf("%d%d",&m,&x);
      n-=2*m;
      memset(ff,-1,sizeof(ff));
      ff[0]=0;
      if  (x==0)
      {
          dfstree(0);
          dfstree(1);
          int m1,m2;
          for  (i=1;i<=n;i++)
          {  
            for  (m1=1;m1<=i-mr-ml-1;m1++)
            {
                 m2=i-m1-mr-ml;
                 ff[i]=max(ff[i],f[0][m1]+f[1][m2]);     
            }
            ff[i]=max(ff[i],f[0][i-ml]);
            ff[i]=max(ff[i],f[1][i-mr]);    
          }
      }
      else
      {   
          int  v,c; 
          for  (i=1;i<=x;i++)
          {
               scanf("%d%d",&v,&c);
               for  (j=n;j>=c;j--)     
               if  (ff[j-c]!=-1)   
                   ff[j]=max(ff[j-c]+v,ff[j]);
          }
      }
      for  (i=1;i<=n;i++)
             f[p][i]=ff[i];
      if  (p==0)  ml=m;
      else    mr=m;
      n+=2*m;
}
void  init()
{
      freopen("steal.in","r",stdin);
      freopen("steal.out","w",stdout);
      int m;
      scanf("%d",&n);
      n--;
      dfstree(0);      
}
int  main()
{
     init();     
     out();
}
