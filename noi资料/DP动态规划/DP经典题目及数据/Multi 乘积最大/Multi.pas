type
  arr=array[0..10000] of longint;
var
  i,j,k,l,m,n,max,p,q,u:longint;
  a,b,c:arr;
  f:array[0..1000,0..1000] of longint;
  s:string;
  function G(a1,a2:arr):longint;
  var
    i,j,k,l,m,n:longint;
    t:arr;
  begin
    for i:=1 to b[0] do
      for j:=1 to c[0] do
        inc(t[i+j-1],b[i]*c[j]);
        t[0]:=b[0]+c[0];
    for k:=1 to t[0] do begin
      inc(t[k+1],t[k] div 10);
      t[k]:=t[k] mod 10;
    end;
    while (t[k]=0) and (k>1) do
      dec(k);
      t[0]:=k;
    for i:=t[0] downto 1 do
      G:=t[k];
  end;
begin
  assign(input,'Multi.in'); reset(input);
  assign(output,'Multi.out'); rewrite(output);
  read(n);
  readln(m);
  read(s);
  for i:=1 to n do
    val(copy(s,1,i),f[i,0]);
  p:=0; q:=0;
  for j:=1 to m do
    for i:=1 to n do begin
      max:=0;
      for k:=1 to i-1 do begin
        inc(p); b[0]:=p;
        val(copy(s,k+1,i-k),b[i]);
        inc(q); c[0]:=q;
        c[i]:=f[k,j-1];
        if  c[i]*b[i]>max then
          max:=c[i]*b[i];
      end;
      f[i,j]:=max;
    end;
  writeln(f[n,m]);
  close(input);
  close(output);
end.