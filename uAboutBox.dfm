object AboutBox: TAboutBox
  Left = 421
  Top = 252
  BorderStyle = bsDialog
  Caption = #12496#12540#12472#12519#12531#24773#22577
  ClientHeight = 195
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 7
    Top = 7
    Width = 314
    Height = 148
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object ProgramIcon: TImage
      Left = 7
      Top = 7
      Width = 32
      Height = 32
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF00EEEEEEEEEEEEEE000000000000000000EEEEEEEEEEEEEE0000000000
        00000000EEEAAEEEEEEEEE000000000000000000EEEAAEEEEEEEEE00000000B0
        00000000EEEEEEEEEEEEEE000000000000000000AAAEAAAEEEEEEE0000000000
        00000000AAAEEAAAEEEEEE000000000000000000AAAAEEAAEEEEE00000000000
        00000000AAAEEEEAEEEEE000000000000000B000AAAEEEEEEEEEE00000000000
        00000000AAEEEEEEAAEEE0022000000220000000AAAEEEEEEEEE000022000002
        20000000AAAAEEEEEEEE00000220000220000000AAAAAEEAAEEE000000220002
        20000000AAAAAEEAAEE000000044422777800000AAAAAEEAAEE0000004442222
        77780000A8AAAAEAAE00000044422222277780008888AAAAAE00222444222222
        227778008888AAAAA00220244222222222277780888888AA0022000422222222
        22227780F88888A0002000222222222222222280FF888A000000002222222222
        22222660FFF88000000000B2222222222222A660FFF00000000000BB22222222
        222AA660F00000000000000BB222222222AAA620000000000000000BBB222222
        2AAAAA220000000000000000BBB22222AAAAA02200000000000000000BBB222A
        AAAA0022000000000B00000000BBB2AAAAA00022000000B000000000000BBBBB
        B22000000000000000000000000000000222200000000000B000B00000000000
        0002222000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000}
      Stretch = True
      IsControl = True
    end
    object ProductName: TLabel
      Left = 81
      Top = 15
      Width = 36
      Height = 12
      Caption = #35069#21697#21517
      IsControl = True
    end
    object Version: TLabel
      Left = 81
      Top = 37
      Width = 53
      Height = 12
      Caption = #12496#12540#12472#12519#12531
      IsControl = True
    end
    object Copyright: TLabel
      Left = 7
      Top = 73
      Width = 60
      Height = 12
      Caption = #33879#20316#27177#34920#35352
      IsControl = True
    end
    object Comments: TLabel
      Left = 7
      Top = 95
      Width = 37
      Height = 12
      Caption = #12467#12513#12531#12488
      WordWrap = True
      IsControl = True
    end
    object Label1: TLabel
      Left = 145
      Top = 17
      Width = 54
      Height = 12
      Caption = 'StMaster'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Label2: TLabel
      Left = 145
      Top = 37
      Width = 17
      Height = 12
      Caption = '1.0'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Label3: TLabel
      Left = 81
      Top = 73
      Width = 130
      Height = 12
      Caption = 'Satoh Kunio(JA7FKF)'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Label4: TLabel
      Left = 65
      Top = 95
      Width = 59
      Height = 12
      Caption = #12371#12398#12503#12525#12464
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
  end
  object OKButton: TButton
    Left = 150
    Top = 165
    Width = 69
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
