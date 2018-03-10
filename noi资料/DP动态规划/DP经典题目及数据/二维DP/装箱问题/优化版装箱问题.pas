var t,i,j,k,n,v:longint;
    w:array[0..20000] of longint;
    f:array[0..20000] of boolean;//降成一维  注意 从右向左刷
begin
 fillchar(f,sizeof(f),false);
 readln(v,n);
 //数据量不大选择排序【主要是qsort想不起来了】
 for i:=1 to n-1 do
  for j:=i+1 to n do
   if w[i]<w[j] then begin
    t:=w[i];
    w[i]:=w[j];
    w[j]:=t;
   end;
 f[0]:=true;
 for i:=1 to n do
  read(w[i]);
 t:=0;
 for i:=n downto 1 do
  begin
   if w[i]>v then continue;//跳出一次循环
   inc(t,w[i]);
   if t>v then t:=v;
   for j:=v downto w[i] do
    f[j]:=f[j]or f[j-w[i]];
  end;
 for j:=v downto 1 do
  if f[j] then break;
 writeln(v-j);
end.
