program bags01;
type arr=array[0..1000] of longint;
var w,v:arr;
    f:array[0..1000,0..1000] of longint;
    i,j,n,t,ans:longint;
function max(a,b:longint):longint;
 begin
  if a>b then exit(a) else exit(b);
 end;
begin
 fillchar(f,sizeof(f),0);
 fillchar(w,sizeof(w),0);
 fillchar(v,sizeof(v),0);
 readln(n);
 readln(t);
 for i:=1 to n do
  read(w[i]);
 for i:=1 to n do
  read(v[i]);
//initial
 for i:=1 to n do
  for j:=1 to t do
   if j>w[i] then begin
    f[i,j]:=max(f[i-1,j],f[i-1,j-w[i]]+v[i]);
   if f[i,j]>ans then ans:=f[i,j];
   end
   else f[i,j]:=f[i-1,j];
 writeln(ans);
end.
