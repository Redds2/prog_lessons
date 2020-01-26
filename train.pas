uses ABCObjects,GraphABC;
var
  angle: real;
  a: array [1..100] of integer;
  circles: array [1..100] of CircleABC;
  current_circle_mark: CircleABC;
  N,dist,current_index,count,pause: integer; // Количество элементов в массиве
  delta_d,gap,radius:real;
procedure move( direction: integer );
begin

current_index:= (current_index + direction )mod (N+1);
if current_index < 0 then

  current_index := N+1 + current_index;

if current_index = 0 then
  move(direction);
  

  current_circle_mark.Center:=circles[current_index].Center;
  

end;


 
begin
  gap:=2;
  angle:=0;
  dist:= 150;
  N:= Random(1,99); 
  delta_d:= dist * sqrt( (1-Cos(2 / N *3.14) )*(1-Cos(2 / N *3.14) ) + Sin(2 / N *3.14)*Sin(2 / N *3.14) );
  radius:= (delta_d - gap ) /2;
  
  
  current_index:=3;//Random(1,N);
  
  
  for var i:=1 to N do
    a[i] := Random(0,1);
  //a[N+1] :=-1;  
  
  
  //for var i:=1 to N do
  //  if a[i] = 0 then
  //    a[i] :=1;
  
  angle:=0;
 
  for var i:=0 to N-1 do begin
    //writeln(a[i+1]);
    if a[i+1] = 1 then
      circles[i+1] := new CircleABC( Round( Window.Center.X + dist * Cos( angle/180*3.14 ) ),Round( Window.Center.Y + dist * Sin( angle/180*3.14 ) ),Round(radius),Color.Gold)
    else 
      circles[i+1] := new CircleABC( Round( Window.Center.X + dist * Cos( angle/180*3.14 ) ),Round( Window.Center.Y + dist * Sin( angle/180*3.14 ) ),Round(radius),Color.Gray);
    
    if i+1 = current_index then
      current_circle_mark := new CircleABC( Round( Window.Center.X + dist * Cos( angle/180*3.14 ) ),Round( Window.Center.Y + dist * Sin( angle/180*3.14 ) ),5,Color.Red);
      
    
     
    angle:=angle + 360 / N;
    
   end;
  
  //first_circle:=circles[current_index];

  circles[current_index].Color:=Color.Gray;
  
  current_circle_mark.ToFront;  
  Sleep(1000);
  
  
   count:=1;
   pause:=Round( 20000/(3*N*(N+1)) );
   while True do begin
   
    for var i:=1 to count do begin  
    
      move(1);
      circles[current_index].Color:=Color.Gold;
      Sleep(pause);
    end;
    for var i:=1 to count do begin  
      move(-1);
      Sleep(pause div 2);
    end;
    if circles[current_index].Color = Color.Gold then
      break;
    count:=count+1;
   end;
   writeln(count);
   
end.