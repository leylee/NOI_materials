var t,i,j,k,n,v:longint;
    w:array[0..20000] of longint;
    f:array[0..20000] of boolean;//����һά  ע�� ��������ˢ
begin
 fillchar(f,sizeof(f),false);
 readln(v,n);
 //����������ѡ��������Ҫ��qsort�벻�����ˡ�
 for i:=1 to n-1 do
  for j:=i+1 to n do
   if w[i]<w[j] then begin
    t:=w[i];
    w[i]:=w[j];
    w[j]:=t;
   end;
 f[0]:=true;
 for i:=1 to n do
  read(w[i]);
 t:=0;
 for i:=n downto 1 do
  begin
   if w[i]>v then continue;//����һ��ѭ��
   inc(t,w[i]);
   if t>v then t:=v;
   for j:=v downto w[i] do
    f[j]:=f[j]or f[j-w[i]];
  end;
 for j:=v downto 1 do
  if f[j] then break;
 writeln(v-j);
end.
