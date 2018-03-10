program dp_ex1_traingle;
const maxn=100;
var a,b:array[0..maxn,0..maxn] of longint;
    i,j,n,x:longint;
begin
 fillchar(a,sizeof(a),0);
 fillchar(b,sizeof(b),0);
 read(n);
 for i:=1 to n do
  for j:=1 to i do
   read(a[i,j]);

 for i:=n downto 1 do
  for j:=i downto 1 do begin
   if b[i+1,j]>b[i+1,j+1] then x:=b[i+1,j]
                          else x:=b[i+1,j+1] ;
   b[i,j]:=x+a[i,j];
  end;
 writeln(b[1,1]);
end.