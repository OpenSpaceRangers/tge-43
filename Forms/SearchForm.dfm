object LPSearchForm: TLPSearchForm
  Left = 309
  Top = 266
  BorderStyle = bsToolWindow
  Caption = #1053#1072#1074#1080#1075#1072#1094#1080#1103
  ClientHeight = 84
  ClientWidth = 259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMinimized
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 62
    Width = 37
    Height = 13
    Caption = #1053#1086#1084#1077#1088':'
  end
  object SEdit: TEdit
    Left = 87
    Top = 59
    Width = 74
    Height = 21
    TabOrder = 0
  end
  object SearchTypeRG: TRadioGroup
    Left = 8
    Top = 8
    Width = 154
    Height = 41
    Caption = #1055#1086#1080#1089#1082
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1051#1086#1082#1072#1094#1080#1080
      #1055#1077#1088#1077#1093#1086#1076#1072)
    TabOrder = 1
  end
  object EnterButton: TButton
    Left = 176
    Top = 14
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 2
    OnClick = EnterButtonClick
  end
end
