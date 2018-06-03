unit Unit2;

interface
uses Vcl.Forms;
const
  Body = 100;
  radius = 0.3 * Body;
  hand = 0.4 * body;
  phand = 0.2 * body;
  Legs = 0.6 * body;
procedure DrawMen(Form1: TForm; state: Integer; x0, y0: Extended);


implementation



procedure DrawMen(Form1: TForm; state: Integer; x0, y0: Extended);
var
  x, y: Extended;
  i: Integer;
procedure DrawBody(x0, y0: extended);
var
  tempx, tempy: Extended;
begin
  with form1 do
  begin
    tempx := x0;
    tempy := y0 + radius;
    Canvas.MoveTo(Trunc(tempx), Trunc(tempy));
    Canvas.LineTo(trunc(tempx), Trunc(tempy + body));

  end;

end;

procedure DrawHand(state: Integer; x0, y0: extended);
var
  tempx, tempy, tempnewx, tempnewy: Extended;
begin
  case state of
    1:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + hand * sin(pi / 2.5);
          tempnewy := tempy + hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 6);
          tempnewy := tempnewy - hand * cos(pi / 6);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    6:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - hand * sin(pi / 2.5);
          tempnewy := tempy + hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 6);
          tempnewy := tempnewy + hand * cos(pi / 6);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    2:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + hand * sin(pi / 4.5);
          tempnewy := tempy + hand * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2.5);
          tempnewy := tempnewy - hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    7:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - hand * sin(pi / 4.5);
          tempnewy := tempy + hand * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2.5);
          tempnewy := tempnewy + hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    3:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + hand * sin(pi / 9);
          tempnewy := tempy + hand * cos(pi / 9);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2);
          tempnewy := tempnewy - hand * cos(pi / 2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    8:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - hand * sin(pi / 9);
          tempnewy := tempy + hand * cos(pi / 9);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2);
          tempnewy := tempnewy + hand * cos(pi / 2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    4:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + hand * sin(pi / 32);
          tempnewy := tempy + hand * cos(pi / 32);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 1.8);
          tempnewy := tempnewy - hand * cos(pi / 1.8);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    9:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - hand * sin(pi / 32);
          tempnewy := tempy + hand * cos(pi / 32);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 1.8);
          tempnewy := tempnewy + hand * cos(pi / 1.8);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    5:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + hand * sin(pi / 4.5);
          tempnewy := tempy + hand * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2.5);
          tempnewy := tempnewy - hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    10:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + phand;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - hand * sin(pi / 4.5);
          tempnewy := tempy + hand * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx + hand * sin(pi / 2.5);
          tempnewy := tempnewy + hand * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
  end;
end;

procedure DrawLeg(state: Integer; x0, y0: Extended);
var
  tempx, tempy, tempnewx, tempnewy: Extended;
begin
  case state of
    1:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + legs * sin(pi / 2.5);
          tempnewy := tempy + legs * cos(pi / 2.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 16);
          tempnewy := tempnewy + legs * cos(pi / 16);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    6:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - legs * sin(pi / 4);
          tempnewy := tempy + legs * cos(pi / 4);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 2.2);
          tempnewy := tempnewy + legs * cos(pi / 2.2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    2:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + legs * sin(pi / 4.5);
          tempnewy := tempy + legs * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 8);
          tempnewy := tempnewy + legs * cos(pi / 8);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    7:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - legs * sin(pi / 7);
          tempnewy := tempy + legs * cos(pi / 7);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 3.2);
          tempnewy := tempnewy + legs * cos(pi / 3.2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    3:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + legs * sin(pi / 6.5);
          tempnewy := tempy + legs * cos(pi / 6.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 7);
          tempnewy := tempnewy + legs * cos(pi / 7);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    8:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - legs * sin(pi / 9);
          tempnewy := tempy + legs * cos(pi / 9);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 4.2);
          tempnewy := tempnewy + legs * cos(pi / 4.2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    4:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + legs * sin(pi / 12.5);
          tempnewy := tempy + legs * cos(pi / 12.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 8);
          tempnewy := tempnewy + legs * cos(pi / 8);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    9:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - legs * sin(pi / 32);
          tempnewy := tempy + legs * cos(pi / 32);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 5.2);
          tempnewy := tempnewy + legs * cos(pi / 5.2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    5:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx + legs * sin(pi / 4.5);
          tempnewy := tempy + legs * cos(pi / 4.5);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 8);
          tempnewy := tempnewy + legs * cos(pi / 8);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
    10:
      begin
        with Form1 do
        begin
          tempx := x0;
          tempy := y0 + radius + body;
          Canvas.MoveTo(trunc(tempx), Trunc(tempy));
          tempnewx := tempx - legs * sin(pi / 7);
          tempnewy := tempy + legs * cos(pi / 7);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
          Canvas.MoveTo(Trunc(tempnewx), Trunc(tempnewy));
          tempnewx := tempnewx - legs * sin(pi / 3.2);
          tempnewy := tempnewy + legs * cos(pi / 3.2);
          Canvas.LineTo(Trunc(tempnewx), Trunc(tempnewy));
        end;
      end;
  end;
end;

procedure DrawHead(state: integer; x0, y0: extended);
var
  tempx, tempy: Extended;
begin
  with Form1 do
  begin
    tempx := x0;
    tempy := y0;
    Canvas.Pen.Width := 3;
    Canvas.MoveTo(Trunc(tempx), Trunc(tempy));
    Canvas.Ellipse(Trunc(tempx - radius), Trunc(tempy - radius), Trunc(tempx + radius), Trunc(tempy + radius));
    DrawBody(x0, y0);
    DrawHand((state mod 6), x0, y0);
    DrawHand((state mod 6) + 5, x0, y0);
    DrawLeg((state mod 6), x0, y0);
    DrawLeg((state mod 6) + 5, x0, y0);

  end;
end;
begin
  DrawHead(state, x0, y0);
end;

end.
