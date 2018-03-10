program Lnds;
var
  i,j,k,l,m,n:longint;
  a,f,c:array[-1..10000] of longint;
begin
  assign(input,'Lnds.in'); reset(input);
  assign(output,'Lnds.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  fillchar(c,sizeof(c),$2f);
  f:=a;
  c[0]:=1;
  c[1]:=a[1];
  for i:=2 to n do
  begin
    for j:=1 to c[0]+1 do
      if c[j]>f[i] then
      begin
        c[j]:=f[i];
        break;
      end;
      if c[c[0]+1]<>c[-1] then begin
        inc(c[0]);
      end;
  end;
  writeln(c[0]);
  close(input);
  close(output);
end.