program turtle_chess;
type point=record
          c:array[1..4] of integer;
          score:longint;
end;
var i,j,k,m,n,max:integer;
    t:array[0..1000] of point;
    a,b,f:array[0..1000] of longint;//Chess Score
begin
//n 棋盘格子数 m卡片数
 readln(n,m);
 for i:=1 to n do
  read(a[i]);
 for i:=1 to m do
  read(b[i]);
 for i:=1 to m do
  with t[1] do
   inc(c[b[i]]);
 t[1].score:=a[1];
 for i:=2 to n do
  with t[i] do
   begin
    c:=t[1].c;
    score:=a[i];
   end;
//initial end
 for i:=1 to n do
  begin
   max:=0;
   k:=0;
   with t[i] do
    begin
     for j:=1 to 4 do
      if i-j>0 then
         if (t[i-j].c[j]>0)and(t[i-j].score>max) then begin
          max:=t[i-j].score;
          k:=j;
         end;
     score:=score+max;
     if k>0 then begin
      c:=t[i-k].c;
      dec(c[k]);
     end;
    end;
  end;
 writeln(t[n].score);
end.
