unit DancedPeople;

interface
uses ConstAndTypes, vcl.graphics;
procedure WritePeople(Canvas:TCanvas; Coord: TPoint; mode:TMode; LR1, LR2: TLR);
procedure PaintArm(Canvas:TCanvas; Coord: TPoint; mode: TMode; LR: TLR);
procedure PaintLegs(Canvas:TCanvas; Coord: TPoint; mode: TMode; LR: TLR);
implementation

uses MainFigures;

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
  // Ќаходим точку начала тела
  PaintHead(Canvas, InitHead);
  PaintBody(Canvas, InitBody);

  PaintArm(Canvas, InitArm, mode, LR1);
  PaintLegs(Canvas, InitLegs, mode, LR2);
  canvas.Pen.Width := 1;
end;
end.
