program dp_ex3_01bags_updated;
const maxn=100;
var f,w,v:array[0..maxn] of longint;
    i,j,n,wm:longint;
begin
 fillchar(f,sizeof(f),0);
 read(n,wm);
 for i:=1 to n do
  read(w[i],v[i]);
 for i:=1 to n do
  for j:=wm downto 1 do
   if (j>=w[i])and(f[j]<f[j-w[i]]+v[i]) then f[j]:=f[j-w[i]]+v[i];
 writeln(f[wm]);
end.