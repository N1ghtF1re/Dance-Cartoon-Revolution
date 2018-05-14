unit MainFigures;

interface
uses ConstAndTypes, vcl.graphics;
procedure Paintbody(Canvas:TCanvas; Coord: TPoint);
procedure paintHead(Canvas:TCanvas; Coord: TPoint);

implementation

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

end.
