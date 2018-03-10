program Stack;
var
  i,j,k,l,n,m:longint;
  f:array[0..1000,0..1000] of longint;
begin
  assign(input,'STACK.in'); reset(input);
  assign(output,'STACK.out'); rewrite(output);
  readln(n);
  fillchar(f,sizeof(f),0);
  for i:=1 to n do
    for j:=1 to n do begin
      f[i,0]:=1;
      f[0,j]:=0;
    end;
  for j:=1 to n do
    for i:=j to n do
      f[i,j]:=f[i-1,j]+f[i,j-1];
  writeln(f[n,n]);
  close(input);
  close(output);
end.