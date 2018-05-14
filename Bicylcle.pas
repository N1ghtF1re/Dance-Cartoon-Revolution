unit Bicylcle;
interface
uses {ConstAndTypes} vcl.graphics;
const
  k = 40;
  WheelR =  k;
  TopTubeX = 2.5 * k;
  headTubeUP =  0.25 * k;
  headTubeR =  0.5 * k;
  HandlebarR = 0.25 * k;
  ForkHeadTube = 2 * k;

  SeatPostX  = 0.1   * k;
  SeatPostY  = 0.5 * k;

  SeatStaysX = k;
  SeatStaysY = 2 * k;

  ChainStayX = 1.5 * k;

  DownTubeX = 2*k;
  DowntubeY = 1.5 * k;

  SeatB = 0.25 * k;
  SeatF = 0.7 * k;

  ChainringR = 0.3 * k;
  casetteR = 0.1 * k;


procedure изобрестиВелосипед(Field:TCanvas; x0,y0:integer);


implementation

procedure изобрестиВелосипед(Field:TCanvas; x0,y0:integer);
begin
with Field do
  begin
   Brush.Style:=bsClear;
   Pen.Width:=3;
   moveto(x0,y0);
   LineTo((x0-SeatStaysX),y0+SeatStaysY);
   Ellipse(PenPos.X- WheelR,PenPos.Y-WheelR,PenPos.X+ WheelR,PenPos.Y+WheelR);
   Ellipse(PenPos.X- Round(casetteR),PenPos.Y-Round(casetteR),PenPos.X+ Round(casetteR),PenPos.Y+Round(casetteR));


   lineto(x0-SeatStaysX+round(ChainStayX),y0+SeatStaysY);

   LineTo(PenPos.X +Round(DownTubeX),PenPos.Y-Round(DownTubeY));

   MoveTo(x0-SeatStaysX+round(ChainStayX),y0+SeatStaysY);
   Ellipse(PenPos.X- Round(ChainringR),PenPos.Y-Round(ChainringR),PenPos.X+ Round(ChainringR),PenPos.Y+Round(ChainringR));
   Pen.Width:=2;
   MoveTo(PenPos.X,PenPos.Y-round(ChainringR));
   LineTo(x0-SeatStaysX,y0+SeatStaysY-round(casetteR));
   MoveTo(PenPos.X,PenPos.Y+round(2*casetteR));
   LineTo(x0-SeatStaysX+round(ChainStayX),y0+SeatStaysY+round(ChainringR));
   //LineTo();
   Pen.Width:=3;




   MoveTo(x0-SeatStaysX+round(ChainStayX),y0+SeatStaysY);
   LineTo(x0,y0);
   lineTo(x0+round(toptubex),y0);                  //top tube R
   LineTo(x0+Round(toptubex),y0-Round(headTubeUp));   //   vinos H
   LineTo(x0+Round(toptubex)+Round(headTubeR),y0-Round(headTubeUp));//Vinos R
   Arc(PenPos.X,PenPos.Y,PenPos.X+round(HandlebarR),Penpos.Y+round(HandlebarR),PenPos.X,PenPos.Y,PenPos.X+round(HandlebarR),PenPos.Y);                                                            // Handlebar R
   MoveTo(x0+round(toptubex),y0);
   lineTo(PenPos.X,PenPos.Y+round(ForkHeadTube));
   Ellipse(PenPos.X- WheelR,PenPos.Y-WheelR,PenPos.X+ WheelR,PenPos.Y+WheelR);
   MoveTo(x0,y0);
   lineto(x0-Round(SeatPostX),y0-round(SeatPostY));
   LineTo(PenPos.X-round(SeatB),PenPos.Y);
   LineTo(PenPos.X+round(SeatF),PenPos.Y);

                                                       //

  end;

end;
end.
