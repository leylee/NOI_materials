program stones;
const lg=100;
var n,i,m,j,k,l,t,max,min:longint;
    f,g:array[0..lg,0..lg,0..lg] of longint;
    s,a:array[0..lg] of longint;
begin
 s[0]:=0;
 read(n,m);
 for i:=1 to n do
  begin
   read(a[i]);
   s[i]:=a[i]+s[i-1];
  end;
 for i:=n+1 to 2*n do
  s[i]:=a[i-n]+s[i-1];
 for i:=1 to 2*n do
  for j:=1 to n do
   f[i,j,0]:=1;
 for i:=1 to 2*n-1 do
  for j:=1 to n do
   f[i,j,1]:=(((s[i+j-1]-s[i-1])mod 10)+10)mod 10;
 g:=f;
//initial end
 for j:=1 to n do
 for i:=1 to n*2-j do
  begin
   t:=m;
   if t>j-1 then t:=j-1;
   for k:=1 to t do
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
