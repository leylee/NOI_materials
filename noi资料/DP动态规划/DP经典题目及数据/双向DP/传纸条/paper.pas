var i,j,k,l,m,n:integer;
    f:array[0..50,0..50,0..50,0..50] of integer;
    a:array[0..50,0..50] of integer;
function max(a,b,c,d:integer):integer;
 begin
  if a<b then a:=b;
  if a<c then a:=c;
  if a<d then a:=d;
  exit(a);
 end;
begin
 fillchar(f,sizeof(f),0);
 read(m,n);
 for i:=1 to m do
  for j:=1 to n do
   read(a[i,j]);
 //initial end
 for i:=1 to m do
  for j:=1 to n do
   for k:=1 to m do
    for l:=1 to n do
     if (i=k)and(l=j) then f[i,j,k,l]:=max(f[i-1,j,k-1,l],f[i,j-1,k-1,l],f[i-1,j,k,l-1],f[i,j-1,k,l-1])+a[i,j]
      else
     f[i,j,k,l]:=max(f[i-1,j,k-1,l],f[i,j-1,k-1,l],f[i-1,j,k,l-1],f[i,j-1,k,l-1])+a[i,j]+a[k,l];
  writeln(f[m,n,m,n]);
end.