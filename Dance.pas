unit Dance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Types;

Const
  MainX = 200;
  MainY = 200;
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
      Button1: TButton;
      Timer1: TTimer;
      procedure FormCreate(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure Timer1Timer(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
    end;
    TQueueArr = Array[1..N] of integer;
const
  Queue:TQueueArr = (1,2,0,1,2,1,0);
var
  DanceMode: TMode;
  Form1: TForm1;
  state:Integer;
  kek: Boolean;
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
procedure WritePeople(Canvas:TCanvas; Coord: TPoint; mode:TMode);
var
  InitArm, InitLegs, initHead, initBody: TPoint;
  LR1, LR2: TLR;
begin
  //ShowMessage( IntToStr(Coord.x) + ' ' + IntToSTR(Coord.y));
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
  if kek then
  begin
    LR1 := left;
    LR2 := right;
    kek := false
  end
  else
  begin
    LR1 := right;
    LR2 := left;
    kek := true;
  end;

  PaintArm(Canvas, InitArm, mode, LR1);
  PaintLegs(Canvas, InitLegs, mode, LR2);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Paint;
   state:=1;
end;

procedure clearscreen(Form: TForm1; Canvas: TCanvas);
begin
  Canvas.Rectangle(0,0, Form.Width, form.Height);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  P: TPoint;

begin
  clearscreen(form1, canvas);
  P.x := MainX;
  P.y := MainY;
  Canvas.Pen.Width:= 2;
  //WritePeople(Canvas, P, MovArms);
  //canvas.Pen.Color:= clred;
  WritePeople(Canvas, P, TMode( Queue[state] ) );
  canvas.Pen.Color := clblack;
  p.x := p.x + 190;
  //WritePeople(Canvas, P, TMode(Random(3)));
  WritePeople(Canvas, P, TMode( Queue[state] ));
  p.x := p.x + 220;
  //WritePeople(Canvas, P, TMode(Random(3)));
  WritePeople(Canvas, P, TMode( Queue[state] ));

  if state >= 7 then
    state := 1
  else
    inc(state);
end;

end.
