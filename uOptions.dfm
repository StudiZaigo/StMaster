object Options: TOptions
  Left = 746
  Top = 215
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 409
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = '@MS UI Gothic'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 641
    Height = 409
    ActivePage = tabRelayBox
    TabOrder = 0
    object tabRotator: TTabSheet
      Caption = 'Rotator'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 633
        Height = 380
        Align = alClient
        Caption = 'Panel1'
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 0
        object Label9: TLabel
          Left = 14
          Top = 15
          Width = 26
          Height = 13
          Caption = 'Title'
        end
        object Label11: TLabel
          Left = 14
          Top = 41
          Width = 43
          Height = 13
          Caption = 'Map file'
        end
        object edtTitle: TEdit
          Left = 46
          Top = 12
          Width = 86
          Height = 21
          TabOrder = 0
          Text = 'Rotater_1'
          OnChange = edtTitleChange
        end
        object edtMapFileName: TEdit
          Left = 63
          Top = 40
          Width = 319
          Height = 21
          TabOrder = 1
          Text = 'MapFileName'
          OnChange = edtMapFileNameChange
        end
        object btnFileSelect: TButton
          Left = 388
          Top = 25
          Width = 65
          Height = 33
          Caption = #12539#12539#12539
          TabOrder = 2
          OnClick = btnFileSelectClick
        end
        object btnCancel: TButton
          Left = 469
          Top = 25
          Width = 65
          Height = 33
          Caption = 'Cancel'
          ModalResult = 2
          TabOrder = 3
        end
        object btnApply: TButton
          Left = 552
          Top = 25
          Width = 65
          Height = 33
          Caption = 'Apply'
          ModalResult = 1
          TabOrder = 4
          OnClick = btnApplyClick
        end
        object cbxEnable: TCheckBox
          Left = 14
          Top = 67
          Width = 70
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Enable'
          TabOrder = 5
          OnClick = cbxEnableClick
        end
        object cbxAutoActive: TCheckBox
          Left = 117
          Top = 67
          Width = 171
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Automatic Open on Startup'
          TabOrder = 6
          OnClick = cbxAutoActiveClick
        end
        object GroupBox2: TGroupBox
          Left = 14
          Top = 90
          Width = 573
          Height = 263
          Caption = 'Rotator'
          TabOrder = 7
          object Label12: TLabel
            Left = 25
            Top = 129
            Width = 82
            Height = 13
            Caption = 'Home Position'
          end
          object Label15: TLabel
            Left = 25
            Top = 103
            Width = 86
            Height = 13
            Caption = 'Rotation Speed'
          end
          object Label7: TLabel
            Left = 27
            Top = 50
            Width = 90
            Height = 13
            Caption = 'Center Position'
          end
          object Label13: TLabel
            Left = 25
            Top = 76
            Width = 81
            Height = 13
            Caption = 'Azimuth Angle'
          end
          object Label8: TLabel
            Left = 27
            Top = 181
            Width = 70
            Height = 13
            Caption = 'Offset Angle'
          end
          object Label10: TLabel
            Left = 22
            Top = 19
            Width = 33
            Height = 13
            Caption = 'Model'
          end
          object Label14: TLabel
            Left = 27
            Top = 208
            Width = 113
            Height = 13
            BiDiMode = bdRightToLeft
            Caption = 'Command on before'
            ParentBiDiMode = False
          end
          object Label16: TLabel
            Left = 27
            Top = 229
            Width = 104
            Height = 13
            Caption = 'Command on after'
          end
          object Label17: TLabel
            Left = 337
            Top = 33
            Width = 75
            Height = 13
            Caption = 'Relays Count'
          end
          object edtHomePosition: TEdit
            Left = 121
            Top = 127
            Width = 89
            Height = 21
            Alignment = taRightJustify
            TabOrder = 4
            Text = '0'
            OnChange = edtHomePositionChange
          end
          object cbxReturnHome: TCheckBox
            Left = 25
            Top = 150
            Width = 208
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Return Home Position on Close'
            TabOrder = 5
            OnClick = cbxReturnHomeClick
          end
          object btnGetHomePosition: TButton
            Left = 216
            Top = 116
            Width = 73
            Height = 28
            Hint = 'Set Home position to Current position'
            Caption = 'Get Home'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = btnGetHomePositionClick
          end
          object cmbRotationSpeed: TComboBox
            Left = 121
            Top = 102
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 3
            OnChange = cmbRotationSpeedChange
            Items.Strings = (
              'Low'
              'Middle1'
              'Middle2'
              'High')
          end
          object cmbCenterPosition: TComboBox
            Left = 121
            Top = 50
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 1
            OnChange = cmbCenterPositionChange
            Items.Strings = (
              'North'
              'South')
          end
          object cmbAzimuthAngle: TComboBox
            Left = 121
            Top = 76
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 2
            OnChange = cmbAzimuthAngleChange
            Items.Strings = (
              '360'#176
              '450'#176)
          end
          object edtOffsetAngle: TEdit
            Left = 121
            Top = 177
            Width = 89
            Height = 21
            Alignment = taRightJustify
            TabOrder = 7
            Text = '0'
            OnChange = edtOffsetAngleChange
          end
          object cmbModel: TComboBox
            Left = 120
            Top = 16
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 0
            OnChange = cmbModelChange
            Items.Strings = (
              'GS-232A'
              'GS-232B'
              'RTC-59')
          end
          object edtCommandB: TEdit
            Left = 146
            Top = 204
            Width = 143
            Height = 21
            Alignment = taRightJustify
            BiDiMode = bdRightToLeft
            ParentBiDiMode = False
            TabOrder = 8
            OnChange = edtCommandBChange
          end
          object edtCommandA: TEdit
            Left = 146
            Top = 227
            Width = 143
            Height = 21
            Alignment = taRightJustify
            BiDiMode = bdRightToLeft
            ParentBiDiMode = False
            TabOrder = 9
            OnChange = edtCommandAChange
          end
          object GroupBox3: TGroupBox
            Left = 320
            Top = 66
            Width = 234
            Height = 183
            Caption = ' Com Port '
            TabOrder = 10
            object Label1: TLabel
              Left = 19
              Top = 23
              Width = 25
              Height = 13
              Caption = 'Port'
            end
            object Label6: TLabel
              Left = 19
              Top = 156
              Width = 72
              Height = 13
              Caption = 'Flow Control'
            end
            object Label2: TLabel
              Left = 19
              Top = 49
              Width = 57
              Height = 13
              Caption = 'Baud Rate'
            end
            object Label3: TLabel
              Left = 18
              Top = 75
              Width = 51
              Height = 13
              Caption = 'Data Bits'
            end
            object Label4: TLabel
              Left = 19
              Top = 104
              Width = 33
              Height = 13
              Caption = 'Parity'
            end
            object Label5: TLabel
              Left = 19
              Top = 130
              Width = 52
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
          object cmbRelaysCount: TComboBox
            Left = 437
            Top = 30
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 11
            OnChange = cmbRelaysCountChange
            Items.Strings = (
              '0'
              '4'
              '8')
          end
        end
      end
    end
    object tabRelayBox: TTabSheet
      Caption = 'RelayBox'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 633
        Height = 380
        Align = alClient
        Caption = 'Panel1'
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 0
        object Button1: TButton
          Left = 388
          Top = 25
          Width = 65
          Height = 33
          Caption = #12539#12539#12539
          TabOrder = 0
          OnClick = btnFileSelectClick
        end
        object Button2: TButton
          Left = 469
          Top = 25
          Width = 65
          Height = 33
          Caption = 'Cancel'
          ModalResult = 2
          TabOrder = 1
        end
        object Button3: TButton
          Left = 552
          Top = 25
          Width = 65
          Height = 33
          Caption = 'Apply'
          ModalResult = 1
          TabOrder = 2
          OnClick = btnApplyClick
        end
        object gbxRelayBox1: TGroupBox
          Left = 30
          Top = 70
          Width = 275
          Height = 287
          Caption = 'RelayBox1'
          TabOrder = 3
          object lblRelayBox1_RelaysCount: TLabel
            Left = 37
            Top = 68
            Width = 75
            Height = 13
            Caption = 'Relays Count'
          end
          object Label19: TLabel
            Left = 37
            Top = 42
            Width = 30
            Height = 13
            Caption = 'Mode'
          end
          object lblRelayBox1_SerialNo: TLabel
            Left = 83
            Top = 15
            Width = 54
            Height = 13
            Caption = 'Serial No.'
          end
          object cmbRelayBox1_RelaysCount: TComboBox
            Left = 137
            Top = 65
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 3
            OnChange = cmbRelayBox1_RelaysCountChange
            Items.Strings = (
              '0'
              '4'
              '8')
          end
          object cbxRelayBox1_Enable: TCheckBox
            Left = 37
            Top = 19
            Width = 70
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Enable'
            TabOrder = 0
            OnClick = cbxRelayBox1_EnableClick
          end
          inline frmComPort1: TfrmComPort
            Left = 9
            Top = 87
            Width = 257
            Height = 193
            TabOrder = 4
            ExplicitLeft = 9
            ExplicitTop = 87
            ExplicitWidth = 257
            ExplicitHeight = 193
            inherited gbxComPort: TGroupBox
              Left = 12
              Top = 0
              ExplicitLeft = 12
              ExplicitTop = 0
              inherited Label1: TLabel
                Width = 25
                ExplicitWidth = 25
              end
              inherited Label6: TLabel
                Width = 72
                ExplicitWidth = 72
              end
              inherited Label2: TLabel
                Width = 57
                ExplicitWidth = 57
              end
              inherited Label3: TLabel
                Width = 51
                ExplicitWidth = 51
              end
              inherited Label4: TLabel
                Width = 33
                ExplicitWidth = 33
              end
              inherited Label5: TLabel
                Width = 52
                ExplicitWidth = 52
              end
            end
          end
          object cmbRelayBox1_Mode: TComboBox
            Left = 137
            Top = 39
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 1
            OnChange = cmbRelayBox1_ModeChange
            OnCloseUp = cmbRelayBox1_ModeCloseUp
            Items.Strings = (
              'BigBang'
              'Com'
              '')
          end
          object cmbRelayBox1_SerialNo: TComboBox
            Left = 183
            Top = 12
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 2
            OnChange = cmbRelayBox1_SerialNoChange
          end
        end
        object gbxRelayBox2: TGroupBox
          Left = 326
          Top = 70
          Width = 275
          Height = 287
          Caption = 'RelayBox2'
          TabOrder = 4
          object lblRelayBox2_RelaysCount: TLabel
            Left = 37
            Top = 65
            Width = 75
            Height = 13
            Caption = 'Relays Count'
          end
          object Label20: TLabel
            Left = 37
            Top = 42
            Width = 30
            Height = 13
            Caption = 'Mode'
          end
          object lblRelayBox2_SerialNo: TLabel
            Left = 91
            Top = 15
            Width = 54
            Height = 13
            Caption = 'Serial No.'
          end
          object cmbRelayBox2_RelaysCount: TComboBox
            Left = 137
            Top = 65
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 3
            OnChange = cmbRelayBox2_RelaysCountChange
            Items.Strings = (
              '0'
              '4'
              '8')
          end
          object cbxRelayBox2_Enable: TCheckBox
            Left = 37
            Top = 19
            Width = 70
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Enable'
            TabOrder = 0
            OnClick = cbxRelayBox2_EnableClick
          end
          inline frmComPort2: TfrmComPort
            Left = 24
            Top = 87
            Width = 241
            Height = 193
            TabOrder = 4
            ExplicitLeft = 24
            ExplicitTop = 87
            ExplicitWidth = 241
            ExplicitHeight = 193
            inherited gbxComPort: TGroupBox
              Left = 3
              Top = 0
              Caption = 'Com Port '
              ExplicitLeft = 3
              ExplicitTop = 0
              inherited Label1: TLabel
                Width = 25
                ExplicitWidth = 25
              end
              inherited Label6: TLabel
                Width = 72
                ExplicitWidth = 72
              end
              inherited Label2: TLabel
                Width = 57
                ExplicitWidth = 57
              end
              inherited Label3: TLabel
                Width = 51
                ExplicitWidth = 51
              end
              inherited Label4: TLabel
                Width = 33
                ExplicitWidth = 33
              end
              inherited Label5: TLabel
                Width = 52
                ExplicitWidth = 52
              end
            end
          end
          object cmbRelayBox2_Mode: TComboBox
            Left = 137
            Top = 39
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 1
            OnChange = cmbRelayBox2_ModeChange
            OnCloseUp = cmbRelayBox2_ModeCloseUp
            Items.Strings = (
              'BigBang'
              'Com'
              '')
          end
          object cmbRelayBox2_SerialNo: TComboBox
            Left = 186
            Top = 12
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 2
            OnChange = cmbRelayBox2_SerialNoChange
          end
        end
      end
    end
    object tabTable: TTabSheet
      Caption = 'Table'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 633
        Height = 49
        Align = alTop
        Caption = 'Panel2'
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 0
        object btnCancel2: TButton
          Left = 479
          Top = 8
          Width = 65
          Height = 33
          Caption = 'Cancel'
          ModalResult = 2
          TabOrder = 0
        end
        object btnApply2: TButton
          Left = 556
          Top = 9
          Width = 65
          Height = 33
          Caption = 'Apply'
          ModalResult = 1
          TabOrder = 1
          OnClick = btnApplyClick
        end
        object btnAdd: TButton
          Left = 126
          Top = 10
          Width = 65
          Height = 33
          Caption = 'Add'
          TabOrder = 2
          OnClick = btnAddClick
        end
        object btnDelete: TButton
          Left = 211
          Top = 10
          Width = 65
          Height = 33
          Caption = 'Deleet'
          TabOrder = 3
          OnClick = btnDeleteClick
        end
        object cbxCtrlTable: TCheckBox
          Left = 18
          Top = 17
          Width = 70
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Enable'
          TabOrder = 4
          OnClick = cbxCtrlTableClick
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 49
        Width = 633
        Height = 331
        Align = alClient
        Caption = 'Panel3'
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 631
          Height = 329
          Align = alClient
          BorderStyle = bsNone
          Color = clGradientActiveCaption
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = SHIFTJIS_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = '@MS UI Gothic'
          TitleFont.Style = []
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Bmp file(*.Bmp)|*.Bmp'
    Title = 'Select Map File'
    Left = 240
    Top = 32
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'LowerFreq'
        DataType = ftFloat
      end
      item
        Name = 'UpperFreq'
        DataType = ftFloat
      end
      item
        Name = 'Rotater'
        DataType = ftInteger
      end
      item
        Name = 'Offset'
        DataType = ftInteger
      end
      item
        Name = 'Command1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Command2'
        DataType = ftSingle
      end>
    IndexDefs = <>
    IndexFieldNames = 'LowerFreq;UpperFreq'
    Params = <>
    StoreDefs = True
    Left = 288
    Top = 32
    object ClientDataSet1LowerFreq: TFloatField
      FieldName = 'LowerFreq'
    end
    object ClientDataSet1UpperFreq: TFloatField
      FieldName = 'UpperFreq'
    end
    object ClientDataSet1Rotator: TIntegerField
      Alignment = taCenter
      DisplayWidth = 5
      FieldName = 'Rotator'
    end
    object ClientDataSet1Offset: TIntegerField
      DisplayWidth = 5
      FieldName = 'Offset'
    end
    object ClientDataSet1Title: TStringField
      FieldName = 'Title'
      Size = 8
    end
    object ClientDataSet1Command1: TStringField
      DisplayWidth = 20
      FieldName = 'Command1'
      Size = 128
    end
    object ClientDataSet1Command2: TStringField
      DisplayWidth = 20
      FieldName = 'Command2'
      Size = 128
    end
    object ClientDataSet1Order: TSmallintField
      FieldName = 'Order'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 344
    Top = 32
  end
end
