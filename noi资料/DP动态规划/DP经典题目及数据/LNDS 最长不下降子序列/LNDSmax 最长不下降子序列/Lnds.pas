program Lnds;
var
  i,j,k,l,m,n,max:longint;
  a,f,p:array[0..10000] of longint;
  function find(l,r,x:longint):longint;
  var
    mid:longint;
  begin
    mid:=(l+r) div 2; {mid:=(l+r)>>1;}
    if l=r then exit(l)
    else begin
      if x<a[mid] then exit(find(l,mid,x))
        else exit(find(mid+1,r,x));
    end;
  end;

  procedure print(k:longint);
  begin
    if p[k]=0 then write(a[k])
      else begin
        print(p[k]);
        write(' ',a[k]);
      end;
  end;
begin
  readln(n);
  max:=1;
  fillchar(f,sizeof(f),0);
  fillchar(p,sizeof(p),0);
  a[0]:=maxlongint;
  for i:=1 to n do begin
    read(a[i]);
    j:=find(1,max,a[i]);
    f[j]:=i;
    p[i]:=f[j-1];
    if j=max then inc(max);
  end;
  writeln(max-1);
  print(f[max-1]);
  writeln;
end.