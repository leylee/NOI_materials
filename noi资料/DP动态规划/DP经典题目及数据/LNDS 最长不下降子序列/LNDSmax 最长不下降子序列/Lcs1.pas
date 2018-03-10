var
  i,j,k,l,m,n:longint;
  a,f:array[0..10000] of longint;
begin
  assign(input,'Lcs.in'); reset(input);
  assign(output,'Lcs.out'); rewrite(output);
  readln(n);
  fillchar(f,sizeof(f),$7f);
  for i:=1 to n do begin
    read(a[i]);
    for j:=1 to n do
      if a[i]<f[j] then begin
        f[j]:=a[i];
        break;
      end;
  end;
  for i:=1 to n+1 do
    if f[i]=f[0] then break;
  writeln(i-1);
  close(input);
  close(output);
end.