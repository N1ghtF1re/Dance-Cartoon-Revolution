unit ConstAndTypes;

interface

uses vcl.graphics;


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
    TQueueArr = Array[0..N-1] of integer;
const
  Queue:TQueueArr = (1,2,0,1,2,1,0);
  Colors: array[0..6] of TColor = (clRed, clMaroon, clGreen, clAqua, clBlue, clFuchsia, clPurple);


implementation


end.
