unit Dance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Types, MMSystem,
  Vcl.MPlayer;

Const
  MainX = 200;
  MainY = 300;
  k = 60;
  coefHead = 0.25 * k;
  coefBody = 1 * k;
  coefNeck = 0.25 * k;
  coefLeg = 1 * k;
  coefArm = 1 * k;
  RoundArm = 0.3*k;
  coefFoot = 0.2*k;
  const n = 7;

type
  TMode = (MovArms = 0, MovLegs = 1, MovAll = 2);  // mode(0)
  TLR = (Left, Right);
  TPoint = record
  x,y: integer;
  end;
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
    TQueueArr = Array[0..N-1] of integer;
const
  Queue:TQueueArr = (1,2,0,1,2,1,0);
  Colors: array[0..6] of TColor = (clRed, clMaroon, clGreen, clAqua, clBlue, clFuchsia, clPurple);

  var
  DanceMode: TMode;
  Form1: TForm1;
  state:Integer;
  kek: Boolean;
  lol: integer;
  isMem: boolean;
  isStartDance: Boolean;
  col: TColor;
  mem: Integer;
  pic: TBitmap;
  j: integer;
  currState: Integer;
  lr1, lr2: TLR;
//  KeyPoints: array [0..10] of TPoint;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Canvas.MoveTo(0,0);
  canvas.LineTo(99,99);
end;


procedure Paintbody(Canvas:TCanvas; Coord: TPoint);
begin
  Canvas.MoveTo(Coord.x, Coord.y);
  Canvas.LineTo(Coord.x, Coord.y + coefBody);
end;

procedure paintHead(Canvas:TCanvas; Coord: TPoint);
var R: integer;
begin
  R:= Round(coefHead);
  canvas.Brush.Color := clBlack;
  Canvas.Ellipse(Coord.x - R, Coord.y, Coord.x + R, Coord.y - 2 * R);
end;

procedure PaintArm(Canvas:TCanvas; Coord: TPoint; mode: TMode; LR: TLR);
var coef:integer;
var x,y:integer;
begin
  Canvas.MoveTo(Coord.x, Coord.y);
  case mode of
  MovArms:
    begin
      X:=Round( coefArm*cos(Pi/4) );
      Y:=Round( coefArm*sin(Pi/4) );
      Canvas.LineTo(Coord.x+x, Coord.y-y);
      Canvas.MoveTo(Coord.x, Coord.y);
      Canvas.LineTo(Coord.x-x, Coord.y-y);
    end;
  MovAll:
    begin
      X:=Round(coefArm*cos(Pi/4));
      Y:=Round(coefArm*sin(Pi/4));
      Canvas.LineTo(Coord.x-x, Coord.y+y);
      Canvas.MoveTo(Coord.x, Coord.y);
      Canvas.LineTo(Coord.x+x, Coord.y+y);

    end;
  MovLegs:
    begin
      X:=Round(coefArm*cos(Pi/3));
      Y:=Round(coefArm*sin(Pi/3));
      if LR = Left then
        begin
          Canvas.LineTo(Coord.x+round(coefArm/3), Coord.y);
          Canvas.LineTo(Coord.x+round(2/3*x), Coord.y-y);
        Canvas.Arc(Coord.x-round(coefBody/2),Coord.y,Coord.x+round(coefBody/2),Coord.y+Round(coefBody/2),Coord.x,Coord.y,Coord.x,Coord.y+round(coefBody));
        end;
        if LR = Right then
        begin
          Canvas.LineTo(Coord.x-round(coefArm/3), Coord.y);
          Canvas.LineTo(Coord.x-round(2/3*x), Coord.y-y);
          Canvas.Arc(Coord.x-round(coefBody/2),Coord.y,Coord.x+round(coefBody/2),Coord.y+Round(coefBody/2),Coord.x,Coord.y+round(coefBody),Coord.x,Coord.y);

        end;
      end;
    end;
end;


procedure PaintLegs(Canvas:TCanvas; Coord: TPoint; mode: TMode; LR: TLR);
var x,y, x1,y1:integer;
begin
  Canvas.MoveTo(Coord.x, Coord.y);
  case mode of
  MovArms:
    begin
      X := Round(coefLeg*cos(Pi/3));
      Y := Round(coefLeg*sin(Pi/3));

      Canvas.LineTo(Coord.x+x, Coord.y+y);
      Canvas.LineTo(Round(Coord.x+x+coefFoot), Coord.y+y);

      Canvas.MoveTo(Coord.x, Coord.y);
      Canvas.LineTo(Coord.x-x, Coord.y+y);
      Canvas.LineTo(Round(Coord.x-x-coefFoot), Coord.y+y);
    end;
  MovLegs:
    begin
      if LR = Right then
        begin
          X := Round(coefLeg*cos(Pi/3));
          Y := Round(coefLeg*sin(Pi/3));

          Canvas.LineTo(Coord.x-x, Coord.y+y);
          Canvas.LineTo(Round(Coord.x-x-coefFoot), Coord.y+y);

          Canvas.MoveTo(Coord.x, Coord.y);

          X := Round(0.5*coefLeg*cos(Pi/4));
          Y := Round(0.5*coefLeg*sin(Pi/4));

          Canvas.LineTo(Coord.x+x, Coord.y+y);

          X1 := Round(0.5*coefLeg*cos(Pi/2.2));
          Y1 := Round(0.5*coefLeg*sin(Pi/2.2));

          Canvas.LineTo(Coord.x+x+x1, Coord.y+y+y1);
          Canvas.LineTo(Round(Coord.x+x+x1+coefFoot), Coord.y+y+y1);
        end
      else
        begin
          X := Round(coefLeg*cos(Pi/3));
          Y := Round(coefLeg*sin(Pi/3));

          Canvas.LineTo(Coord.x+x, Coord.y+y);
          Canvas.LineTo(Round(Coord.x+x+coefFoot), Coord.y+y);

          Canvas.MoveTo(Coord.x, Coord.y);

          X := Round(0.5*coefLeg*cos(Pi/4));
          Y := Round(0.5*coefLeg*sin(Pi/4));

          Canvas.LineTo(Coord.x-x, Coord.y+y);

          X1 := Round(0.5*coefLeg*cos(Pi/2.2));
          Y1 := Round(0.5*coefLeg*sin(Pi/2.2));

          Canvas.LineTo(Coord.x-x-x1, Coord.y+y+y1);
          Canvas.LineTo(Round(Coord.x-x-x1-coefFoot), Coord.y+y+y1);
        end;
    end;
  MovAll:
    begin
      X := Round(coefLeg*cos(Pi/3));
      Y := Round(coefLeg*sin(Pi/3));

      Canvas.LineTo(Coord.x+x, Coord.y-y);
      Canvas.LineTo(Round(Coord.x+x+coefFoot), Coord.y-y);

      Canvas.MoveTo(Coord.x, Coord.y);
      Canvas.LineTo(Coord.x-x, Coord.y-y);
      Canvas.LineTo(Round(Coord.x-x-coefFoot), Coord.y-y);
    end;
  end;

end;

// Coord - координаты места, откуда растут руки (из жопы)
procedure WritePeople(Canvas:TCanvas; Coord: TPoint; mode:TMode; LR1, LR2: TLR);
var
  InitArm, InitLegs, initHead, initBody: TPoint;
begin
  //ShowMessage( IntToStr(Coord.x) + ' ' + IntToSTR(Coord.y));
  canvas.Pen.Width := 3;
  InitArm := Coord;
  initHead := Coord;
  InitLegs := Coord;
  initBody := Coord;
  case mode of
    movarms, MovLegs:
    begin
      InitHead.y := round(Coord.y - coefNeck);
      InitBody := InitHead;
      InitArm.y := Coord.y;
      InitLegs.y := Coord.y + round(coefBody - coefNeck);
    end;
    MovAll:
    begin
      initBody := coord;
      inithead.y := Coord.y + ( k + Round(coefHead*2) );
      InitLegs.y := initBody.y;
      InitArm.y := Coord.y + round(coefBody - coefNeck);
    end;
  end;
  // Находим точку начала тела
  PaintHead(Canvas, InitHead);
  PaintBody(Canvas, InitBody);

  PaintArm(Canvas, InitArm, mode, LR1);
  PaintLegs(Canvas, InitLegs, mode, LR2);
  canvas.Pen.Width := 1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  isStartDance := false;
  Form1.Paint;
   state:=0;
  mp1.Play;
  mem := 800;
  lol := 800;
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
  WritePeople(Canvas, P, TMode( Queue[state] ) , lr1, lr2);
  canvas.Pen.Color := clblack;



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

  drawSporsmen(Canvas,mem, lol);
end;

procedure TForm1.TimerStartDanceTimer(Sender: TObject);
begin
  isStartDance := true;
end;

procedure TForm1.timer138Timer(Sender: TObject);
begin
  col := Colors[random(7)];
end;

end.
