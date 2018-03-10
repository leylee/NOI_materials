//f[i,j,k]=Max{f[i,L,k-1]*f[i+l,j-L,1]}
{(1<=j<=m)
(1<i<=2*n-j)
(1<=k<=j-1)
(k<=l<=j-1)
f[i,j,1]=g(i,j)
(g(i,j)=((sum[i+j-1]-sum[i-1])mod 10 +10)mod 10)
{由i开始的j个分k份
for j:=1 to m do
 for i=1 to n*2-j do
  for k:=1 to j-1 do
   begin
    for l:=k to j-1 do
     f[I,j,k]:=Max{f[i,L,k-1]*f[i+l,j-L,1]}
//   end;}
program stones;
const lg=100;
var n,i,j,k,l,s,max:longint;
    f,g:array[0..lg,0..lg,0..lg] of longint;
    s:array[0..lg] of longint;
begin
 s[0]:=0;
 read(n,m);
 for i:=1 to n do
  begin
   read(s[i]);
   inc(s[i],s[i-1]);
  end;
 for i:=1 to n do
  for j:=1 to n do
   f[i,j,1]:=s[i+j-1]-s[i-1];
 g:=f;
//initial end
 for j:=1 to n do
 for i=1 to n*2-j do
  begin
   s:=m;
   if s>j-1 then s:=j-1;
   for k:=1 to s do
    begin
     max:=0;
     min:=maxlongint;
     for l:=k to j-1 do
      begin
       if max<f[i,L,k-1]*f[i+l,j-L,1] then max:=f[i,l,k-1]*f[i+l,j-L,1];
       if min>g[i,L,k-1]*g[i+l,j-L,1] then min:=g[i,l,k-1]*g[i+l,j-L,1];
      end;
     f[i,j,k]:=max;
     g[i,j,k]:=min;
    end;
   end;
 max:=0;
 min:=maxlongint;
 for i:=1 to n do
  if f[i,n,m]>max then max:=f[i,n,m];
 for i:=1 to n do
  if g[i,n,m]<min then min:=g[i,n,m];
 writeln(min);
 writeln(max);
end.