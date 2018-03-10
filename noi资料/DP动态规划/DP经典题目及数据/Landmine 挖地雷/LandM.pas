program Landmine;
var
  i,j,k,l,m,n,ans,max:longint;
  a:array[0..1000,0..1000] of longint;
  b,c,p:array[0..10000] of longint;
begin
  assign(input,'LandM.in'); reset(input);
  assign(output,'LandM.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    read(b[i]);
  for i:=1 to n-1 do
    for j:=i+1 to n do
      read(a[i,j]);
  for i:=1 to n do
    c[i]:=b[i];
  for i:=n downto 1 do begin
    ans:=0;
    for j:=i+1 to n do
      if (a[i,j]=1) and (c[j]>ans) then begin
        ans:=c[j];
        k:=j;
      end;
    inc(c[i],ans);
    p[i]:=k;
  end;
  max:=-maxlongint;
  for i:=1 to n do
    if c[i]>max then begin
      max:=c[i];
      l:=i;
    end;
  write(l);
  l:=p[l];
  while l<>0 do begin
    write(' ',l);
    l:=p[l];
  end;
  writeln;
  writeln(max);
  close(input);
  close(output);
end.