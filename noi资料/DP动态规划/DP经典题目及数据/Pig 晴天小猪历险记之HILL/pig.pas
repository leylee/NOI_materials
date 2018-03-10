program pig;
var i,j,k,l,m,n:longint;
    a,f:array[0..1000,0..1000] of longint;
  function max(x,y:longint):longint;
  var t:longint;
  begin
    max:=0;
    if x<y then t:=x
           else t:=y;
    max:=t;
  end;
  function min(x,y,z:longint):longint;
  var t:longint;
  begin
    min:=0;
    if x<y then t:=x
           else t:=y;
    if t<z then t:=t
           else t:=z;
    min:=t;
  end;
begin
  assign(input,'pig.in'); reset(input);
  assign(output,'pig.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    for j:=1 to i do
      read(a[i,j]);
  f:=a;
  for i:=2 to n do
    f[n,i]:=f[n,i-1]+f[n,i];
    if a[n,1]+a[n,n]<f[n,n] then f[n,n]:=a[n,1]+a[n,n];
  for j:=n downto 2 do
    if f[n,j]+a[n,j-1]<f[n,j-1] then  f[n,j-1]:=f[n,j]+a[n,j-1];

  for i:=n-1 downto 1 do begin
    for j:=1 to i do begin
      if (j<>1) and (j<>i) then f[i,j]:=max(f[i+1,j],f[i+1,j+1])+a[i,j];
      if j=1 then f[i,j]:=min(f[i+1,j],f[i+1,j+1],f[i+1,i+1])+a[i,j];
      if j=i then f[i,j]:=min(f[i+1,j],f[i+1,j+1],f[i+1,1])+a[i,j];
    end;
    for j:=1 to i-1 do
      if f[i,j]+a[i,j+1]<f[i,j+1] then
      f[i,j+1]:=f[i,j]+a[i,j+1];
      if f[i,i]+a[i,1]<f[i,1] then f[i,1]:=f[i,i]+a[i,1];

    for j:=1 to i-1 do
      if f[i,j]+a[i,j+1]<f[i,j+1] then
        f[i,j+1]:=f[i,j]+a[i,j+1];
      if f[i,1]+a[i,i]<f[i,i] then f[i,i]:=f[i,1]+a[i,i];

    for j:=i downto 2 do
      if f[i,j]+a[i,j-1]<f[i,j-1] then f[i,j-1]:=f[i,j]+a[i,j-1];
      if f[i,1]+a[i,i]<f[i,i] then f[i,i]:=f[i,1]+a[i,i];

    for j:=i downto 2 do
      if f[i,j]+a[i,j-1]<f[i,j-1] then f[i,j-1]:=f[i,j]+a[i,j-1];
  end;
  writeln(f[1,1]);
close(input);
close(output);
end.