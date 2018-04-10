object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 320
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mp1: TMediaPlayer
    Left = 0
    Top = 355
    Width = 253
    Height = 30
    AutoOpen = True
    DeviceType = dtWaveAudio
    DoubleBuffered = True
    FileName = 'E:\Dance-Cartoon-Revolution\mus\kek.wav'
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 506
    OnTimer = Timer1Timer
    Left = 256
    Top = 352
  end
end
