var
  i,j,k,l,m,n,min:longint;
  sum,f:array[0..1000,0..1000] of longint;
  a:array[0..10000] of longint;
begin
//  assign(input,'Sand.in'); reset(input);
//  assign(output,'Sand.out'); rewrite(output);
  fillchar(a,sizeof(a),0);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to n do
    for j:=1 to n-i+1 do
      sum[i,j]:=sum[i,j-1]+a[i+j-1];
    for j:=2 to n do
      for i:=1 to n-j+1 do begin
      min:=maxlongint;
      for k:=1 to j-1 do
        if min>f[i,k]+f[k+i,j-k]
          then min:=f[i,k]+f[k+i,j-k];
     f[i,j]:=min+sum[i,j];
    end;
  writeln(f[1,n]);
  close(input);
  close(output);
end.