program Soldier;
const
  dx:array[1..8] of integer=(1,2,2,1,-1,-2,-2,-1);
  dy:array[1..8] of integer=(2,1,-1,-2,2,1,-1,-2);
var
  x0,y0,x,y,i,j,k,l,m,n:longint;
  a:array[-2..1000,-2..1000] of boolean;
  b:array[-2..1000,-2..1000] of longint;
begin
  assign(input,'Soldier.in'); reset(input);
  assign(output,'Soldier.out'); rewrite(output);
  fillchar(a,sizeof(a),true);
  fillchar(b,sizeof(b),0);
  read(m,n);
  readln(x0,y0);
  a[x0,y0]:=false;
  for i:=1 to 8 do
    a[x0+dx[i],y0+dy[i]]:=false;
  b[0,0]:=1;
  for i:=0 to m do
    for j:=0 to n do begin
      if (a[i,j]=true) and ((i<>0) or (j<>0)) then begin
        b[i,j]:=b[i-1,j]+b[i,j-1];
      end;
      if a[i,j]=false then b[i,j]:=0;
     end;
  write(b[m,n]);
  close(input);
  close(output);
end.