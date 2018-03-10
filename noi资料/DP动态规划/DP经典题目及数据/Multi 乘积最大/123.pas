type
  arr=array[0..100000] of longint;
var
  i,j,k,l,m,n,max,p,q,u:longint;
  a,f:arr;
  s:string;
begin
  assign(input,'Multi.in'); reset(input);
  assign(output,'Multi.out'); rewrite(output);
  read(n);
  readln(m);
  read(s);
  for i:=1 to n do
    val(copy(s,1,i),f[i]);
  for j:=1 to m do
    for i:=n downto j+1 do begin
      max:=0;
      for k:=j to i-1 do begin
        val(copy(s,k+1,i-k),l);
        if max<=f[k]*l then max:=f[k]*l;
      end;
      f[i]:=max;
    end;
  writeln(f[n]);
  close(input);
  close(output);
end.