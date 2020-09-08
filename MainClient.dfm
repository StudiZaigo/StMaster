object uStClient: TuStClient
  Left = 0
  Top = 0
  Caption = 'StClient'
  ClientHeight = 375
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 7
    Top = 283
    Width = 250
    Height = 81
    Caption = 'Rotate'
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 23
      Width = 38
      Height = 13
      Caption = 'Azimuth'
    end
    object Label3: TLabel
      Left = 8
      Top = 50
      Width = 22
      Height = 13
      Caption = 'Freq'
    end
    object edtAzimuth_Rotator: TEdit
      Left = 76
      Top = 20
      Width = 64
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
    end
    object edtFreq_Rotate: TEdit
      Left = 76
      Top = 47
      Width = 64
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
    end
    object btnRotate: TButton
      Left = 146
      Top = 20
      Width = 80
      Height = 49
      Caption = 'Exec'
      TabOrder = 2
      OnClick = btnRotateClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 199
    Width = 249
    Height = 81
    Caption = 'Move'
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 23
      Width = 37
      Height = 13
      Caption = 'Rotator'
    end
    object Label6: TLabel
      Left = 8
      Top = 50
      Width = 38
      Height = 13
      Caption = 'Azimuth'
    end
    object edtRotator_Move: TEdit
      Left = 75
      Top = 20
      Width = 64
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
    end
    object edtAzimuth_Move: TEdit
      Left = 75
      Top = 47
      Width = 64
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
    end
    object btnOpenClose: TButton
      Left = 145
      Top = 11
      Width = 80
      Height = 29
      Caption = 'Open/Close'
      TabOrder = 2
      OnClick = btnOpenCloseClick
    end
    object btnMove: TButton
      Left = 145
      Top = 46
      Width = 80
      Height = 29
      Caption = 'Move'
      TabOrder = 3
      OnClick = btnMoveClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 10
    Top = 0
    Width = 247
    Height = 193
    Caption = 'Status'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 66
      Height = 13
      Caption = 'RotatorCount'
    end
    object lblTitle: TLabel
      Left = 73
      Top = 76
      Width = 20
      Height = 13
      Caption = 'Title'
    end
    object LalblAzimuth: TLabel
      Left = 192
      Top = 75
      Width = 38
      Height = 13
      Caption = 'Azimuth'
    end
    object Label2: TLabel
      Left = 138
      Top = 75
      Width = 30
      Height = 13
      Caption = 'Active'
    end
    object Label7: TLabel
      Left = 17
      Top = 76
      Width = 37
      Height = 13
      Caption = 'Rotator'
    end
    object Label8: TLabel
      Left = 19
      Top = 99
      Width = 6
      Height = 13
      Caption = '1'
    end
    object Label9: TLabel
      Left = 19
      Top = 118
      Width = 6
      Height = 13
      Caption = '2'
    end
    object Label10: TLabel
      Left = 19
      Top = 144
      Width = 6
      Height = 13
      Caption = '3'
    end
    object Label11: TLabel
      Left = 19
      Top = 163
      Width = 6
      Height = 13
      Caption = '4'
    end
    object cbxEnable: TCheckBox
      Left = 8
      Top = 16
      Width = 65
      Height = 25
      Caption = 'Enable'
      TabOrder = 0
    end
    object edtRotatorCount: TEdit
      Left = 95
      Top = 45
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object cbxRotatorActive1: TCheckBox
      Left = 143
      Top = 93
      Width = 62
      Height = 25
      TabOrder = 2
    end
    object edtRotatorTitle1: TEdit
      Left = 73
      Top = 95
      Width = 64
      Height = 21
      TabOrder = 3
    end
    object edtAzimuth1: TEdit
      Left = 164
      Top = 94
      Width = 67
      Height = 21
      Alignment = taRightJustify
      TabOrder = 4
    end
    object btnStatusGet: TButton
      Left = 144
      Top = 10
      Width = 79
      Height = 29
      Caption = 'Get'
      TabOrder = 5
      OnClick = btnStatusGetClick
    end
    object edtRotatorTitle2: TEdit
      Left = 73
      Top = 119
      Width = 64
      Height = 21
      TabOrder = 6
    end
    object cbxRotatorActive2: TCheckBox
      Left = 144
      Top = 117
      Width = 62
      Height = 25
      TabOrder = 7
    end
    object edtAzimuth2: TEdit
      Left = 164
      Top = 118
      Width = 68
      Height = 21
      Alignment = taRightJustify
      TabOrder = 8
    end
    object edtRotatorTitle3: TEdit
      Left = 73
      Top = 142
      Width = 64
      Height = 21
      TabOrder = 9
    end
    object cbxRotatorActive3: TCheckBox
      Left = 144
      Top = 140
      Width = 62
      Height = 25
      TabOrder = 10
    end
    object edtAzimuth3: TEdit
      Left = 164
      Top = 141
      Width = 68
      Height = 21
      Alignment = taRightJustify
      TabOrder = 11
    end
    object edtRotatorTitle4: TEdit
      Left = 73
      Top = 166
      Width = 64
      Height = 21
      TabOrder = 12
    end
    object cbxRotatorActive4: TCheckBox
      Left = 144
      Top = 164
      Width = 62
      Height = 25
      TabOrder = 13
    end
    object edtAzimuth4: TEdit
      Left = 164
      Top = 165
      Width = 68
      Height = 21
      Alignment = taRightJustify
      TabOrder = 14
    end
  end
end
