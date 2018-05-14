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



  BodyX = 2 * k;
  BodyY = k;
  HeadR = 0.5 * k;
  Leg1X = k;
  Leg1Y = 1.5 * k;
  Leg2X = 0.5 * k;
  Leg2Y = k;
  ArmbX = 1.5 * k;
  ArmbY = 0.75 * k;


procedure изобрести¬елосипед(Field:TCanvas; x0,y0,c:integer;range1:Real);


implementation
  { BodyX = 2 * k;
  BodyY = k;
  HeadR = 0.5 * k;
  Leg1X = k;
  Leg1Y = 1.5 * k;
  Leg2X = 0.5 * k;

  Leg2Y = k;  }
procedure нарисовать„елика(Field:TCanvas;x0,y0,c:integer;range1:Real);
begin
  with Field do
  begin
    MoveTo(round(x0*C),y0);
   //
    LineTo(round(x0*C)+round(BodyX),y0-Round(BodyY));
  //
    Ellipse(round(PenPos.X*C){-round(HeadR)},PenPos.Y-round(HeadR),round(PenPos.X*C)+ 2*Round(HeadR),PenPos.Y+round(HeadR));
     MoveTo(round(x0*C),y0);
     LineTo(round(x0*C)+round(ArmbX),y0-Round(ArmbY));
     Lineto(round(x0*C)+Round(toptubex)+Round(headTubeR)+ round(SeatPostX),y0-Round(headTubeUp)+ round(SeatPostY));
     MoveTo(round(x0*C),y0);
     LineTo(round(x0*C)+round(Leg1X*range1),y0+round(Leg1Y));
     LineTo(round(PenPos.X*C)-round(Leg2X),Penpos.Y+round(Leg2Y));

  end;
end;

procedure изобрести¬елосипед(Field:TCanvas; x0,y0,c:integer;range1:Real);
begin
with Field do
  begin
   Brush.Style:=bsClear;
   Pen.Width:=3;
   moveto(round(x0*C),y0);
   LineTo((round(x0*C)-SeatStaysX),y0+SeatStaysY);
   Ellipse(round(PenPos.X*C)- WheelR,PenPos.Y-WheelR,round(PenPos.X*C)+ WheelR,PenPos.Y+WheelR);
   Ellipse(round(PenPos.X*C)- Round(casetteR),PenPos.Y-Round(casetteR),round(PenPos.X*C)+ Round(casetteR),PenPos.Y+Round(casetteR));


   lineto(round(x0*C)-SeatStaysX+round(ChainStayX),y0+SeatStaysY);

   LineTo(round(PenPos.X*C)+Round(DownTubeX),PenPos.Y-Round(DownTubeY));

   MoveTo(round(x0*C)-SeatStaysX+round(ChainStayX),y0+SeatStaysY);
   Ellipse(round(PenPos.X*C)- Round(ChainringR),PenPos.Y-Round(ChainringR),round(PenPos.X*C)+ Round(ChainringR),PenPos.Y+Round(ChainringR));
   Pen.Width:=2;
   MoveTo(round(PenPos.X*C),PenPos.Y-round(ChainringR));
   LineTo(round(x0*C)-SeatStaysX,y0+SeatStaysY-round(casetteR));
   MoveTo(round(PenPos.X*C),PenPos.Y+round(2*casetteR));
   LineTo(round(x0*C)-SeatStaysX+round(ChainStayX),y0+SeatStaysY+round(ChainringR));
   //LineTo();
   Pen.Width:=3;
   MoveTo(round(x0*C)-SeatStaysX+round(ChainStayX),y0+SeatStaysY);
   LineTo(round(x0*C),y0);
   lineTo(round(x0*C)+round(toptubex),y0);                  //top tube R
   LineTo(round(x0*C)+Round(toptubex),y0-Round(headTubeUp));   //   vinos H
   LineTo(round(x0*C)+Round(toptubex)+Round(headTubeR),y0-Round(headTubeUp));//Vinos R
   Arc(round(PenPos.X*C),PenPos.Y,round(PenPos.X*C)+round(HandlebarR),Penpos.Y+round(HandlebarR),round(PenPos.X*C),PenPos.Y,round(PenPos.X*C)+round(HandlebarR),PenPos.Y);                                                            // Handlebar R
   MoveTo(round(x0*C)+round(toptubex),y0);
   lineTo(round(PenPos.X*C),PenPos.Y+round(ForkHeadTube));
   Ellipse(round(PenPos.X*C)- WheelR,PenPos.Y-WheelR,round(PenPos.X*C)+ WheelR,PenPos.Y+WheelR);
   MoveTo(round(x0*C),y0);
   lineto(round(x0*C)-Round(SeatPostX),y0-round(SeatPostY));
   LineTo(round(PenPos.X*C)-round(SeatB),PenPos.Y);
   LineTo(round(PenPos.X*C)+round(SeatF),PenPos.Y);
   нарисовать„елика(Field,round(x0*C)-round(SeatPostX),y0-round(SeatPostY),c,range1);
  end;
end;

end.




