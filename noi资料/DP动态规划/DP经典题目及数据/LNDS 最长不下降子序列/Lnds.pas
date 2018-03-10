program Lnds;
var
  i,j,k,l,m,n,max,ans:longint;
  f,a:array[0..10000] of longint;
begin
  assign(input,'Lnds.in'); reset(input);
  assign(output,'Lnds.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  f[n]:=1;
  for i:=n downto 1 do begin
    max:=0;
    for j:=i+1 to n do begin
      if (a[i]<=a[j]) and (f[j]>max) then
        max:=f[j];
      end;
      f[i]:=max+1;
    end;
  max:=0;
  for i:=1 to n do
    if f[i]>max then
      max:=f[i];
  writeln(max);
  close(input);
  close(output);
end.