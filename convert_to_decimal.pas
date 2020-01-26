var a: array[0..7] of integer;
begin
a[0]:=1;
write(a[0]);
for var i:=1 to 7 do begin
  a[i]:=Random(0,1);
  write(a[i]);
end;
end.