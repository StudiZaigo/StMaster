object frmComPort: TfrmComPort
  Left = 0
  Top = 0
  Width = 236
  Height = 184
  TabOrder = 0
  object gbxComPort: TGroupBox
    Left = -1
    Top = 3
    Width = 234
    Height = 183
    Caption = ' Com Port '
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 23
      Width = 20
      Height = 13
      Caption = 'Port'
    end
    object Label6: TLabel
      Left = 19
      Top = 156
      Width = 60
      Height = 13
      Caption = 'Flow Control'
    end
    object Label2: TLabel
      Left = 19
      Top = 49
      Width = 50
      Height = 13
      Caption = 'Baud Rate'
    end
    object Label3: TLabel
      Left = 18
      Top = 75
      Width = 43
      Height = 13
      Caption = 'Data Bits'
    end
    object Label4: TLabel
      Left = 19
      Top = 104
      Width = 28
      Height = 13
      Caption = 'Parity'
    end
    object Label5: TLabel
      Left = 19
      Top = 130
      Width = 42
      Height = 13
      Caption = 'Stop Bits'
    end
    object cmbPort: TComboBox
      Left = 113
      Top = 20
      Width = 89
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = cmbPortChange
      Items.Strings = (
        'Com1'
        'Com2'
        'Com3'
        'Com4'
        'Com5')
    end
    object cmbBaudRate: TComboBox
      Left = 113
      Top = 46
      Width = 89
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = cmbBaudRateChange
      Items.Strings = (
        '4800'
        '9600'
        '19200'
        '38400')
    end
    object cmbDataBits: TComboBox
      Left = 113
      Top = 72
      Width = 89
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = cmbDataBitsChange
      Items.Strings = (
        '5'
        '6'
        '7'
        '8')
    end
    object cmbParity: TComboBox
      Left = 113
      Top = 98
      Width = 89
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      OnChange = cmbParityChange
      Items.Strings = (
        'NONE'
        'ODD'
        'EVEN'
        ''
        '')
    end
    object cmbStopBits: TComboBox
      Left = 113
      Top = 124
      Width = 89
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnChange = cmbStopBitsChange
      Items.Strings = (
        '1'
        '1.5'
        '2')
    end
    object cmbFlowControl: TComboBox
      Left = 113
      Top = 151
      Width = 89
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      OnChange = cmbFlowControlChange
      Items.Strings = (
        'HARDWARE'
        'SOFTWARE'
        'NONE'
        'CUSTOM')
    end
  end
end
