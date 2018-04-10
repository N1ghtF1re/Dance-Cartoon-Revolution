﻿unit Dance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Types;

Const
  MainX = 200;
  MainY = 200;
  k = 30;
  coefHead = 0.25 * k;
  coefBody = 1 * k;
  coefNeck = 0.25 * k;
  coefLeg = 1 * k;
  coefArm = 1 * k;

type
  TMode = (MovArms = 0, MovLegs = 1, MovAll = 2);  // mode(0)
  TLR = (Left, Right);
  TPoint = record
  x,y: integer;
  end;
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
begin

  Canvas.Ellipse(Coord.x, Coord.y, Round(Coord.x + 2 * coefHead), Round(Coord.y + 2*coefHead));
end;

procedure PaintArm(Canvas:TCanvas; Coord: TPoint; mode: TMode; LR: TLR);
var coef:integer;
var x,y:integer;
begin
  Canvas.MoveTo(Coord.x, Coord.y);
  case mode of
  MovArms:
    begin
      X:=Round( k*cos(Pi/4) );
      Y:=Round( k*sin(Pi/4) );
      Canvas.LineTo(Coord.x+x, Coord.y-y);
      Canvas.MoveTo(Coord.x-x, Coord.y-y);
    end;
  MovAll:
    begin
      X:=Round(k*cos(Pi/4));
      Y:=Round(k*sin(Pi/4));
      Canvas.LineTo(Coord.x-x, Coord.y+y);
      Canvas.LineTo(Coord.x+x, Coord.y-y);
      Canvas.MoveTo(Coord.x-x, Coord.y-y);
    end;
  MovLegs:
    begin
      if LR = Left then
        begin
          X:=Round(k*cos(Pi/3));
          Y:=Round(k*sin(Pi/3));
          Canvas.LineTo(Coord.x+round(coefArm/3), Coord.y);
          Canvas.LineTo(Coord.x+round(2/3*x), Coord.y+y);

        end;
        if LR = Right then
        begin

        end;
      end;
    end;
end;


procedure PaintLegs(Canvas:TCanvas; Coord: TPoint; mode: TMode);
begin
  Canvas.MoveTo(Coord.x, Coord.y);
  case mode of
  movarms:
    begin

    end;
  MovLegs:
    begin

    end;
  MovAll:
    begin

    end;
  end;

end;


// Coord - координаты места, откуда растут руки (из жопы)
procedure WritePeople(Coord: TPoint; mode:TMode);
var
  InitArm, InitLegs, initHead, initBody: TPoint;
begin
  case mode of
    movarms, MovLegs:
    begin
      InitHead.y := Coord - coefNeck;
      InitBody := InitHead;
      InitArm.y := Coord;
      InitLegs.y := Coord - (coefBody - coefNeck);
    end;
    MovAll:
    begin
      initBody := coord;
      inithead.y := Coord.y - k - coefHead*2;
      InitLegs.y := initBody;
      InitArm.y :=  coord - (coefBody - coefNeck);
    end;
  end;
  // Находим точку начала тела
  PaintHead(InitHead);
  PaintBody(InitBody, mode);
  PaintArm(InitArm, mode);
  PaintLegs(InitLegs, mode);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Paint;
end;

end.

