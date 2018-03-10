program Game1;
var
  i,j,k,l,m,n,p,q,min,max,maxn,minn:longint;
  a,g,sum:array[0..10000] of longint;
  f,c,b:array[0..1000,0..1000] of longint;
begin
  assign(input,'Game1.in'); reset(input);
  assign(output,'Game1.out'); rewrite(output);
  readln(n,m);
  dec(m);
  for i:=1 to n do begin
    readln(a[i]);
    g[i]:=a[i];
    g[n+i]:=a[i];
  end;
  minn:=maxlongint;   //maxlongint minn
  maxn:=0;            //maxn=0
  for l:=1 to n do begin
    fillchar(sum,sizeof(sum),0);
    fillchar(b,sizeof(b),0);
    for i:=1 to n do
      sum[i]:=sum[i-1]+g[i+l-1];
    for i:=1 to n do
      c[i,0]:=(sum[i] mod 10+10) mod 10;
  b:=c;
  for j:=1 to m do
    for i:=j+1 to n do begin
      max:=0;
      min:=maxlongint;
      for k:=j to i-1 do begin
        if b[k,j-1]*(((sum[i]-sum[k]) mod 10+10) mod 10)>max then
          max:=b[k,j-1]*(((sum[i]-sum[k]) mod 10+10) mod 10);
        if c[k,j-1]*(((sum[i]-sum[k]) mod 10+10) mod 10)<min then
          min:=c[k,j-1]*(((sum[i]-sum[k]) mod 10+10) mod 10);
      end;
      b[i,j]:=max;
      c[i,j]:=min;
    end;
    if b[n,m]>maxn then maxn:=b[n,m];
    if c[n,m]<minn then minn:=c[n,m];
  end;
  writeln(minn);
  writeln(maxn);
  close(input);
  close(output);
end.
