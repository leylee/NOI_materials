//f[i,j]=f[i+1,j]+f[i,j+1]
const
  dx:array[1..8]of integer=(2,1,-1,-2,-2,-1,1,2);
  dy:array[1..8]of integer=(1,2,2,1,-1,-2,-2,-1);
var
  x,y,xm,ym,i,j:longint;
  m:array[-2..100,-2..100]of boolean;
  f:array[-1..100,-1..100]of int64;
begin
  assign(input,'soldier.in');reset(input);
  assign(output,'soldier.out');rewrite(output);
  readln(x,y,xm,ym);
  fillchar(m,sizeof(m),true);
  f[-1,0]:=1;
  m[xm,ym]:=false;
  for i:=1 to 8 do
    m[xm+dx[i],ym+dy[i]]:=false;
  for i:=0 to x do
    for j:=0 to y do
      if m[i,j] then f[i,j]:=f[i-1,j]+f[i,j-1];
  writeln(f[x,y]);
  close(input);
  close(output);
end.