program dp_ex2_01bags;
const maxn=100;
var w,v:array[0..maxn] of longint;
    f:array[0..maxn,0..maxn] of longint;
    i,j,n,wm,x:longint;
begin
 fillchar(w,sizeof(w),0);
 fillchar(v,sizeof(v),0);
 fillchar(f,sizeof(f),0);
 read(n,wm);
 for i:=1 to n do
  read(w[i],v[i]);
 for i:=1 to n do
  for j:=1 to wm do begin
   f[i,j]:=f[i-1,j];
   if j>=w[i] then
    if f[i,j]<f[i-1,j-w[i]]+v[i] then f[i,j]:=f[i-1,j-w[i]]+v[i];
  end;
 writeln(f[n,wm]);
end.
