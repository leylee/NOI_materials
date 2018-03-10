var
  i,j,k,l,m,n:longint;
  sum,b:array[0..1000,0..1000] of longint;
  a:array[0..10000] of longint;
  function dfs(x,y:longint):longint;
  var
    x1,x2,k,i,j,min:longint;
  begin
    if b[x,y]<0 then begin
    if y=1 then b[x,y]:=0
      else begin
        min:=maxlongint;
        for k:=1 to y-1 do begin
          x1:=dfs(x,k)+dfs(k+1,y-k);
          if x1<min then
            min:=x1;
        end;
        b[x,y]:=min+sum[x,y];
      end;
    end;
    dfs:=b[x,y];
  end;
begin
  fillchar(b,sizeof(b),$ff);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to n do
    for j:=1 to n-i+1 do
      sum[i,j]:=sum[i,j-1]+a[i+j-1];
  write(dfs(1,n));
end.
