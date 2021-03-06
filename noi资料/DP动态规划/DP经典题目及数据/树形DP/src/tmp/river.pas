program river;
var
  n,k,i,p:longint;
  w,lc,rc,dis,d,chn:array[0..101]of longint;
  f:array[0..101,0..52,0..101]of longint;
procedure dfs(k:longint);//计算距根节点的距离
var
  i:longint;
begin
  i:=lc[k];
  while i<>0 do
  begin
    dis[i]:=dis[k]+d[i];
    dfs(i);
    i:=rc[i];
  end;
end;

function work(i,j,rt:longint):longint;
var
  k,tmp:longint;
begin
  if f[i,j,rt]<>-1 then exit(f[i,j,rt]);
  f[i,j,rt]:=maxlongint;
  for k:=0 to j do
  begin
    tmp:=w[i]*(dis[i]-dis[rt]);
    if lc[i]<>0 then inc(tmp,work(lc[i],k,rt));
    if rc[i]<>0 then inc(tmp,work(rc[i],j-k,rt));
    if tmp<f[i,j,rt]then f[i,j,rt]:=tmp;
    if k<j then
    begin
      tmp:=0;
      if lc[i]<>0 then inc(tmp,work(lc[i],k,i));
      if rc[i]<>0 then inc(tmp,work(rc[i],j-k-1,rt));
      if tmp<f[i,j,rt]then f[i,j,rt]:=tmp;
    end;
  end;
  exit(f[i,j,rt]);
end;

begin
  assign(input,'river.in');
  reset(input);
  assign(output,'river.out');
  rewrite(output);
  readln(n,k);
  for i:=1 to n do
  begin
    readln(w[i],p,d[i]);
    if chn[p]=0 then lc[p]:=i else rc[chn[p]]:=i;
    chn[p]:=i;
  end;
  dfs(0);
  fillchar(f,sizeof(f),$ff);
  writeln(work(0,k,0));
  close(input);
  close(output);
end.
