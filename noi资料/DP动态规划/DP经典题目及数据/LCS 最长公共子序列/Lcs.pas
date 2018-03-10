var
  i,j,k,l,m,n,max:longint;
  f:array[0..1000,0..1000] of longint;
  s1,s2:string;
begin
  //assign(input,'Lcs.in'); reset(input);
  //assign(output,'Lcs.out'); rewrite(output);
  readln(s1);
  readln(s2);
  n:=length(s1);
  m:=length(s2);
  for i:=1 to n do
    f[i,1]:=0;
  for j:=1 to m do
    f[1,j]:=0;
  for i:=1 to n do
    for j:=1 to m do
      if s1[i]=s2[j] then
        f[i,j]:=f[i-1,j-1]+1
        else begin
          max:=0;
          if max<=f[i,j-1] then
            max:=f[i,j-1];
          if max<=f[i-1,j] then
            max:=f[i-1,j];
          f[i,j]:=max;
      end;
  writeln(f[n,m]);
  //close(input);
  //close(output);
end.