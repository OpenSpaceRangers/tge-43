object Form9: TForm9
  Left = 200
  Top = 122
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Сообщение'
  ClientHeight = 239
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape
    Left = 11
    Top = 13
    Width = 551
    Height = 184
    Brush.Color = clBlack
  end
  object Shape1: TShape
    Left = 5
    Top = 5
    Width = 556
    Height = 191
  end
  object SpeedButton1: TSpeedButton
    Left = 10
    Top = 210
    Width = 23
    Height = 22
    Hint = 'Вставить стандартный текст'
    Caption = '>'
    Flat = True
    OnClick = Button1Click
  end
  object OkButton: TButton
    Left = 190
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Ok'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object Button1: TButton
    Left = 15
    Top = 163
    Width = 26
    Height = 25
    Caption = '+'
    TabOrder = 2
    Visible = False
    OnClick = Button1Click
  end
  object MessageText: TMemo
    Left = 15
    Top = 15
    Width = 541
    Height = 176
    BorderStyle = bsNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'MessageText')
    ParentFont = False
    TabOrder = 1
  end
  object Button2: TButton
    Left = 270
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 3
    OnClick = Button2Click
  end
end
