var a,f,p:array[0..1000] of integer;
    i,j,n,max:integer;
procedure print(x:integer);
 begin
  if p[x]=0 then begin
   write(a[x]);
   exit;
  end;
  print(p[x]);
  write(' ',a[x]);
 end;
begin
 readln(n);
 for i:=1 to n do
  read(a[i]);
 fillchar(f,sizeof(f),0);

 for i:=1 to n do
  begin
   max:=0;
   for j:=1 to i do
    if (a[i]>a[j])and(max<f[j]) then begin
      max:=f[j];
      p[i]:=j;
     end;
   f[i]:=max+1;
  end;

 for i:=1 to n do
  begin
   max:=0;
   if f[i]>max then begin
    f[0]:=i;
    max:=f[i];
   end;
  end;
 writeln(max);
 print(f[0]);

end.