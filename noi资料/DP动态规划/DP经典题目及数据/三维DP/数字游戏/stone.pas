program Stone;
var a:array[1..6] of longint;
    b:array[0..500] of longint;
    f:array[0..150000] of boolean;
    i,j,tot,x,r,sum,tt,l:longint;
    ff:boolean;
    c:char;
begin
  tt:=0;
  while true do begin
     ff:=false;
     sum:=0;
     inc(tt);
     for i:=1 to 6 do begin
       read(a[i]);
       if a[i]<>0 then ff:=true;
       sum:=sum+a[i]*i;
     end;
      readln;
      if not ff then break;
      if odd(sum) then begin writeln('No');
         continue;
      end;
      tot:=0;
      for i:=1 to 6 do begin
          x:=a[i];
          r:=1;
          l:=x;
          while r shl 1<= x do begin
             inc(tot);
             b[tot]:=r*i;
             dec(l,r);
             r:=r shl 1;
          end;
      if l<>0 then begin inc(tot);
                         b[tot]:=l*i;
                         end;
                   end;
      fillchar(f,sizeof(f),false);
      f[0]:=true;
      for i:=1 to tot do
      for j:=sum shr 1 downto b[i] do
        f[j]:=f[j] or f[j-b[i]];
      if f[sum shr 1] then writeln('Yes')
                      else writeln('No');
      end;
end.