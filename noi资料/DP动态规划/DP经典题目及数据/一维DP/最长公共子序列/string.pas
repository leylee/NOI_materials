var i,j,k,la,lb:integer;
    a,b:string;
    f,prev:array[0..255,0..255] of integer;

procedure print(x:integer);
{ begin
  if prev[x]=0 then begin write(a[x]); exit; end;
  print(prev[x]);
  write(a[x]);}
 end;
begin
 fillchar(f,sizeof(f),0);
 fillchar(p,sizeof(p),0);
 readln(a);
 readln(b);
 la:=length(a);
 lb:=length(b);
 for i:=1 to la  do
  for j:=1 to lb do
   begin
    if a[i]=b[j] then begin
     f[i,j]:=f[i-1,j-1]+1;
  {   prev[i]:=0;}
     end
     else begin
      if f[i-1,j]>f[i,j-1] then begin f[i,j]:=f[i-1,j]; prev[i,j]:=1; end
       else begin f[i,j]:=f[i,j-1]; prev[i,j]:=2; end
     end;
   end;
 writeln(f[la,lb]);
 print(prev[la]);

end.
