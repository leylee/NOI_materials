program energy;
var
  i,j,k,l,m,n,max:longint;
  g,a:array[0..10000] of longint;
  f:array[0..1000,0..1000] of int64;
begin
  assign(input,'energy.in'); reset(input);
  assign(output,'energy.out'); rewrite(output);
  readln(n);
  for i:=1 to n do begin
    read(a[i]);
    g[i]:=a[i];
    g[n+i]:=a[i];
  end;
  for i:=1 to 2*n do
    f[i,1]:=0;
  for j:=2 to 2*n do
    for i:=1 to 2*n+j-1 do begin
      max:=0;
      for k:=1 to j-1 do begin
        if f[i,k]+f[k+i,j-k]+g[i]*g[i+j]*g[i+k]>max then
          max:=f[i,k]+f[k+i,j-k]+g[i]*g[i+j]*g[i+k];
      end;
      f[i,j]:=max;
    end;
  for i:=1 to n do
    if f[i,n]>max then
      max:=f[i,n];
  writeln(max);
  close(input);
  close(output);
end.