object Form3: TForm3
  Left = 188
  Top = 82
  ActiveControl = CancelButton
  Anchors = [akTop]
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1077#1088#1077#1093#1086#1076#1072
  ClientHeight = 557
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 288
    Top = 542
    Width = 59
    Height = 13
    Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090':'
  end
  object PTLabel: TLabel
    Left = 133
    Top = 542
    Width = 77
    Height = 13
    Caption = #1055#1088#1086#1093#1086#1076#1080#1084#1086#1089#1090#1100':'
  end
  object DefUnlPathGoTimesCheck: TCheckBox
    Left = 10
    Top = 542
    Width = 103
    Height = 13
    Caption = #1053#1077#1086#1075#1088#1072#1085#1080#1095#1077#1085#1085#1072#1103' '
    Color = clBtnFace
    Constraints.MaxWidth = 199
    Constraints.MinWidth = 103
    ParentColor = False
    TabOrder = 9
    OnClick = DefUnlPathGoTimesCheckClick
  end
  object CancelButton: TButton
    Left = 670
    Top = 529
    Width = 95
    Height = 26
    Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1074#1086#1076' '#1076#1072#1085#1085#1099#1093
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = CancelButtonClick
  end
  object OKButton: TButton
    Left = 564
    Top = 529
    Width = 91
    Height = 26
    Hint = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1074#1074#1086#1076' '#1076#1072#1085#1085#1099#1093
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = OKButtonClick
  end
  object VoidFlagPanel: TPanel
    Left = 0
    Top = -2
    Width = 767
    Height = 505
    BevelOuter = bvNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 82
      Width = 117
      Height = 13
      Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077' '#1087#1077#1088#1077#1093#1086#1076#1072' :'
    end
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 177
      Height = 13
      Caption = #1042#1086#1087#1088#1086#1089' '#1076#1083#1103' '#1089#1086#1074#1077#1088#1096#1077#1085#1080#1103' '#1087#1077#1088#1077#1093#1086#1076#1072':'
    end
    object StatisticsLabel: TLabel
      Left = 9
      Top = 4
      Width = 736
      Height = 11
      Alignment = taCenter
      AutoSize = False
      Caption = #1058#1077#1082#1089#1090#1086#1074#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1083#1086#1082#1072#1094#1080#1080' :'
      Color = clSilver
      ParentColor = False
    end
    object Label2: TLabel
      Left = 11
      Top = 206
      Width = 107
      Height = 13
      Caption = #1051#1086#1075#1080#1095#1077#1089#1082#1086#1077' '#1091#1089#1083#1086#1074#1080#1077':'
    end
    object LSymWarnLabel: TLabel
      Left = 583
      Top = 207
      Width = 20
      Height = 13
      Hint = #1042#1085#1080#1084#1072#1085#1080#1077': '#1083#1080#1096#1085#1080#1077' '#1089#1080#1084#1074#1086#1083#1099' '#1083#1080#1073#1086' '#1085#1077#1086#1095#1077#1074#1080#1076#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      Caption = 'SYM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object LParenthesErrorLabel: TLabel
      Left = 623
      Top = 207
      Width = 14
      Height = 13
      Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1088#1072#1089#1089#1090#1072#1085#1086#1074#1082#1072' '#1089#1082#1086#1073#1086#1082
      Caption = '(  )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object LParameterErrorLabel: TLabel
      Left = 662
      Top = 207
      Width = 20
      Height = 13
      Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
      Caption = 'PAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object LValueErrorLabel: TLabel
      Left = 694
      Top = 207
      Width = 18
      Height = 13
      Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1095#1080#1089#1083#1086#1074#1086#1081' '#1082#1086#1085#1089#1090#1072#1085#1090#1099
      Caption = 'VAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object LParseOkLabel: TLabel
      Left = 744
      Top = 207
      Width = 14
      Height = 13
      Hint = #1042#1099#1088#1072#1078#1077#1085#1080#1077' '#1087#1088#1080#1075#1086#1076#1085#1086' '#1076#1083#1103' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LDiapErrorLabel: TLabel
      Left = 646
      Top = 207
      Width = 7
      Height = 13
      Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1087#1088#1072#1074#1080#1083#1100#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
      Caption = 'D'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object EndMessageEdit: TMemo
      Left = 6
      Top = 96
      Width = 756
      Height = 101
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      Lines.Strings = (
        'EndMessageEdit')
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 1
      OnChange = EndMessageEditChange
    end
    object StartMessageEdit: TMemo
      Left = 7
      Top = 31
      Width = 755
      Height = 46
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1074#1086#1087#1088#1086#1089' '#1076#1083#1103' '#1089#1086#1074#1077#1088#1096#1077#1085#1080#1103' '#1087#1077#1088#1077#1093#1086#1076#1072
      Lines.Strings = (
        'StartMessageEdit')
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 0
      OnChange = StartMessageEditChange
    end
    object ParCustomizePanel: TPanel
      Left = 365
      Top = 229
      Width = 398
      Height = 254
      TabOrder = 3
      DesignSize = (
        398
        254)
      object Shape2: TShape
        Left = 12
        Top = 63
        Width = 182
        Height = 51
        Brush.Color = clBtnFace
      end
      object Shape21: TShape
        Left = 11
        Top = 8
        Width = 183
        Height = 50
        Brush.Color = clBtnFace
      end
      object TrackBarRightImage: TImage
        Left = 175
        Top = 69
        Width = 15
        Height = 18
        Picture.Data = {
          07544269746D617056050000424D560500000000000036040000280000000F00
          000012000000010008000000000020010000C40E0000C40E0000000100000000
          0000000000004000000080000000FF000000002000004020000080200000FF20
          0000004000004040000080400000FF400000006000004060000080600000FF60
          0000008000004080000080800000FF80000000A0000040A0000080A00000FFA0
          000000C0000040C0000080C00000FFC0000000FF000040FF000080FF0000FFFF
          0000000020004000200080002000FF002000002020004020200080202000FF20
          2000004020004040200080402000FF402000006020004060200080602000FF60
          2000008020004080200080802000FF80200000A0200040A0200080A02000FFA0
          200000C0200040C0200080C02000FFC0200000FF200040FF200080FF2000FFFF
          2000000040004000400080004000FF004000002040004020400080204000FF20
          4000004040004040400080404000FF404000006040004060400080604000FF60
          4000008040004080400080804000FF80400000A0400040A0400080A04000FFA0
          400000C0400040C0400080C04000FFC0400000FF400040FF400080FF4000FFFF
          4000000060004000600080006000FF006000002060004020600080206000FF20
          6000004060004040600080406000FF406000006060004060600080606000FF60
          6000008060004080600080806000FF80600000A0600040A0600080A06000FFA0
          600000C0600040C0600080C06000FFC0600000FF600040FF600080FF6000FFFF
          6000000080004000800080008000FF008000002080004020800080208000FF20
          8000004080004040800080408000FF408000006080004060800080608000FF60
          8000008080004080800080808000FF80800000A0800040A0800080A08000FFA0
          800000C0800040C0800080C08000FFC0800000FF800040FF800080FF8000FFFF
          80000000A0004000A0008000A000FF00A0000020A0004020A0008020A000FF20
          A0000040A0004040A0008040A000FF40A0000060A0004060A0008060A000FF60
          A0000080A0004080A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0
          A00000C0A00040C0A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFF
          A0000000C0004000C0008000C000FF00C0000020C0004020C0008020C000FF20
          C0000040C0004040C0008040C000FF40C0000060C0004060C0008060C000FF60
          C0000080C0004080C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0
          C00000C0C00040C0C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFF
          C0000000FF004000FF008000FF00FF00FF000020FF004020FF008020FF00FF20
          FF000040FF004040FF008040FF00FF40FF000060FF004060FF008060FF00FF60
          FF000080FF004080FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0
          FF0000C0FF0040C0FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFF
          FF0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF00FFFFFFFFFFFFFFFFFF
          0000FFFFFFFF0000FFFFFFFFFFFFFFFF0000FFFFFFFF00FF00FFFFFFFFFFFFFF
          0000FFFFFFFF00FFFF00FFFFFFFFFFFF0000FFFFFFFF00FFFFFF00FFFFFFFFFF
          0000FFFFFFFF00FFFFFFFF00FFFFFFFF0000FFFFFFFF00FFFFFFFFFF00FFFFFF
          0000FFFFFFFF00FFFFFFFF00FFFFFFFF0000FFFFFFFF00FFFFFF00FFFFFFFFFF
          0000FFFFFFFF00FFFF00FFFFFFFFFFFF0000FFFFFFFF00FF00FFFFFFFFFFFFFF
          0000FFFFFFFF0000FFFFFFFFFFFFFFFF0000FFFFFFFF00FFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
          0000}
        OnMouseDown = TrackBarRightImageMouseDown
        OnMouseUp = TrackBarRightImageMouseUp
      end
      object TrackBarLeftImage: TImage
        Left = 17
        Top = 69
        Width = 15
        Height = 18
        Picture.Data = {
          07544269746D617056050000424D560500000000000036040000280000000F00
          000012000000010008000000000020010000C40E0000C40E0000000100000000
          0000000000004000000080000000FF000000002000004020000080200000FF20
          0000004000004040000080400000FF400000006000004060000080600000FF60
          0000008000004080000080800000FF80000000A0000040A0000080A00000FFA0
          000000C0000040C0000080C00000FFC0000000FF000040FF000080FF0000FFFF
          0000000020004000200080002000FF002000002020004020200080202000FF20
          2000004020004040200080402000FF402000006020004060200080602000FF60
          2000008020004080200080802000FF80200000A0200040A0200080A02000FFA0
          200000C0200040C0200080C02000FFC0200000FF200040FF200080FF2000FFFF
          2000000040004000400080004000FF004000002040004020400080204000FF20
          4000004040004040400080404000FF404000006040004060400080604000FF60
          4000008040004080400080804000FF80400000A0400040A0400080A04000FFA0
          400000C0400040C0400080C04000FFC0400000FF400040FF400080FF4000FFFF
          4000000060004000600080006000FF006000002060004020600080206000FF20
          6000004060004040600080406000FF406000006060004060600080606000FF60
          6000008060004080600080806000FF80600000A0600040A0600080A06000FFA0
          600000C0600040C0600080C06000FFC0600000FF600040FF600080FF6000FFFF
          6000000080004000800080008000FF008000002080004020800080208000FF20
          8000004080004040800080408000FF408000006080004060800080608000FF60
          8000008080004080800080808000FF80800000A0800040A0800080A08000FFA0
          800000C0800040C0800080C08000FFC0800000FF800040FF800080FF8000FFFF
          80000000A0004000A0008000A000FF00A0000020A0004020A0008020A000FF20
          A0000040A0004040A0008040A000FF40A0000060A0004060A0008060A000FF60
          A0000080A0004080A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0
          A00000C0A00040C0A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFF
          A0000000C0004000C0008000C000FF00C0000020C0004020C0008020C000FF20
          C0000040C0004040C0008040C000FF40C0000060C0004060C0008060C000FF60
          C0000080C0004080C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0
          C00000C0C00040C0C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFF
          C0000000FF004000FF008000FF00FF00FF000020FF004020FF008020FF00FF20
          FF000040FF004040FF008040FF00FF40FF000060FF004060FF008060FF00FF60
          FF000080FF004080FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0
          FF0000C0FF0040C0FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFF
          FF000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF00FFFFFF
          FF0000FFFFFFFFFFFFFFFF0000FFFFFFFF0000FFFFFFFFFFFFFF00FF00FFFFFF
          FF0000FFFFFFFFFFFF00FFFF00FFFFFFFF0000FFFFFFFFFF00FFFFFF00FFFFFF
          FF0000FFFFFFFF00FFFFFFFF00FFFFFFFF0000FFFFFF00FFFFFFFFFF00FFFFFF
          FF0000FFFFFFFF00FFFFFFFF00FFFFFFFF0000FFFFFFFFFF00FFFFFF00FFFFFF
          FF0000FFFFFFFFFFFF00FFFF00FFFFFFFF0000FFFFFFFFFFFFFF00FF00FFFFFF
          FF0000FFFFFFFFFFFFFFFF0000FFFFFFFF0000FFFFFFFFFFFFFFFFFF00FFFFFF
          FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000
          0000}
        OnMouseDown = TrackBarLeftImageMouseDown
        OnMouseUp = TrackBarLeftImageMouseUp
      end
      object ParMinLabel: TLabel
        Left = 17
        Top = 94
        Width = 34
        Height = 12
        AutoSize = False
        Caption = '-100%'
      end
      object Shape19: TShape
        Left = 11
        Top = 7
        Width = 181
        Height = 16
        Brush.Color = clBtnFace
      end
      object Label9: TLabel
        Left = 25
        Top = 35
        Width = 16
        Height = 13
        Caption = #1086#1090':'
      end
      object Shape22: TShape
        Left = 11
        Top = 7
        Width = 183
        Height = 16
        Brush.Color = clBtnFace
      end
      object Label11: TLabel
        Left = 15
        Top = 8
        Width = 174
        Height = 12
        Alignment = taCenter
        AutoSize = False
        Caption = #1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1080#1084#1077#1090#1100' '#1074' '#1076#1080#1072#1087#1072#1079#1086#1085#1077
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 25
        Top = 35
        Width = 16
        Height = 13
        Caption = #1086#1090':'
      end
      object Label13: TLabel
        Left = 106
        Top = 34
        Width = 17
        Height = 13
        Caption = #1076#1086':'
      end
      object TrackBarGroundShape: TShape
        Left = 31
        Top = 69
        Width = 144
        Height = 18
        OnMouseDown = TrackBarGroundShapeMouseDown
        OnMouseMove = TrackBarGroundShapeMouseMove
        OnMouseUp = TrackBarGroundShapeMouseUp
      end
      object TrackBarButtonShape: TShape
        Left = 104
        Top = 69
        Width = 2
        Height = 18
        Brush.Color = clInfoBk
      end
      object Shape1: TShape
        Left = 202
        Top = 8
        Width = 189
        Height = 50
        Brush.Color = clBtnFace
      end
      object Shape3: TShape
        Left = 202
        Top = 7
        Width = 189
        Height = 16
        Brush.Color = clBtnFace
      end
      object ValueGateNegationLabel: TLabel
        Left = 215
        Top = 8
        Width = 162
        Height = 12
        Alignment = taCenter
        AutoSize = False
        Caption = #1055#1088#1080#1085#1080#1084#1072#1077#1090' '#1079#1085#1072#1095#1077#1085#1080#1103
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Shape4: TShape
        Left = 202
        Top = 64
        Width = 189
        Height = 50
        Brush.Color = clBtnFace
      end
      object Shape5: TShape
        Left = 202
        Top = 63
        Width = 189
        Height = 16
        Brush.Color = clBtnFace
      end
      object ModZeroeGateNegationLabel: TLabel
        Left = 216
        Top = 64
        Width = 167
        Height = 12
        Alignment = taCenter
        AutoSize = False
        Caption = #1053#1077' '#1082#1088#1072#1090#1085#1086' '#1079#1085#1072#1095#1077#1085#1080#1103#1084
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ChangeValueGateNegationImg: TImage
        Left = 373
        Top = 7
        Width = 18
        Height = 16
        Picture.Data = {
          07544269746D6170B6030000424DB60300000000000036000000280000001200
          000010000000010018000000000080030000C40E0000C40E0000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
          0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0
          C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000000000
          00000000C0C0C0C0C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0
          C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
          0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0
          C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C00000
          00000000000000000000000000000000000000000000000000C0C0C0C0C0C0C0
          C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
          0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
        OnClick = ChangeValueGateNegationImgClick
      end
      object ChangeModZeroeGateNegationImg: TImage
        Left = 373
        Top = 63
        Width = 18
        Height = 16
        Picture.Data = {
          07544269746D6170B6030000424DB60300000000000036000000280000001200
          000010000000010018000000000080030000C40E0000C40E0000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
          0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0
          C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000000000
          00000000C0C0C0C0C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0
          C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
          0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0
          C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C00000
          00000000000000000000000000000000000000000000000000C0C0C0C0C0C0C0
          C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
          0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
        OnClick = ChangeModZeroeGateNegationImgClick
      end
      object ParMaxLabel: TLabel
        Left = 159
        Top = 94
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = '100%'
      end
      object ParValueLabel: TLabel
        Left = 69
        Top = 95
        Width = 68
        Height = 13
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = '0'
      end
      object DeltaTypeGroupBox: TGroupBox
        Left = 10
        Top = 114
        Width = 185
        Height = 48
        TabOrder = 5
        object DeltaValueRadioBtn: TRadioButton
          Left = 10
          Top = 14
          Width = 69
          Height = 13
          Caption = #1045#1076#1080#1085#1080#1094#1099
          TabOrder = 0
          OnClick = DeltaValueRadioBtnClick
        end
        object DeltaPercentRadioBtn: TRadioButton
          Left = 92
          Top = 14
          Width = 74
          Height = 13
          Caption = #1055#1088#1086#1094#1077#1085#1090#1099
          TabOrder = 1
          OnClick = DeltaPercentRadioBtnClick
        end
        object DeltaApprRadioBtn: TRadioButton
          Left = 10
          Top = 28
          Width = 79
          Height = 17
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          TabOrder = 2
          OnClick = DeltaApprRadioBtnClick
        end
        object DeltaExprRadioBtn: TRadioButton
          Left = 92
          Top = 28
          Width = 83
          Height = 17
          Caption = #1042#1099#1088#1072#1078#1077#1085#1080#1077
          TabOrder = 3
          OnClick = DeltaExprRadioBtnClick
        end
      end
      object ParDeltaTrackBar: TTrackBar
        Left = -180
        Top = 130
        Width = 195
        Height = 24
        Cursor = crArrow
        DragCursor = crDefault
        Max = 100
        Min = -100
        PageSize = 1
        TabOrder = 7
        TickStyle = tsNone
        Visible = False
        OnChange = ParDeltaTrackBarChange
      end
      object MinGateEdit: TEdit
        Left = 44
        Top = 30
        Width = 51
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0'
        OnChange = MinGateEditChange
      end
      object MaxGateEdit: TEdit
        Left = 127
        Top = 30
        Width = 51
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '1'
        OnChange = MaxGateEditChange
      end
      object ParViewActionRG: TRadioGroup
        Left = 202
        Top = 114
        Width = 190
        Height = 48
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #1053#1077' '#1090#1088#1086#1075#1072#1090#1100
          #1055#1086#1082#1072#1079#1072#1090#1100' '
          #1057#1082#1088#1099#1090#1100)
        TabOrder = 6
        OnClick = ParViewActionRGClick
      end
      object ValueGateEdit: TEdit
        Left = 208
        Top = 30
        Width = 177
        Height = 21
        TabOrder = 2
        OnChange = ValueGateEditChange
      end
      object ModZeroeGateEdit: TEdit
        Left = 208
        Top = 86
        Width = 178
        Height = 21
        TabOrder = 4
        OnChange = ModZeroeGateEditChange
      end
      object DeltaExprPanel: TPanel
        Left = 11
        Top = 63
        Width = 182
        Height = 51
        Caption = 'DeltaExprPanel'
        TabOrder = 3
        object Shape6: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 51
          Brush.Color = clBtnFace
        end
        object SymWarnLabel: TLabel
          Left = 10
          Top = 8
          Width = 20
          Height = 13
          Hint = #1042#1085#1080#1084#1072#1085#1080#1077': '#1083#1080#1096#1085#1080#1077' '#1089#1080#1084#1074#1086#1083#1099' '#1083#1080#1073#1086' '#1085#1077#1086#1095#1077#1074#1080#1076#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
          Caption = 'SYM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ParenthesErrorLabel: TLabel
          Left = 52
          Top = 7
          Width = 14
          Height = 13
          Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1088#1072#1089#1089#1090#1072#1085#1086#1074#1082#1072' '#1089#1082#1086#1073#1086#1082
          Caption = '(  )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ParameterErrorLabel: TLabel
          Left = 89
          Top = 8
          Width = 20
          Height = 13
          Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
          Caption = 'PAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ValueErrorLabel: TLabel
          Left = 121
          Top = 8
          Width = 18
          Height = 13
          Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1082#1086#1088#1088#1077#1082#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1095#1080#1089#1083#1086#1074#1086#1081' '#1082#1086#1085#1089#1090#1072#1085#1090#1099
          Caption = 'VAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ParseOkLabel: TLabel
          Left = 163
          Top = 8
          Width = 14
          Height = 13
          Hint = #1042#1099#1088#1072#1078#1077#1085#1080#1077' '#1087#1088#1080#1075#1086#1076#1085#1086' '#1076#1083#1103' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103
          Caption = 'OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object DiapErrorLabel: TLabel
          Left = 74
          Top = 8
          Width = 7
          Height = 13
          Hint = #1054#1096#1080#1073#1082#1072': '#1085#1077#1087#1088#1072#1074#1080#1083#1100#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' '#1076#1080#1072#1087#1072#1079#1086#1085#1072
          Caption = 'D'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Visible = False
        end
        object ExpressionEdit: TEdit
          Left = 3
          Top = 26
          Width = 177
          Height = 21
          TabOrder = 0
          OnChange = ExpressionEditChange
        end
      end
      object ParCriticalMessageMemo: TMemo
        Left = 9
        Top = 166
        Width = 382
        Height = 80
        Lines.Strings = (
          'Memo1')
        ScrollBars = ssVertical
        TabOrder = 8
        OnChange = ParCriticalMessageMemoChange
      end
      object BitMaskGroupBox: TGroupBox
        Left = -326
        Top = 177
        Width = 382
        Height = 59
        Caption = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1074#1082#1083#1102#1095#1077#1085#1085#1099#1077' '#1073#1080#1090#1099' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
        TabOrder = 9
        Visible = False
        object Label5: TLabel
          Left = 334
          Top = 17
          Width = 32
          Height = 11
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
        end
        object Label6: TLabel
          Left = 294
          Top = 17
          Width = 32
          Height = 11
          Alignment = taCenter
          AutoSize = False
          Caption = '1'
        end
        object Label7: TLabel
          Left = 254
          Top = 17
          Width = 32
          Height = 11
          Alignment = taCenter
          AutoSize = False
          Caption = '2'
        end
        object Label8: TLabel
          Left = 134
          Top = 17
          Width = 32
          Height = 11
          Alignment = taCenter
          AutoSize = False
          Caption = '5'
        end
        object Label14: TLabel
          Left = 174
          Top = 17
          Width = 32
          Height = 11
          Alignment = taCenter
          AutoSize = False
          Caption = '4'
        end
        object Label15: TLabel
          Left = 214
          Top = 17
          Width = 32
          Height = 11
          Alignment = taCenter
          AutoSize = False
          Caption = '3'
        end
        object Label16: TLabel
          Left = 14
          Top = 17
          Width = 32
          Height = 11
          Alignment = taCenter
          AutoSize = False
          Caption = '8'
        end
        object Label17: TLabel
          Left = 54
          Top = 17
          Width = 32
          Height = 11
          Alignment = taCenter
          AutoSize = False
          Caption = '7'
        end
        object Label18: TLabel
          Left = 94
          Top = 17
          Width = 32
          Height = 11
          Alignment = taCenter
          AutoSize = False
          Caption = '6'
        end
        object BMCheck0: TCheckBox
          Left = 352
          Top = 35
          Width = 25
          Height = 16
          TabOrder = 8
          OnClick = BMCheck0Click
        end
        object BMCheck1: TCheckBox
          Left = 304
          Top = 35
          Width = 25
          Height = 16
          TabOrder = 7
          OnClick = BMCheck1Click
        end
        object BMCheck2: TCheckBox
          Left = 264
          Top = 35
          Width = 25
          Height = 16
          TabOrder = 6
          OnClick = BMCheck2Click
        end
        object BMCheck5: TCheckBox
          Left = 144
          Top = 35
          Width = 25
          Height = 16
          TabOrder = 3
          OnClick = BMCheck5Click
        end
        object BMCheck4: TCheckBox
          Left = 184
          Top = 35
          Width = 25
          Height = 16
          TabOrder = 4
          OnClick = BMCheck4Click
        end
        object BMCheck3: TCheckBox
          Left = 224
          Top = 35
          Width = 25
          Height = 16
          TabOrder = 5
          OnClick = BMCheck3Click
        end
        object BMCheck8: TCheckBox
          Left = 23
          Top = 35
          Width = 25
          Height = 16
          TabOrder = 0
          OnClick = BMCheck8Click
        end
        object BMCheck7: TCheckBox
          Left = 64
          Top = 35
          Width = 25
          Height = 16
          TabOrder = 1
          OnClick = BMCheck7Click
        end
        object BMCheck6: TCheckBox
          Left = 104
          Top = 35
          Width = 25
          Height = 16
          TabOrder = 2
          OnClick = BMCheck6Click
        end
      end
    end
    object LogicExpressionEdit: TEdit
      Left = 128
      Top = 203
      Width = 443
      Height = 21
      TabOrder = 2
      OnChange = LogicExpressionEditChange
    end
  end
  object AlwaysShowWhenPlayCheckBox: TCheckBox
    Left = 121
    Top = 498
    Width = 123
    Height = 17
    Caption = #1042#1089#1077#1075#1076#1072' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100
    TabOrder = 2
    OnClick = AlwaysShowWhenPlayCheckBoxClick
  end
  object CostOneDayCheckBox: TCheckBox
    Left = 265
    Top = 499
    Width = 119
    Height = 13
    Caption = #1055#1088#1086#1096#1077#1083' '#1086#1076#1080#1085' '#1076#1077#1085#1100
    TabOrder = 3
    OnClick = CostOneDayCheckBoxClick
  end
  object ProbabilityEdit: TEdit
    Left = 358
    Top = 534
    Width = 50
    Height = 21
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnChange = ProbabilityEditChange
  end
  object NextOQPButton: TButton
    Left = 457
    Top = 529
    Width = 91
    Height = 26
    Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081
    TabOrder = 4
    OnClick = NextOQPButtonClick
  end
  object PassTimesValueEdit: TEdit
    Left = 222
    Top = 534
    Width = 50
    Height = 21
    AutoSize = False
    TabOrder = 7
    OnChange = PassTimesValueEditChange
  end
  object QuestDifficultyGroupBox: TGroupBox
    Left = 403
    Top = 481
    Width = 360
    Height = 39
    Caption = #1055#1086#1088#1103#1076#1086#1082' '#1087#1086#1082#1072#1079#1072
    TabOrder = 1
    object ShowOrderGauge: TGauge
      Left = 8
      Top = 15
      Width = 226
      Height = 17
      ForeColor = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 9
      ParentFont = False
      Progress = 0
      ShowText = False
    end
    object ShowOrderLabel: TLabel
      Left = 67
      Top = 17
      Width = 111
      Height = 13
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '5'
      ParentBiDiMode = False
      Transparent = True
    end
    object ShowOrderTrackBar: TTrackBar
      Left = 237
      Top = 12
      Width = 117
      Height = 23
      Max = 9
      PageSize = 0
      TabOrder = 0
      OnChange = ShowOrderTrackBarChange
    end
  end
  object ParList: TCheckListBox
    Left = 5
    Top = 226
    Width = 355
    Height = 264
    OnClickCheck = ParListClickCheck
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 10
    OnClick = ParListClick
  end
  object RedrawStatistsicsTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = RedrawStatistsicsTimerTimer
    Left = 540
    Top = 28
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = RedrawStatistsicsTimerTimer
    Left = 540
    Top = 28
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 1
    OnTimer = RedrawStatistsicsTimerTimer
    Left = 540
    Top = 28
  end
end
