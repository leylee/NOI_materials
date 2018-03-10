var i,j,n,kk,max:integer;
    a:array[0..1000,0..1000] of integer;
    k,f,p:array[0..1000] of integer;
procedure print(x:integer);
begin
 if p[x]=0 then begin write(x); exit; end;
 write(x,' ');
 print(p[x]);
end;

begin
 fillchar(f,sizeof(f),0);
 fillchar(p,sizeof(p),0);
//initial begin
 readln(n);
 for i:=1 to n do
  read(k[i]);
 for i:=1 to n-1 do
  for j:=i+1 to n do
   read(a[i,j]);
//initial end
//dg begin
 for i:=n downto 1 do
  begin
   max:=0;
   kk:=0;
   for j:=i+1 to n do
    if (a[i,j]=1)and(max<f[j]) then begin
      max:=f[j];
      kk:=j;
    end;
   f[i]:=k[i]+max;
   p[i]:=kk;
  end;
//dg end
//output begin
 max:=0;
 for i:=1 to n do
  if max<f[i] then begin
   max:=f[i];
   kk:=i;
  end;
 print(kk);
 writeln;
 writeln(max);
end.