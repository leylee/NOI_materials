var
  i,j,k,l,m,n,max:longint;
  a,b:array[0..1000000] of longint;
begin
  assign(input,'Tour.in'); reset(input);
  assign(output,'Tour.out'); rewrite(output);
  readln(n,m) ;
  for i:=1 to m-1 do
    b[i]:=-1000;
  for i:=1 to n do
    for j:=1 to m-1 do begin
      read(a[j]);
      if a[j]>b[j] then
        b[j]:=a[j];
    end;
  for i:=1 to m-1 do
    if b[i]<b[i-1]+b[i] then
      b[i]:=b[i-1]+b[i];
  max:=0;
  for i:=1 to m-1 do
    if b[i]>max then
      max:=b[i];
  writeln(max);
  close(input);
  close(output);
end.