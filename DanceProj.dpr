program DanceProj;

uses
  Vcl.Forms,
  Dance in 'Dance.pas' {Form1},
  ConstAndTypes in 'Units\ConstAndTypes.pas',
  MainFigures in 'Units\MainFigures.pas',
  DancedPeople in 'DancedPeople.pas',
  SwimingMen in 'Units\SwimingMen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
