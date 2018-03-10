var a:array[0..1000] of longint;
    f:array[0..1000] of longint;
    i,j,n,ans,max,s:integer;
begin
 assign(input,'CATCHER2.in');reset(input);
 ans:=0;
 fillchar(f,sizeof(f),0);
 n:=0;
 while not eoln do
  begin
   inc(n);
   read(a[n]);
  end;

 for i:=1 to n do
  begin
   max:=0;
   for j:=1 to i-1 do
    if (a[i]<=a[j])and(max<f[j]) then max:=f[j];
   f[i]:=max+1;
   if ans<f[i] then ans:=f[i];
  end;
 writeln(ans);

 fillchar(f,sizeof(f),$2F);
 s:=0;
 for i:=1 to n do
  begin
   for j:=1 to s+1 do
    if a[i]<f[j] then break;
   if j>s then inc(s);
   f[s]:=a[i];
  end;
 writeln(s);
 close(input);
 close(output);
 end.