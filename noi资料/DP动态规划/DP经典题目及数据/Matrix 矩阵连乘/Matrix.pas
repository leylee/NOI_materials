program Matrix;
var
  i,j,k,l,m,n,x,y,min:longint;
  a,g:array[0..10000] of longint;
  sum,f:array[0..1000,0..1000] of longint;
begin
  assign(input,'Matrix1.in'); reset(input);
//  assign(output,'Matrix.out'); rewrite(output);
  fillchar(a,sizeof(a),0);
  readln(n);
  for i:=1 to n do begin
    readln(x,y);
    g[i]:=x;
    g[i+1]:=y;
  end;
  for i:=1 to n do
    f[i,1]:=0;
  for j:=2 to n do
    for i:=1 to n+j-1 do begin
      min:=maxlongint;
      for k:=1 to j-1 do begin
        if f[i,k]+f[k+i,j-k]+g[i]*g[i+j]*g[i+k]<min then
          min:=f[i,k]+f[k+i,j-k]+g[i]*g[i+j]*g[i+k];
      end;
      f[i,j]:=min;
    end;
  for i:=1 to n do begin
    for j:=1 to n-i+1 do write(f[i,j]:4);writeln;end;
  writeln(f[1,n]);
  close(input);
  close(output);
end.
