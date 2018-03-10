program Chorus;
var
  i,j,k,l,m,n,max,max1,p,min,min1,ans:longint;
  a,f,d,c:array[0..10000] of longint;
begin
  assign(input,'Chorus.in'); reset(input);
  assign(output,'Chorus.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  fillchar(f,sizeof(f),0);
  fillchar(c,sizeof(c),0);
  f[n]:=1;
    for i:=n downto 1 do begin
      max1:=0;
      for j:=i+1 to n do
        if (a[i]>a[j]) and (f[j]>=max1) then
          max1:=f[j];
        f[i]:=max1+1;
    end;
  c[1]:=1;
    for i:=1 to n do begin
      min1:=0;
      for j:=1 to i-1 do
        if (a[i]>a[j]) and (c[j]>=min1) then
          min1:=c[j];
        c[i]:=min1+1;
    end;
  ans:=0;
  for i:=1 to n do
    if f[i]+c[i]>=ans then
      ans:=f[i]+c[i];
  dec(ans);
  writeln(n-ans);
  close(input);
  close(output);
end.
