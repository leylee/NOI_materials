var
  i,j,k,l,m,n,min,max:longint;
  a,b:array[0..10000] of longint;
  f,sum,c:array[0..1000,0..1000] of longint;
begin
  assign(input,'Merge.in'); reset(input);
  assign(output,'Merge.out'); rewrite(output);
  readln(n);
  for i:=1 to n do begin
    read(a[i]);
    b[i]:=a[i];
  end;
  for i:=n+1 to 2*n do
    a[i]:=b[i-n];
  for i:=1 to 2*n do
    for j:=1 to 2*n-i+1 do
      sum[i,j]:=sum[i,j-1]+a[i+j-1];
  for j:=2 to n do begin
    for i:=1 to 2*n-j+1 do begin
      min:=maxlongint;
      max:=0;
      for k:=1 to j-1 do begin
        if min>f[i,k]+f[k+i,j-k]
          then min:=f[i,k]+f[k+i,j-k];
            f[i,j]:=min+sum[i,j];
        if max<c[i,k]+c[k+i,j-k]
          then max:=c[i,k]+c[k+i,j-k];
            c[i,j]:=max+sum[i,j];
      end;
    end;
    min:=maxlongint;
    max:=0;
  end;
  for l:=1 to n do begin
    if min>f[l,n] then
      min:=f[l,n];
    if max<c[l,n] then
       max:=c[l,n];
  end;
  writeln(min);
  writeln(max);
  close(input);
  close(output);
end.
