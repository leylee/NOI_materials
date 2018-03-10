const
  dx:array[1..8] of integer=(-2,-2,-1,-1,1,1,2,2);
  dy:array[1..8] of integer=(-1,1,-2,2,2,-2,1,-1);
var
  a,b:array[-20..900,-20..900]of longint;
  v:array[-20..900,-20..900]of boolean;
  i,j,k,x0,y0,l,m,n,x,y,z,min,h:longint;
begin
  assign(input,'soldier0.in');
  reset(input);
  assign(output,'soldier0.out');
  rewrite(output);
  fillchar(a,sizeof(a),0);
  fillchar(v,sizeof(v),0);
  read(m,n,k,l);
  for i:=0 to m do
    for j:=0 to n do  begin
      a[i,j]:=1;
      v[i,j]:=true;end;
  a[k,l]:=0;
  v[k,l]:=false;
  for i:=1 to 8 do begin
    a[k+dx[i],l+dy[i]]:=0;
    v[k+dx[i],l+dy[i]]:=false;end;
  for i:=1 to m do
    for j:=1 to n do
      if v[i,j] then a[i,j]:=a[i-1,j]+a[i,j-1];
  writeln(a[m,n]);
  close(input);
  close(output);
end.
