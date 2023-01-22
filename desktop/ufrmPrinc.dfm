object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnVolumeUp: TButton
    Left = 288
    Top = 160
    Width = 75
    Height = 25
    Caption = 'btnVolumeUp'
    TabOrder = 0
    OnClick = btnVolumeUpClick
  end
  object btnMediaPause: TButton
    Left = 408
    Top = 112
    Width = 75
    Height = 25
    Caption = 'btnMediaPause'
    TabOrder = 1
    OnClick = btnMediaPauseClick
  end
end
