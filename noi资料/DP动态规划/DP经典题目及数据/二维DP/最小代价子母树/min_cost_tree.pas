var i,j,k,n,min:longint;
    a,g:array[0..1000] of longint;
    f:array[0..1000,0..1000] of longint;
begin
 assign(input,'sand8.in');reset(input);
 fillchar(f,sizeof(f),0);
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   g[i]:=g[i-1]+a[i];
  end;
 //f[i,j]=Min{f[i,k]+f[i+k,j-k]}+g[i,j]
 //f[i,1]=0
 for j:=2 to n do
  for i:=1 to n-j+1 do
   begin
    min:=maxlongint;
    for k:=1 to j-1 do
     if f[i,k]+f[i+k,j-k]<min then min:=f[i,k]+f[i+k,j-k];
    f[i,j]:=min+g[i+j-1]-g[i-1];
   end;
 writeln(f[1,n]);
 close(input);
 close(output);
end.
