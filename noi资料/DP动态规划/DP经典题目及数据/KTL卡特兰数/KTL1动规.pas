program KTL;
var
  i,j,k,l,n,m:longint;
  f:array[0..1000,0..1000] of longint;
begin
  readln(n,m);
  fillchar(f,sizeof(f),0);
  for i:=0 to n do
    f[i,0]:=1;
  for j:=1 to m do
    f[0,j]:=0;
  for j:=1 to m do
    for i:=1 to n do
      f[i,j]:=f[i-1,j-1]+f[i-1,j];
  writeln(f[n,m]);
end.