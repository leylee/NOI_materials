var
  a,b,q:array[0..1000,0..1000]of longint;
  c,d,p:array[0..100000]of longint;
  v:array[0..100000]of boolean;
  i,j,k,l,m,n,x,y,z,h,g,min:longint;
begin
  assign(input,'Pig0.in'); reset(input);
 // assign(output,'Pig.out'); rewrite(output);
  fillchar(q,sizeof(q),$2f);
  readln(m);
  for i:=1 to m do
    for j:=1 to i do begin
      read(a[i,j]);
      b[i,j]:=a[i,j];
      q[i,j]:=a[i,j];
    end;
  for i:=2 to m-1 do  begin
    inc(q[m,i],q[m,i-1]);
    inc(a[m,i],a[m,i-1]);end;
    inc(q[m,m],b[m,1]);
    inc(a[m,m],b[m,1]);
  for i:=m-1 downto 2 do
    if q[m,i]>b[m,i]+q[m,i+1] then begin
      q[m,i]:=b[m,i]+q[m,i+1];
      a[m,i]:=b[m,i]+q[m,i+1];end;
  for i:=m-1 downto 1 do begin
    for j:=1 to i do
      if q[i+1,j]>q[i+1,j+1] then
        inc(q[i,j],q[i+1,j+1])
       else
         inc(q[i,j],q[i+1,j]);
    for k:=1 to 100 do
    for j:=1 to i do begin
      if q[i,j-1]>9999 then begin
         q[i,j-1]:=q[i,j-1+i];
         a[i,j-1]:=a[i,j-1+i];end;

         if q[i,j-1]+a[i,j]<q[i,j] then begin
         q[i,j]:=a[i,j]+q[i,j-1];
         a[i,j]:=q[i,j];
         end;
      if q[i,j+1]>9999 then begin
         q[i,j+1]:=q[i,j+1-i];
         a[i,j+1]:=a[i,j+1-i];end;
      if q[i,j+1]+a[i,j]<q[i,j] then begin
         q[i,j]:=q[i,j+1]+a[i,j];
         a[i,j]:=q[i,j];
         end; end;
     end;
  writeln(q[1,1]);
  close(input);
  close(output);
end.