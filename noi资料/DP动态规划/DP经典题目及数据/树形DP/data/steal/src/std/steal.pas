var
  time,k:longint;
  t:array[1..300]of longint;
  s:array[1..300,1..2]of longint;
  dp:array[1..300,0..600]of longint;

  function max(x,y:longint):longint;
  begin
    if x>y then exit(x) else exit(y);
  end;

  procedure init(x,ct:longint);
  var
    n,i,j,w,c,xx:longint;
  begin
    read(t[k],n);
    if n=0 then
      for i:=1 to 2 do
        begin
           inc(k);
           s[x,i]:=k;
           init(k,ct+t[x]);
        end
    else begin
      for i:=1 to n do
        begin
          read(w,c);
          for j:=time-ct downto t[x]+t[x]+c do
              dp[x,j]:=max( dp[x,j] , dp[x,j-c]+w );
        end;
    end;
  end;

  procedure doit(x,ct:longint);
  var
    i,j:longint;
  begin
    if (s[x,1]+s[x,2]=0) then exit;
    doit(s[x,1],ct+t[x]);
    doit(s[x,2],ct+t[x]);
    for i:=t[x]+t[x] to time-ct do
      for j:=0 to i-t[x]-t[x] do
        dp[x,i]:=max( dp[x,i] , dp[ s[x,1] , j ] + dp[ s[x,2] , i-t[x]-t[x]-j ] );
  end;

begin
  assign(input,'steal.in');reset(input);
  assign(output,'steal.out');rewrite(output);
  read(time);
  k:=1;
  init(1,0);
  doit(1,0);
  writeln(dp[1,time-1]);
  close(input);close(output);
end.
