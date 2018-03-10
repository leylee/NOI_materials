//f[i,j]:=T(f[i-1,j-k*w[i]]);
//0<=k<=a[i]
const w:array[1..6] of integer=(1,2,3,5,10,20);
var i,j,k,s,c:longint;
    a:array[1..6] of longint;
    f:array[0..1000,0..1000] of boolean;
begin
 fillchar(f,sizeof(f),false);
 for i:=1 to 6 do
  read(a[i]);
 s:=0;
 for i:=0 to 6 do
  f[i,0]:=true;
 for i:=1 to 6 do
  begin
   s:=s+a[i]*w[i];
   for j:=s downto 1 do
    for k:=0 to a[i] do
     if (j>=k*w[i])and(f[i-1,j-k*w[i]]) then begin
      f[i,j]:=true;
      break;
     end;
  end;
 for j:=1 to s do
  if f[6,j] then inc(c);
 writeln(c);
end.