var i,j,k,n,v:longint;
    w:array[0..20000] of longint;
    f:array[0..20000,0..20000] of boolean;
begin
 fillchar(f,sizeof(f),false);
 readln

 (v,n);
 for i:=0 to n do
  f[i,0]:=true;
 for i:=1 to n do
  read(w[i]);

 for i:=1 to n do
  for j:=v downto 1 do
   if w[i]<=j then f[i,j]:=f[i-1,j]or f[i-1,j-w[i]]
     else  f[i,j]:=f[i-1,j];

 for j:=v downto 1 do
  if f[n,j] then break;
 writeln(v-j);
end.