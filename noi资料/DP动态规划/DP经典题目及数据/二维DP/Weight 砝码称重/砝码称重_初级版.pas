program ex;
const wt:array[1..6] of integer=(1,2,3,5,10,20);
var i,j,k,n,c,counter:integer;
    a:array[0..6] of integer;
    w:array[0..100] of boolean;
    s:array[0..100] of integer;
begin
 fillchar(s,sizeof(s),0);
 fillchar(w,sizeof(w),false);
 n:=0;
 for i:=1 to 6 do
  begin
   read(a[i]);
   if a[i]<>0 then inc(n);
  end;{
 for i:=1 to n do
  for j:=1 to a[i] do
    w[j*wt[i]]:=true; }
// counter:=;
 c:=0;
 counter:=c;
 for i:=1 to n do
  begin
   for j:=1 to counter+1 do
    for k:=1 to a[i] do
     if not w[wt[i]*k+s[j]] then begin
      inc(c);
      w[wt[i]*k+s[j]]:=true;
      s[j+1]:=wt[i]*k+s[j];
     end;
   counter:=c;
  end;
 writeln(c);
end.