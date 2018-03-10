Program Sand;
var
  i,j,k,l,m,n,x,y,z,min:longint;
  sum,f:array[0..1000,0..1000] of longint;
  b:array[0..1000] of longint;
begin
//  assign(input,'sand.in');reset(input);
//  assign(output,'sand.out');rewrite(output);
  fillchar(f,sizeof(f),0);
  fillchar(sum,sizeof(sum),0);
  fillchar(b,sizeof(b),0);
  readln(n);

  for i:=1 to n do
    read(b[i]);

  for i:=1 to n do
    for j:=1 to n-i+1 do
      sum[i,j]:=sum[i,j-1]+b[i+j-1];

{  for j:=2 to n do
     for i:=1 to n-j+1 do begin    /HuiLe/  }
   for i:=n-1 downto 1 do
     for j:=2 to n-i+1 do begin     {QiuYiming}
      min:=maxlongint;
      for k:=1 to j-1 do
        if min>f[i,k]+f[k+i,j-k] then
          min:=f[i,k]+f[k+i,j-k];
        f[i,j]:=min+sum[i,j];
     end;
  writeln(f[1,n]);
// close(input);
// close(output);
end.