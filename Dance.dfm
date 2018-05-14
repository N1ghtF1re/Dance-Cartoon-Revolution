object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 462
  ClientWidth = 688
  Color = clBtnFace
  DoubleBuffered = True
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
    Left = 8
    Top = 451
    Width = 253
    Height = 30
    AutoOpen = True
    DeviceType = dtWaveAudio
    DoubleBuffered = True
    FileName = '..\..\mus\18-Baauer-HarlemShake.wav'
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object Timer276: TTimer
    Interval = 276
    OnTimer = Timer276Timer
    Left = 256
    Top = 272
  end
  object TimerMain: TTimer
    Interval = 80
    OnTimer = TimerMainTimer
    Left = 328
    Top = 216
  end
  object timer138: TTimer
    Interval = 138
    OnTimer = timer138Timer
    Left = 368
    Top = 144
  end
  object TimerStartDance: TTimer
    Interval = 13450
    OnTimer = TimerStartDanceTimer
    Left = 528
    Top = 208
  end
end
