unit Dance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Types, MMSystem,
  Vcl.MPlayer, ConstAndTypes, MainFigures, DancedPeople, SwimingMen, ColorsUtils, bicylcle;
type
  TForm1 = class(TForm)
    Timer276: TTimer;
    mp1: TMediaPlayer;
    TimerMain: TTimer;
    timer138: TTimer;
    TimerStartDance: TTimer;
      procedure FormCreate(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure Timer276Timer(Sender: TObject);
    procedure TimerMainTimer(Sender: TObject);
    procedure timer138Timer(Sender: TObject);
    procedure TimerStartDanceTimer(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
    end;
const dfi = 10;
  var
  DanceMode: TMode;
  BikeX:Integer;
  Form1: TForm1;
  state:Integer;
  kek: Boolean;
  lol: integer;
  isMem: boolean;
  isStartDance: Boolean;
  col: TColor;
  mem: Integer;
  pic: TBitmap;
  BikeY: integer;
  j: integer;
  currState: Integer;
  fi: integer;
  lr1, lr2: TLR;
  SwimCenterX, SwimCenterY: integer;
//  KeyPoints: array [0..10] of TPoint;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Canvas.MoveTo(0,0);
  canvas.LineTo(99,99);
end;




procedure TForm1.FormCreate(Sender: TObject);
begin
  BikeX := - 200;
  BikeY := 300;
  isStartDance := false;
  Form1.Paint;
   state:=0;
  mp1.Play;
  mem := 800;
  fi := 0;
  lol := 800;
  SwimCenterY := 100;
  SwimCenterX := Self.Width;
end;

procedure clearscreen(Form: TForm1; Canvas: TCanvas; color: TColor);
var
oldcolor: TColor;
begin
  oldcolor:= Canvas.Brush.Color;
  canvas.Brush.Color := color;
  Canvas.Rectangle(0,0, Form.Width, form.Height);
  canvas.Brush.Color := oldcolor;
end;


procedure drawDiscoBall(Canvas: TCanvas; const x,y,r: integer; color: TColor);
var
oldcolor: TColor;
begin
  oldcolor:= Canvas.Brush.Color;
  canvas.MoveTo(x, y-r);
  canvas.LineTo(x, 0);
  canvas.Brush.Color := color;
  canvas.Ellipse(x-r,y-r,x+r,y+r);
  canvas.Brush.Color := oldcolor;
end;

procedure drawSporsmen(canvas: TCanvas; x,y: INTEGER);
var
P:TPoint;
begin
  p.x := x;
  p.y := y;
  WritePeople(canvas,p, MovLegs, LEft, Right );
end;


procedure TForm1.Timer276Timer(Sender: TObject);
var
  P: TPoint;
  i: integer;
begin
  inc (state);
  state := state mod 7;

  if kek then
  begin
    LR1 := Tlr(0);
    LR2 := TLR(1);
    kek := false
  end
  else
  begin
    LR1 := TLR(1);
    LR2 := TLR(0);
    kek := true;
  end;

  // 1 2 3 4 5 6 7 8

end;

procedure TForm1.TimerMainTimer(Sender: TObject);
var
  P: TPoint;
  i: integer;
begin

  clearscreen(form1, canvas,col);
  canvas.Draw(0,0, pic);
  P.x := MainX;
  P.y := MainY;
  Canvas.Pen.Width:= 2;
  //WritePeople(Canvas, P, MovArms);
  //canvas.Pen.Color:= clred;
  canvas.Pen.Color := clblack;
  WritePeople(Canvas, P, TMode( Queue[state] ) , lr1, lr2);


  currstate := state;
  for i := 1 to 15 do
  begin
    p.x := p.x + k*2;
    if i mod 6 = 0 then
    begin
      p.x := p.x - k*2*i;
      P.y := p.y + 3*k;
    end;

    if not isStartDance then
    begin
      WritePeople(Canvas, P, TMode( MovArms ), lr1, lr2);
    end
    else
    begin
      inc (currstate, 5);
      currstate := currstate mod 7;

      WritePeople(Canvas, P, TMode( Queue[currstate] ), lr1, lr2);
    end;

  end;

  drawDiscoBall(canvas,Form1.Width div 2 ,k + 40,trunc(k*0.6),random(1000000));

  mem := mem - 10;
  if mem  mod 100 = 0 then
  begin
    isMem:= True;
    j:= 4;
  end;

  if isMem then
  begin
    if j <= 2 then
      lol := lol + 40
    else
      lol := lol - 40;
    if j = 1 then
      isMem := false;
    dec(j);
  end;
  fi := fi + dfi;
  if isStartDance then
  begin
    изобрестивелосипед(Canvas, BikeX,BikeY, 1, (random(3)+7)/10,  DarkerColor(col, 50) );
    inc( BikeX, 10);
    drawSwimingPeople(canvas, swimCenterX,swimCenterY,  fi, 1);
    drawSwimingPeople(canvas, swimCenterX + 50,swimCenterY+550,  fi, -1);
    dec(SwimCenterX, 10);
    if SwimCenterX < 0 then
      SwimCenterX := Self.Width;
    if BikeX > Self.Width then
    begin
      BikeX := -300;
      BikeY := random(200) + 100;
      изобрестивелосипед(Canvas, BikeX,BikeY, 1, (random(3)+7)/10,  DarkerColor(col, 50) );
      BikeY := random(200) + 100;
    end;
  end;

end;

procedure TForm1.TimerStartDanceTimer(Sender: TObject);
begin
  isStartDance := true;
  TimerStartDance.Enabled := false;
end;

procedure TForm1.timer138Timer(Sender: TObject);
begin
 drawSporsmen(Canvas,mem, lol);
 col := LighterColor(Colors[random(7)], 50);

end;

end.
