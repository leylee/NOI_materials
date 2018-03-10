var
  i,j,k,n,e,max,l,m,r:longint;
  a:array[0..1000] of record
                      x,id:longint;
  end;
  c:array[0..1000] of longint;
begin
   assign(input,'catcher.in');reset(input);
   assign(output,'catcher.out');rewrite(output);
   readln(n);
   for i:=1 to n do
      read(a[i].x);
   fillchar(c,sizeof(c),0);
   c[1]:=n;
   c[0]:=0;
   max:=0;
   for i:=n-1 downto 1 do
      for j:=1 to n do
         if a[i].x>a[c[j]].x then begin
            c[j]:=i;
            a[i].id:=c[j-1];
            if j>max then max:=j;
            break;
         end;
   n:=c[max];
   writeln(max);
   while n<>0 do begin
      write(a[n].x,' ');
      n:=a[n].id;
   end;
   close(input);
   close(output);
end.