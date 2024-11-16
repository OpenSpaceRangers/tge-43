object StatisticsCalculationStyleForm: TStatisticsCalculationStyleForm
  Left = 186
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1099#1095#1080#1089#1083#1077#1085#1080#1077' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
  ClientHeight = 149
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CheckCalculationStyleRadioGroup: TRadioGroup
    Left = 8
    Top = 5
    Width = 217
    Height = 105
    ItemIndex = 0
    Items.Strings = (
      #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100' '#1074#1099#1095#1080#1089#1083#1077#1085#1080#1077' '#1087#1086#1083#1085#1086#1081' '
      #1057#1095#1080#1090#1072#1090#1100' '#1085#1077#1087#1086#1083#1085#1091#1102
      #1055#1088#1077#1082#1088#1072#1090#1080#1090#1100' '#1089#1095#1077#1090' ')
    TabOrder = 0
    OnClick = CheckCalculationStyleRadioGroupClick
  end
  object OkButton: TButton
    Left = 80
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = OkButtonClick
  end
end
