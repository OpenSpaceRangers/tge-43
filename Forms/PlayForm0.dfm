object Form6: TForm6
  Left = 70
  Top = 1
  Width = 1021
  Height = 749
  BorderIcons = [biMinimize, biMaximize]
  Caption = #1048#1075#1088#1072
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 10
    Top = 681
    Width = 61
    Height = 22
    Hint = #1042#1077#1088#1085#1091#1090#1100#1089#1103' '#1085#1072#1079#1072#1076
    Caption = '<'
    Flat = True
    OnClick = MakeUndoButtonClick
  end
  object SpeedButton2: TSpeedButton
    Left = 904
    Top = 681
    Width = 97
    Height = 22
    Hint = #1055#1088#1077#1088#1074#1072#1090#1100' '#1080#1075#1088#1091
    Caption = #1061
    Flat = True
    OnClick = CancelButtonClick
  end
  object ParLabel1: TLabel
    Left = 753
    Top = 5
    Width = 248
    Height = 388
    Alignment = taCenter
    AutoSize = False
    WordWrap = True
  end
  object ProgressLabel: TLabel
    Left = 104
    Top = 687
    Width = 67
    Height = 13
    Caption = 'ProgressLabel'
  end
  object CancelButton: TButton
    Left = 491
    Top = 681
    Width = 136
    Height = 24
    Caption = #1055#1088#1077#1082#1088#1072#1090#1080#1090#1100' '#1080#1075#1088#1091
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnClick = CancelButtonClick
  end
  object MakeUndoButton: TButton
    Left = 341
    Top = 682
    Width = 146
    Height = 23
    Caption = #1064#1072#1075' '#1085#1072#1079#1072#1076
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnClick = MakeUndoButtonClick
  end
  object AnswersGroupBox: TGroupBox
    Left = 5
    Top = 400
    Width = 996
    Height = 273
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Shape4: TShape
      Left = 152
      Top = 5
      Width = 564
      Height = 219
      Visible = False
    end
    object Label1: TLabel
      Tag = 1
      Left = 10
      Top = 10
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label2: TLabel
      Tag = 2
      Left = 10
      Top = 26
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label3: TLabel
      Tag = 3
      Left = 10
      Top = 42
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label5: TLabel
      Tag = 5
      Left = 10
      Top = 73
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label6: TLabel
      Tag = 6
      Left = 10
      Top = 89
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label7: TLabel
      Tag = 7
      Left = 10
      Top = 105
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label8: TLabel
      Tag = 8
      Left = 10
      Top = 121
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label4: TLabel
      Tag = 4
      Left = 10
      Top = 57
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label9: TLabel
      Tag = 9
      Left = 10
      Top = 137
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label10: TLabel
      Tag = 10
      Left = 10
      Top = 153
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label11: TLabel
      Tag = 11
      Left = 10
      Top = 169
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label12: TLabel
      Tag = 12
      Left = 10
      Top = 185
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label13: TLabel
      Tag = 13
      Left = 10
      Top = 201
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label14: TLabel
      Tag = 14
      Left = 10
      Top = 217
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label15: TLabel
      Tag = 15
      Left = 10
      Top = 233
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label16: TLabel
      Tag = 16
      Left = 10
      Top = 249
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label17: TLabel
      Tag = 32
      Left = 506
      Top = 249
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label18: TLabel
      Tag = 31
      Left = 506
      Top = 233
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label19: TLabel
      Tag = 30
      Left = 506
      Top = 217
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label20: TLabel
      Tag = 29
      Left = 506
      Top = 201
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label21: TLabel
      Tag = 28
      Left = 506
      Top = 185
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label22: TLabel
      Tag = 27
      Left = 506
      Top = 169
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label23: TLabel
      Tag = 26
      Left = 506
      Top = 153
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label24: TLabel
      Tag = 25
      Left = 506
      Top = 137
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label25: TLabel
      Tag = 24
      Left = 506
      Top = 121
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label26: TLabel
      Tag = 23
      Left = 506
      Top = 105
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label27: TLabel
      Tag = 22
      Left = 506
      Top = 89
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label28: TLabel
      Tag = 21
      Left = 506
      Top = 73
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label29: TLabel
      Tag = 20
      Left = 506
      Top = 57
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label30: TLabel
      Tag = 18
      Left = 506
      Top = 42
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label31: TLabel
      Tag = 18
      Left = 506
      Top = 26
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
    object Label32: TLabel
      Tag = 17
      Left = 506
      Top = 10
      Width = 490
      Height = 13
      Cursor = crHandPoint
      AutoSize = False
      Caption = '<Static>'
      Transparent = True
      WordWrap = True
      OnClick = LabelClick
      OnMouseMove = LabelMouseMove
    end
  end
  object SDTRichEdit: TRichEdit
    Left = 5
    Top = 5
    Width = 740
    Height = 388
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HideScrollBars = False
    Lines.Strings = (
      ''
      #1083#1103'-'#1083#1103'-'#1083#1103)
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WantTabs = True
  end
  object Panel1: TPanel
    Left = 180
    Top = 242
    Width = 332
    Height = 84
    TabOrder = 1
    Visible = False
    object LabelWait: TLabel
      Left = 38
      Top = 32
      Width = 269
      Height = 13
      Caption = #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '#1087#1086#1076#1086#1078#1076#1080#1090#1077'. '#1048#1076#1077#1090' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1099#1093'.'
    end
  end
  object ActionManager1: TActionManager
    Left = 648
    Top = 679
    StyleName = 'XP Style'
    object RichEditBold1: TRichEditBold
      Category = 'Format'
      AutoCheck = True
      Caption = '&Bold'
      Hint = 'Bold'
      ImageIndex = 31
      ShortCut = 16450
    end
  end
  object StartGameTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = StartGameTimerTimer
    Left = 304
    Top = 679
  end
end