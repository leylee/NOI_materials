var i,j,n:integer;
    s,a:array[0..1000,0..1000] of integer;
function max(a,b:integer):integer;
 begin
  if a>b then exit(a) else exit(b);
 end;
function f(x,y:integer):integer;
 begin
  if s[x,y]=0 then begin
   if x>n then exit(0);
   s[x,y]:=max(f(x+1,y),f(x+1,y+1))+a[x,y];
  end;
  f:=s[x,y];
 end;
begin
 assign(input,'tria6.in'); reset(input);
//assign(output);
 readln(n);
 for i:=1 to n do
  begin
   for j:=1 to i do
    read(a[i,j]);
   readln;
  end;            {
 for i:=n downto 1 do
  for j:=i downto 1 do
   s[i,j]:=f(i,j); }
 writeln(f(1,1));
 close(input);
 close(output);
end.                            ]