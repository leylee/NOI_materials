var i,j,k,m,t,n,sum,x,y:longint;
    a,loc,s:array[0..20000] of longint;
    f:array[0..6,0..20000] of boolean;
begin
//f[i,j]=f[i-1,j]or f[i-1,j-v[i]]
 assign(input,'divide5.in');reset(input);
 fillchar(f,sizeof(f),false);
 for i:=0 to 6 do
  f[i,0]:=true;
 for i:=1 to 6 do
  read(a[i]);
  sum:=0;
 for i:=1 to 6 do
  sum:=sum+i*a[i];
 if odd(sum) then begin
  writeln('NO');
  halt;
 end;
 sum:=sum div 2;
 k:=0;
 for i:=1 to 6 do
  begin
   x:=a[i];
   y:=1;
   while x>=y shl 1 do begin
     inc(k);
     s[k]:=y*i;
     dec(x,y);
     y:=y shl 1;
    end;
  if x>0 then begin
    inc(k);
    s[k]:=x*i;
   end;
  loc[i]:=k;
  end;
 for i:=1 to 6 do
  begin
   t:=t+i*a[i];
   for j:=t downto 1 do
    for k:=loc[i-1]+1 to loc[i] do
     if ((j>=s[k])and(f[i-1,j-s[k]])) or(f[i-1,j])  then begin
      f[i,j]:=true;
      break;
     end;
  end;
 for i:=1 to 6 do
  if f[i,sum] then  begin
   writeln('YES');
   halt;
  end;
 writeln('NO2');
 close(input);
 close(output);
end.