unit Dance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
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
  Form1: TForm1;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Canvas.MoveTo(0,0);
  canvas.LineTo(99,99);
  //Form1.Paint;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Paint;
end;

end.
