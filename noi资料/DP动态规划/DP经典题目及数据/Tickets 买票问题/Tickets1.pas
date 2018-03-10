program Tickets;
var
  i,j,k,l,m,n:longint;
  f:array[0..10000] of longint;
begin
  assign(input,'Tickets.in'); reset(input);
  assign(output,'Tickets.out'); rewrite(output);
  readln(n);
  f[0]:=1;
  for j:=1 to n do
    for i:=j to n do
      inc(f[i],f[i-1]);
  writeln(f[n]);
  close(input);
  close(output);
end.