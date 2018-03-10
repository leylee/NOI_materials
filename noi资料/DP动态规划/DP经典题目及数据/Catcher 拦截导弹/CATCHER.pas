program catcher;
var
  i,j,k,l,n,m,max,sum,min:longint;
  a,f,c:array[0..10000] of longint;
begin
  assign(input,'CATCHER.in'); reset(input);
  assign(output,'CATCHER.out'); rewrite(output);
  n:=0;
  while not eof do begin
    inc(n);
    read(a[n]);
  end;
  fillchar(f,sizeof(f),0);
    for i:=1 to n do
      for j:=1 to n do
        if a[i]>f[j] then begin
          f[j]:=a[i];
          break;
      end;
  for i:=1 to n do
    if f[i]=0 then break;
  writeln(i-1);
  max:=0;
  min:=maxlongint;
  sum:=0;
  fillchar(f,sizeof(f),$2f);
  for i:=1 to n do
    for j:=1 to n do
      if f[j]>a[i] then begin
        f[j]:=a[i];
        break;
      end;
  for i:=1 to n+1 do
    if f[i]=f[0] then break;
  writeln(i-1);
  close(input);
  close(output);
end.