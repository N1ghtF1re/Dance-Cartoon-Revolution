unit SwimingMen;

interface
uses ConstAndTypes, vcl.graphics;
const
  dfi = 1;

procedure drawSwimingPeople(Canvas: tcanvas; x,y: Integer; var deg: integer; coef: SmallInt);



implementation

uses MainFigures;

procedure drawSwimLeg(Canvas: TCanvas; point: TPoint; deg: integer; fcoef: SmallInt);
var
  coef:  SmallInt;
begin
  deg := deg mod 70;
  if deg > 35 then
    coef := -1
  else
    coef := 1;
  deg := deg mod 35;


  Canvas.MoveTo(point.x, point.y);
  canvas.LineTo(point.x+ fcoef*Round(coefLeg), point.y + coef*deg);
end;

procedure drawSwimBody(canvas: TCanvas; Point: TPoint);
begin
  point.y := Round(point.y - coefHead);
  point.x := Round(Point.x + coefhead);
  canvas.Pen.Width := 2;
  canvas.MoveTo(Point.x, Point.y);
  canvas.LineTo(point.x + k + coefLeg div 2, point.y);
end;

procedure drawSwimArm(canvas: Tcanvas; kek: TPoint; deg: integer; coef: SmallInt);
begin
  canvas.moveTo(kek.x, kek.y);
  canvas.Pen.Width := 2;
  if coef = 1 then
  begin
    kek.x := kek.x - k div 4 +round(coefArm*sin(deg*pi/180));
    kek.y := kek.y - k div 6 +round(coefArm*cos(deg*pi/180));
  end
  else
  begin
    kek.x := kek.x - k div 4 +round(coefArm*cos(deg*pi/180));
    kek.y := kek.y - k div 6 +round(coefArm*sin(deg*pi/180));
  end;
  canvas.LineTo(kek.x, kek.y);
end;


procedure drawSwimingPeople(Canvas: tcanvas; x,y: Integer; var deg: integer; coef: SmallInt);
var
  HeadPoint, ArmPoint, LegPoint, BodyPoint: TPoint;
begin
  BodyPoint.x := x;
  BodyPoint.y := y;
  if coef = -1 then
    BodyPoint.x := x - Round(coefHead);

  HeadPoint.y := y;
  HeadPoint.x := x;
  if coef = 1 then
    LegPoint.x := x + Round(coefHead) + Round(coefHead)
  else
    LegPoint.x := x;
  LegPoint.y := y - round(coefHead);
  if coef = -1 then
  begin
    HeadPoint.x := x + coefBody + Round(coefHead) + Round(coefNeck);
  end;
  paintHead(Canvas, HeadPoint);
  drawSwimBody(canvas, BodyPoint);
  ArmPoint.y := y - round(coefHead);
  if coef = 1 then
    ArmPoint.x := x + Round(coefHead) + Round(coefNeck)
  else
    ArmPoint.x := x + 2*Round(coefHead) + Round(coefNeck);

  drawSwimArm(canvas, ArmPoint, deg, coef);
  drawSwimArm(canvas, ArmPoint, deg + 180, coef);
  if coef = 1 then
    LegPoint.x := LegPoint.x + k + coefLeg div 4;

  drawSwimLeg(canvas,LegPoint, deg, coef);
  drawSwimLeg(canvas,LegPoint, deg+35, coef);
end;

end.
