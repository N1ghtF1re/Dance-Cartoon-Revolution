﻿unit Dance;

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

type
  TMode = (MovArms = 0, MovLegs = 1, MovAll = 2);  // mode(0)
  TLR = (Left, Right);
  TPoint = record
  x,y: integer;
  end;
  TForm1 = class(TForm)
      Button1: TButton;
      Timer1: TTimer;
      Label1: TLabel;
      procedure FormCreate(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure Timer1Timer(Sender: TObject);
      procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    private
      { Private declarations }
    public
      { Public declarations }
    end;

var
  DanceMode: TMode;
  Form1: TForm1;
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
      Canvas.LineTo(Coord.x+x, Coord.y-y);
      Canvas.MoveTo(Coord.x-x, Coord.y-y);
    end;
  MovLegs:
    begin
      X:=Round(coefArm*cos(Pi/3));
      Y:=Round(coefArm*sin(Pi/3));
      if LR = Left then
        begin
          Canvas.LineTo(Coord.x+round(coefArm/3), Coord.y);
          Canvas.LineTo(Coord.x+round(2/3*x), Coord.y-y);
          //Canvas.Arc(Coord.x-round(coefBody/2),Coord.y,Coord.x+(coefBody/2),Coord.y+Round(coefBody/2),Coord.x,Coord.y,Coord.x,Coord.y+round(coefBody));
        end;
        if LR = Right then
        begin
          Canvas.LineTo(Coord.x-round(coefArm/3), Coord.y);
          Canvas.LineTo(Coord.x-round(2/3*x), Coord.y-y);

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

          X1 := Round(0.5*coefLeg*cos(Pi/1.5));
          Y1 := Round(0.5*coefLeg*sin(Pi/1.5));

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

          X1 := Round(0.5*coefLeg*cos(Pi/1.5));
          Y1 := Round(0.5*coefLeg*sin(Pi/1.5));

          Canvas.LineTo(Coord.x-x-x1, Coord.y+y+y1);
          Canvas.LineTo(Round(Coord.x-x-x1-coefFoot), Coord.y+y+y1);
        end;
    end;
  MovAll:
    begin

    end;
  end;

end;

// Coord - координаты места, откуда растут руки (из жопы)
procedure WritePeople(Canvas:TCanvas; Coord: TPoint; mode:TMode);
var
  InitArm, InitLegs, initHead, initBody: TPoint;
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
      InitLegs.y := Coord.y + round(coefBody - coefNeck);
    end;
  end;
  // Находим точку начала тела
  PaintHead(Canvas, InitHead);
  PaintBody(Canvas, InitBody);
  PaintArm(Canvas, InitArm, mode, Left);
  PaintLegs(Canvas, InitLegs, mode, Left);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Paint;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label1.Caption := IntToStr(x) + ' ' + IntToStr(Y);
end;



procedure TForm1.Timer1Timer(Sender: TObject);
var
  P: TPoint;
begin

  P.x := MainX;
  P.y := MainY;
  Canvas.Pen.Width:= 2;
  //WritePeople(Canvas, P, MovArms);
  canvas.Pen.Color:= clred;
  WritePeople(Canvas, P, MovArms);
  canvas.Pen.Color := clblack;
  p.x := p.x + 120;
  WritePeople(Canvas, P, TMode(Random(3)));
end;


end.

