var
  i,j,k,l,m,n:longint;
  f:array[0..1000,0..1000] of longint;
  function asd(x,y:longint):longint;
  begin
    if f[x,y]<>0 then exit(f[x,y]);
    if (x=y) or (y=0) then f[x,y]:=1
      else f[x,y]:=asd(x-1,y-1)+asd(x-1,y);
    asd:=f[x,y];
  end;
begin
  assign(input,'Tickets.in'); reset(input);
  assign(output,'Tickets.out'); rewrite(output);
  fillchar(f,sizeof(f),0);
  readln(n);
  writeln(asd(2*n,n)-asd(2*n,n-1));
  close(input);
  close(output);
end.