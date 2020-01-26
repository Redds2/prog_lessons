var a: array[1..8] of integer;
begin

a[1]:=1;
write(a[1]);
for var i:=2 to 8 do begin
  a[i]:=Random(0,1);
  write(a[i]);
end;
end.