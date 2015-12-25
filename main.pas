program acp;
const m=80;
var Fout:Text;
  a:array of array of LongInt;
  depth,freq:Word;
  Amp,i,mm:Longint;
  dt,w:Real;

begin //main
  WriteLn('Задайте разрядность в битах и частоту дискретизации');
  ReadLn(depth,freq);
  if freq > m then mm:=m else mm:=freq;
  SetLength(a,mm+1,2);

  Amp:=Round(exp((depth-1)*ln(2)));
  dt:=1/freq;
  w:=2*Pi*50;

  for i:=0 to mm do
  begin
    a[i,0]:=i;
    a[i,1]:=Round(Amp*cos(w*dt*i));
  end;

  Assign(Fout,'signal.csv');
  ReWrite(Fout);
  for i:=0 to mm do WriteLn(Fout,a[i,0],';',a[i,1]);
  Close(Fout);
end.