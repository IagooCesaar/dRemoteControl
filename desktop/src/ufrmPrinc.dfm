object frmPrinc: TfrmPrinc
  Left = 0
  Top = 0
  Caption = 'dRemote Controle Desktop'
  ClientHeight = 325
  ClientWidth = 879
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object pcPrinc: TPageControl
    Left = 0
    Top = 0
    Width = 879
    Height = 306
    ActivePage = tsMedia
    Align = alClient
    TabHeight = 30
    TabOrder = 0
    ExplicitWidth = 635
    ExplicitHeight = 299
    object tsConfig: TTabSheet
      Caption = ':: Configura'#231#245'es  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Pagei'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object lbHost: TLabel
        Left = 24
        Top = 24
        Width = 36
        Height = 18
        Caption = 'Host:'
      end
      object Label1: TLabel
        Left = 24
        Top = 56
        Width = 36
        Height = 18
        Caption = 'Host:'
      end
      object edtHost: TEdit
        Left = 88
        Top = 24
        Width = 121
        Height = 26
        TabOrder = 0
        Text = '127.0.0.1'
      end
      object edtPort: TEdit
        Left = 88
        Top = 56
        Width = 121
        Height = 26
        NumbersOnly = True
        TabOrder = 1
        Text = '9000'
      end
    end
    object tsMedia: TTabSheet
      Caption = ':: Controles de M'#237'dia  '
      object btnMediaPlayPause: TButton
        Left = 16
        Top = 24
        Width = 185
        Height = 65
        Caption = 'Play/Pause'
        TabOrder = 0
        OnClick = btnMediaPlayPauseClick
      end
      object btnMediaStop: TButton
        Tag = 1
        Left = 16
        Top = 104
        Width = 185
        Height = 65
        Caption = 'Stop'
        TabOrder = 1
        OnClick = btnMediaPlayPauseClick
      end
      object btnMediaNextTrack: TButton
        Tag = 2
        Left = 207
        Top = 24
        Width = 185
        Height = 65
        Caption = 'Next Track'
        TabOrder = 2
        OnClick = btnMediaPlayPauseClick
      end
      object btnMediaPrevTrack: TButton
        Tag = 3
        Left = 207
        Top = 104
        Width = 185
        Height = 65
        Caption = 'Previous Track'
        TabOrder = 3
        OnClick = btnMediaPlayPauseClick
      end
      object btnMediaVolumeUp: TButton
        Tag = 4
        Left = 424
        Top = 24
        Width = 185
        Height = 65
        Caption = 'Volume UP'
        TabOrder = 4
        OnClick = btnMediaPlayPauseClick
      end
      object btnMediaVolumeDown: TButton
        Tag = 5
        Left = 424
        Top = 104
        Width = 185
        Height = 65
        Caption = 'Volume Down'
        TabOrder = 5
        OnClick = btnMediaPlayPauseClick
      end
      object btnMediaVolumeMute: TButton
        Tag = 6
        Left = 615
        Top = 104
        Width = 185
        Height = 65
        Caption = 'Volume MUTE'
        TabOrder = 6
        OnClick = btnMediaPlayPauseClick
      end
    end
  end
  object sbarPrinc: TStatusBar
    Left = 0
    Top = 306
    Width = 879
    Height = 19
    Panels = <
      item
        Text = 'Route: http://'
        Width = 500
      end
      item
        Text = 'Method:  POST'
        Width = 120
      end
      item
        Text = 'Response: 000'
        Width = 50
      end>
    ExplicitLeft = 448
    ExplicitTop = 160
    ExplicitWidth = 0
  end
end
