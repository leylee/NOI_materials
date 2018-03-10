program Lnds;
var
  i,j,k,l,m,n,max,ans:longint;
  f,a,next:array[0..10000] of longint;
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
      if (a[i]<=a[j]) and (f[j]>max) then begin
        max:=f[j];
        k:=j;
      end;
    end;
    f[i]:=max+1;
    next[i]:=k;
  end;
  max:=0;
  for i:=1 to n do
    if f[i]>max then begin
      max:=f[i];
      k:=i;
    end;
  writeln(max);
  write(a[k]);
  while next[k]<>0 do begin
    write(' ',a[next[k]]);
    k:=next[k];
  end;
  close(input);
  close(output);
end.