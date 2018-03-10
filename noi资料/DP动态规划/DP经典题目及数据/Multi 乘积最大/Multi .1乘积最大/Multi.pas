type
  arr=array[0..40] of longint;
var
  i,j,k,l,m,n,p,q,ans:longint;
  s,str:string;
  max:arr;
  a,b,f:array[0..1000] of arr;
  function G(a,b:arr):longint;
  var
    i,j,k,l,m,n:longint;
    c:array[0..10000] of longint;
  begin
    fillchar(c,sizeof(c),0);
    c[0]:=a[0]+b[0];
    for i:=1 to a[0] do
      for j:=1 to b[0] do
        inc(c[i+j-1],a[i]*b[j]);
    for k:=1 to c[0] do begin
      if c[k]>9 then begin
        inc(c[k+1],c[k] div 10);
        c[k]:=c[k] mod 10;
      end;
    end;
    while (c[k]=0) and (k>1) do
      dec(k);
      c[0]:=k;
    for i:=c[0] downto 1 do
      m:=c[i];
    G:=m;
  end;
begin
//  assign(input,'Multi.in'); reset(input);
//  assign(output,'Multi.out'); rewrite(output);
  read(n);
  readln(m);
  read(s);
  for i:=1 to n do begin
    str:=copy(s,1,i);
    l:=length(str);
    f[i][0]:=l;
    for q:=1 to l do
      f[i][q]:=ord(str[l-q+1])-48;
  end;
  p:=0; q:=0;
  ans:=0;
  for j:=1 to m do
    for i:=n downto j+1 do begin
      fillchar(max,sizeof(max),0);
      for k:=j to n-1 do begin
        inc(p);
        val(copy(s,k+1,i-k),a[p][0]);
        inc(q);
        b[q][0]:=f[k][0];
        if G(b[q],a[p])>max[0] then
          max[0]:=G(b[q],a[p]);
      end;
      f[i][0]:=max[0];
    end;
  writeln(f[n][0]);
  close(input);
  close(output);
end.