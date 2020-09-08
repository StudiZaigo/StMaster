unit uOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, UITypes,
  Registry, Vcl.ExtDlgs,
  MidasLib, uComPort;

//**********************************************************************//
//                                                                      //
//  例外通知用のクラス                                                  //
//                                                                      //
//**********************************************************************//
type
  EAppError = class(Exception);

type
  TOptionComPort = class(TComponent)
  private
    procedure SetBaudRate(const Value: string);
    procedure SetDataBits(const Value: string);
    procedure SetFlowControl(const Value: string);
    procedure SetParity(const Value: string);
    procedure SetPort(const Value: string);
    procedure SetStopBits(const Value: string);
    function GetBaudRate: string;
    function GetDataBits: string;
    function GetFlowControl: string;
    function GetParity: string;
    function GetPort: string;
    function GetStopBits: string;
  public
    { Public 宣言 }
    frmComPort: TfrmComPort;
    property BaudRate: string read GetBaudRate write SetBaudRate;
    property DataBits: string read GetDataBits write SetDataBits;
    property FlowControl: string read GetFlowControl write SetFlowControl;
    property Parity: string read GetParity write SetParity;
    property Port: string read GetPort write SetPort;
    property StopBits: string read GetStopBits write SetStopBits;
  end;

type
  TRelaySet = class(TComponent)
  private
    FOptionComPort: TOptionComPort;
    FCount: integer;
    FEnable: boolean;
    FMode: string;
    FSerialNo: string;
    procedure SetOptionComPort(const Value: TOptionComPort);
    procedure SetEnable(const Value: boolean);
    procedure SetCount(const Value: integer);
    procedure SetMode(const Value: string);
    procedure SetSerialNo(const Value: string);
  public
    GroupBox: TGroupBox;
    property Enable: boolean read FEnable write SetEnable;
    property Mode: string read FMode write SetMode;
    property SerialNo: string read FSerialNo write SetSerialNo;
    property Count: integer read FCount write SetCount;
    property OptionComPort: TOptionComPort read FOptionComPort write SetOptionComPort;

    constructor Create(Owner: TComponent); override;
  end;

type
  TOptions = class(TForm)
    btnAdd: TButton;
    btnApply: TButton;
    btnApply2: TButton;
    btnCancel: TButton;
    btnCancel2: TButton;
    btnDelete: TButton;
    btnFileSelect: TButton;
    btnGetHomePosition: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;

    cbxAutoActive: TCheckBox;
    cbxCtrlTable: TCheckBox;
    cbxEnable: TCheckBox;
    cbxRelayBox1_Enable: TCheckBox;
    cbxRelayBox2_Enable: TCheckBox;
    cbxReturnHome: TCheckBox;

    ClientDataSet1: TClientDataSet;
    ClientDataSet1Command1: TStringField;
    ClientDataSet1Command2: TStringField;
    ClientDataSet1LowerFreq: TFloatField;
    ClientDataSet1Offset: TIntegerField;
    ClientDataSet1Order: TSmallintField;
    ClientDataSet1Rotator: TIntegerField;
    ClientDataSet1Title: TStringField;
    ClientDataSet1UpperFreq: TFloatField;

    cmbAzimuthAngle: TComboBox;
    cmbBaudRate: TComboBox;
    cmbCenterPosition: TComboBox;
    cmbDataBits: TComboBox;
    cmbFlowControl: TComboBox;
    cmbModel: TComboBox;
    cmbParity: TComboBox;
    cmbPort: TComboBox;
    cmbRelayBox1_Mode: TComboBox;
    cmbRelayBox1_RelaysCount: TComboBox;
    cmbRelayBox1_SerialNo: TComboBox;
    cmbRelayBox2_Mode: TComboBox;
    cmbRelayBox2_RelaysCount: TComboBox;
    cmbRelayBox2_SerialNo: TComboBox;
    cmbRelaysCount: TComboBox;
    cmbRotationSpeed: TComboBox;
    cmbStopBits: TComboBox;

    DataSource1: TDataSource;
    DBGrid1: TDBGrid;

    edtCommandA: TEdit;
    edtCommandB: TEdit;
    edtHomePosition: TEdit;
    edtMapFileName: TEdit;
    edtOffsetAngle: TEdit;
    edtTitle: TEdit;

    frmComPort1: TfrmComPort;
    frmComPort2: TfrmComPort;
    gbxRelayBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    gbxRelayBox2: TGroupBox;

    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblRelayBox1_RelaysCount: TLabel;
    lblRelayBox1_SerialNo: TLabel;
    lblRelayBox2_RelaysCount: TLabel;
    lblRelayBox2_SerialNo: TLabel;

    OpenDialog1: TOpenDialog;

    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;

    tabRelayBox: TTabSheet;
    tabRotator: TTabSheet;
    tabTable: TTabSheet;

    procedure FormCreate(Sender: TObject);
    procedure btnGetHomePositionClick(Sender: TObject);
    procedure edtTitleChange(Sender: TObject);
    procedure cmbModelChange(Sender: TObject);
    procedure cmbCenterPositionChange(Sender: TObject);
    procedure cmbAzimuthAngleChange(Sender: TObject);
    procedure cmbRotationSpeedChange(Sender: TObject);
    procedure edtHomePositionChange(Sender: TObject);
    procedure cbxReturnHomeClick(Sender: TObject);
    procedure edtOffsetAngleChange(Sender: TObject);
    procedure cmbPortChange(Sender: TObject);
    procedure cmbBaudRateChange(Sender: TObject);
    procedure cmbDataBitsChange(Sender: TObject);
    procedure cmbParityChange(Sender: TObject);
    procedure cmbStopBitsChange(Sender: TObject);
    procedure cmbFlowControlChange(Sender: TObject);
    procedure cbxAutoActiveClick(Sender: TObject);
    procedure btnFileSelectClick(Sender: TObject);
    procedure edtCommandBChange(Sender: TObject);
    procedure edtCommandAChange(Sender: TObject);
    procedure cbxEnableClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure cbxCtrlTableClick(Sender: TObject);
    procedure cmbRelaysCountChange(Sender: TObject);
    procedure edtMapFileNameChange(Sender: TObject);
    procedure cbxRelayBox1_EnableClick(Sender: TObject);
    procedure cbxRelayBox2_EnableClick(Sender: TObject);
    procedure cmbRelayBox1_RelaysCountChange(Sender: TObject);
    procedure cmbRelayBox2_RelaysCountChange(Sender: TObject);
    procedure cmbRelayBox1_ModeChange(Sender: TObject);
    procedure cmbRelayBox2_ModeChange(Sender: TObject);
    procedure cmbRelayBox1_SerialNoChange(Sender: TObject);
    procedure cmbRelayBox2_SerialNoChange(Sender: TObject);
    procedure cmbRelayBox1_ModeCloseUp(Sender: TObject);
    procedure cmbRelayBox2_ModeCloseUp(Sender: TObject);

  private
    { Private 宣言 }
    CtlTableName: string;

    FAzimuthAngle: Integer;
    FModel: string;
    FBaudRate: string;
    FStopBits: string;
    FPort: string;
    FReturnHome: boolean;
    FHomePosition: integer;
    FCenterPosition: Integer;
    FFlowControl: string;
    FDataBits: string;
    FParity: string;
    FOffsetAngle: Integer;
    FRotationSpeed: string;
    FCurrentPosition: integer;
    FCommandB: string;
    FCommandA: string;
    FTitle: string;
    FMapFileName: string;
    FAutoActive: boolean;
    FEnable: boolean;
    FCtrlTable: boolean;
    FRelaysCount: Integer;
    FRelaySet: array[0..1] of TRelaySet;
    FSerialNo: string;

    procedure GetCommList();
    procedure SetAutoActive(const Value: boolean);
    procedure SetAzimuthAngle(const Value: Integer);
    procedure SetBaudRate(const Value: string);
    procedure SetTitle(const Value: string);
    procedure SetCenterPosition(const Value: Integer);
    procedure SetEnable(const Value: boolean);
    procedure SetFlowControl(const Value: string);
    procedure SetHomePosition(const Value: integer);
    procedure SetModel(const Value: string);
    procedure SetOffsetAngle(const Value: Integer);
    procedure SetParity(const Value: string);
    procedure SetPort(const Value: string);
    procedure SetReturnHome(const Value: boolean);
    procedure SetRotatinSpeed(const Value: string);
    procedure SetStopBits(const Value: string);
    procedure SetCurrentPosition(const Value: integer);
    procedure SetMapFileName(const Value: string);
    procedure SetCommandA(const Value: string);
    procedure SetCommandB(const Value: string);
    procedure SetDataBits(const Value: string);
    procedure SetCtrlTable(const Value: boolean);
    procedure SetRelaysCount(const Value: Integer);
    procedure SetRelay(Index: integer; const Value: TRelaySet);
    function GetRelaySet(Index: integer): TRelaySet;
    procedure SetSerialNo(const Value: string);

  public
    { Public 宣言 }
    property ReturnHome: boolean read FReturnHome write SetReturnHome;
    property AzimuthAngle: Integer read FAzimuthAngle write SetAzimuthAngle;
    property BaudRate: string read FBaudRate write SetBaudRate;
    property CenterPosition: Integer read FCenterPosition write SetCenterPosition;
    property CurrentPosition: integer read FCurrentPosition write SetCurrentPosition;
    property DataBits: string read FDataBits write SetDataBits;
    property FlowControl: string read FFlowControl write SetFlowControl;
    property Model: string read FModel write SetModel;
    property Parity: string read FParity write SetParity;
    property Port: string read FPort write SetPort;
    property RotationSpeed: string read FRotationSpeed write SetRotatinSpeed;
    property StopBits: string read FStopBits write SetStopBits;
    property HomePosition: integer read FHomePosition write SetHomePosition;
    property OffsetAngle: Integer read FOffsetAngle write SetOffsetAngle;
    property CommandA: string read FCommandA write SetCommandA;
    property CommandB: string read FCommandB write SetCommandB;
    property Title: string read FTitle write SetTitle;
    property MapFileName: string read FMapFileName write SetMapFileName;
    property AutoActive: boolean read FAutoActive write SetAutoActive;
    Property Enable: boolean read FEnable write SetEnable;
    property SerialNo: string read FSerialNo write SetSerialNo;
    property RelaysCount: Integer read FRelaysCount write SetRelaysCount;
    property CtrlTableEnable: boolean read FCtrlTable write SetCtrlTable;
    property RelaySet[Index: integer]: TRelaySet read GetRelaySet write SetRelay;

    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Options: TOptions;

implementation

uses uMain;

{$R *.dfm}

constructor TOptions.Create(Owner: TComponent);
var
  i: integer;
begin
  inherited;
//  CtlTableName := ExtractFilePath(Application.ExeName) + 'CtrlTable.xml';
  CtlTableName := Main.CtrlName;
  if FileExists(CtlTableName) then
    begin
    ClientDataSet1.LoadFromFile(CtlTableName);
    ClientDataSet1.LogChanges := false;
    end;

  for i := 0 to 1 do
    FRelaySet[i] := TRelaySet.Create(self);
  RelaySet[0].GroupBox := gbxRelayBox1;
  RelaySet[1].GroupBox := gbxRelayBox2;
  RelaySet[0].OptionComPort.frmComPort := frmComPort1;
  RelaySet[1].OptionComPort.frmComPort := frmComPort2;
  cmbRelayBox1_Mode.Clear;
  cmbRelayBox1_Mode.Items.Add(cBigBang);
  cmbRelayBox1_Mode.Items.Add(cComPort);
  cmbRelayBox2_Mode.Items := cmbRelayBox1_Mode.Items

end;

destructor TOptions.Destroy;
begin
  inherited;
end;

procedure TOptions.cbxAutoActiveClick(Sender: TObject);
begin
  FAutoActive := cbxAutoActive.Checked;
end;

procedure TOptions.cbxCtrlTableClick(Sender: TObject);
begin
  FCtrlTable := cbxCtrlTable.Checked;
end;

procedure TOptions.cbxEnableClick(Sender: TObject);
begin
  FEnable := cbxEnable.Checked;
end;

procedure TOptions.cmbRelayBox1_ModeChange(Sender: TObject);
begin
  RelaySet[0].Mode := cmbRelayBox1_Mode.Text;
end;

procedure TOptions.cmbRelayBox1_ModeCloseUp(Sender: TObject);
begin
  if cmbRelayBox1_Mode.Text = cBIGBANG then
    begin
    lblRelayBox1_SerialNo.Visible := true;
    cmbRelayBox1_SerialNo.Visible := true;
    lblRelayBox1_RelaysCount.Visible := false;
    cmbRelayBox1_RelaysCount.Visible := false;
    frmComPort1.SetEnabled(false);
    end
  else
    begin
    lblRelayBox1_SerialNo.Visible := false;
    cmbRelayBox1_SerialNo.Visible := false;
    lblRelayBox1_RelaysCount.Visible := true;
    cmbRelayBox1_RelaysCount.Visible := true;
    frmComPort1.SetEnabled(true);
    end;
end;

procedure TOptions.cmbRelayBox1_RelaysCountChange(Sender: TObject);
begin
  RelaySet[0].Count := StrToInt(cmbRelayBox1_RelaysCount.Text);
end;

procedure TOptions.cmbRelayBox1_SerialNoChange(Sender: TObject);
begin
  RelaySet[0].SerialNo := cmbRelayBox1_SerialNo.Text;
end;

procedure TOptions.cmbRelayBox2_ModeChange(Sender: TObject);
begin
  RelaySet[1].Mode := cmbRelayBox2_Mode.Text;
end;

procedure TOptions.cmbRelayBox2_ModeCloseUp(Sender: TObject);
begin
  if cmbRelayBox2_Mode.Text = cBIGBANG then
    begin
    lblRelayBox2_SerialNo.Visible := true;
    cmbRelayBox2_SerialNo.Visible := true;
    lblRelayBox2_RelaysCount.Visible := false;
    cmbRelayBox2_RelaysCount.Visible := false;
    frmComPort2.SetEnabled(false);
    end
  else
    begin
    lblRelayBox2_SerialNo.Visible := false;
    cmbRelayBox2_SerialNo.Visible := false;
    lblRelayBox2_RelaysCount.Visible := true;
    cmbRelayBox2_RelaysCount.Visible := true;
    frmComPort2.SetEnabled(true);
    end;
end;

procedure TOptions.cmbRelayBox2_RelaysCountChange(Sender: TObject);
begin
  RelaySet[1].Count := StrToInt(cmbRelayBox2_RelaysCount.Text);
end;

procedure TOptions.cmbRelayBox2_SerialNoChange(Sender: TObject);
begin
  RelaySet[1].SerialNo := cmbRelayBox2_SerialNo.Text;
end;

procedure TOptions.cmbRelaysCountChange(Sender: TObject);
begin
  TryStrToInt(cmbRelaysCount.Text, FRelaysCount);
end;

procedure TOptions.cbxRelayBox1_EnableClick(Sender: TObject);
begin
  RelaySet[0].Enable := cbxRelayBox1_Enable.Checked;
end;

procedure TOptions.cbxRelayBox2_EnableClick(Sender: TObject);
begin
  RelaySet[1].Enable := cbxRelayBox2_Enable.Checked;
end;

procedure TOptions.cbxReturnHomeClick(Sender: TObject);
begin
  FReturnHome := cbxReturnHome.Checked;
end;

procedure TOptions.cmbAzimuthAngleChange(Sender: TObject);
begin
  FAzimuthAngle := cmbAzimuthAngle.ItemIndex;
end;

procedure TOptions.cmbBaudRateChange(Sender: TObject);
begin
  FBaudRate :=  cmbBaudRate.Text;
end;

procedure TOptions.cmbCenterPositionChange(Sender: TObject);
begin
  FCenterPosition :=  cmbCenterPosition.ItemIndex;
end;

procedure TOptions.cmbDataBitsChange(Sender: TObject);
begin
  FDataBits := cmbDataBits.Text;
end;

procedure TOptions.cmbFlowControlChange(Sender: TObject);
begin
  FFlowControl  :=  cmbFlowControl.Text;
end;

procedure TOptions.cmbModelChange(Sender: TObject);
begin
  FModel  := cmbModel.Text;
end;

procedure TOptions.cmbParityChange(Sender: TObject);
begin
  FParity := cmbParity.Text;
end;

procedure TOptions.cmbPortChange(Sender: TObject);
begin
  FPort :=  cmbPort.Text;
end;

procedure TOptions.cmbRotationSpeedChange(Sender: TObject);
begin
  FRotationSpeed  := IntToStr(cmbRotationSpeed.ItemIndex + 1);
end;

procedure TOptions.cmbStopBitsChange(Sender: TObject);
begin
  FStopBits := cmbStopBits.Text;
end;

procedure TOptions.edtCommandAChange(Sender: TObject);
begin
  FCommandA := edtCommandA.Text;
end;

procedure TOptions.edtCommandBChange(Sender: TObject);
begin
  FCommandB := edtCommandB.Text;
end;

procedure TOptions.edtHomePositionChange(Sender: TObject);
begin
  FHomePosition :=  StrToInt('0' + Trim(edtHomePosition.Text));
end;

procedure TOptions.edtMapFileNameChange(Sender: TObject);
begin
  FMapFileName  :=  edtMapFileName.Text;
end;

procedure TOptions.edtOffsetAngleChange(Sender: TObject);
begin
  if (edtOffsetAngle.Text = '') or (edtOffsetAngle.Text = '-') then
    FOffsetAngle := 0
  else
    FOffsetAngle := StrToInt(trim(edtOffsetAngle.Text));
end;

procedure TOptions.edtTitleChange(Sender: TObject);
begin
  FTitle  :=  edtTitle.Text;
end;

procedure TOptions.FormCreate(Sender: TObject);
begin
  Panel1.Caption := '';
  Panel2.Caption := '';
  Panel3.Caption := '';
  PageControl1.ActivePageIndex := 0;
  lblRelayBox1_SerialNo.Left  := lblRelayBox1_RelaysCount.Left;
  lblRelayBox1_SerialNo.Top   := lblRelayBox1_RelaysCount.Top;
  cmbRelayBox1_SerialNo.Left  := cmbRelayBox1_RelaysCount.Left;
  cmbRelayBox1_SerialNo.Top   := cmbRelayBox1_RelaysCount.Top;

  lblRelayBox2_SerialNo.Left  := lblRelayBox1_SerialNo.Left;
  lblRelayBox2_SerialNo.Top   := lblRelayBox1_SerialNo.Top;
  cmbRelayBox2_SerialNo.Left  := cmbRelayBox1_SerialNo.Left;
  cmbRelayBox2_SerialNo.Top   := cmbRelayBox1_SerialNo.Top;
  GetCommList();
end;

procedure TOptions.btnAddClick(Sender: TObject);
begin
  ClientDataSet1.Insert;
end;

procedure TOptions.btnApplyClick(Sender: TObject);
var
  i: integer;
begin
  i := 0;
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
    begin
    if (ClientDataSet1LowerFreq.AsFloat <> 0) or (ClientDataSet1UpperFreq.AsFloat <> 0) then
      begin
      ClientDataSet1.Edit;
      ClientDataSet1Order.AsInteger := i;
      ClientDataSet1.Post;
      inc(i);
      end;
    ClientDataSet1.Next;
    end;
  ClientDataSet1.MergeChangeLog;   // 要確認
  ClientDataSet1.SaveToFile(CtlTableName, dfXMLUTF8);
end;

procedure TOptions.btnDeleteClick(Sender: TObject);
begin
  ClientDataSet1.Delete;
end;

procedure TOptions.btnFileSelectClick(Sender: TObject);
begin
  edtMapFileName.text   := FMapFileName;
  OpenDialog1.FileName  := FMapFileName;
  if OpenDialog1.Execute()  then
    begin
    SetMapFilename(OpenDialog1.FileName);
    end;
end;

procedure TOptions.btnGetHomePositionClick(Sender: TObject);
begin
  SetHomePosition(FCurrentPosition);
end;

procedure TOptions.SetAutoActive(const Value: boolean);
begin
  FAutoActive := Value;
  cbxAutoActive.Checked := FAutoActive;
end;

procedure TOptions.SetAzimuthAngle(const Value: Integer);
begin
  cmbAzimuthAngle.ItemIndex := Value;
  FAzimuthAngle := Value;
end;

procedure TOptions.SetBaudRate(const Value: string);
var
  i: Integer;
  s: string;
begin
  s := UpperCase(Trim(Value));
  cmbBaudRate.ItemIndex := -1;
  for i := 0 to cmbBaudRate.Items.Count - 1 do
    begin
    if s = cmbBaudRate.Items.Strings[i] then
      begin
      cmbBaudRate.ItemIndex := i;
      Break;
      end;
    end;
  if cmbBaudRate.ItemIndex = -1 then
    begin
    MessageDlg('BaudRate can not be found', mtError, [mbOk], 0, mbOk);
    exit;
    end;
  FBaudRate := s;
end;

procedure TOptions.SetCenterPosition(const Value: integer);
begin
  cmbCenterPosition.ItemIndex := Value;
  FCenterPosition := Value;
end;

procedure TOptions.SetCommandA(const Value: string);
begin
  FCommandA := trim(Value);
  edtCommandA.text := FCommandA;
end;

procedure TOptions.SetCommandB(const Value: string);
begin
  FCommandB := trim(Value);
  edtCommandB.text := FCommandB;
end;

procedure TOptions.SetCtrlTable(const Value: boolean);
begin
  FCtrlTable := Value;
  cbxCtrlTable.Checked  := value;
end;

procedure TOptions.SetCurrentPosition(const Value: integer);
begin
  FCurrentPosition := Value;
end;

procedure TOptions.SetDataBits(const Value: string);
var
  i: Integer;
  s: string;
begin
  s := UpperCase(Trim(Value));
  cmbDataBits.ItemIndex := -1;
  for i := 0 to cmbDataBits.Items.Count - 1 do
    begin
    if s = cmbDataBits.Items.Strings[i] then
      begin
      cmbDataBits.ItemIndex := i;
      Break;
      end;
    end;
  if cmbDataBits.ItemIndex = -1 then
    begin
    MessageDlg('DataBits can not be found', mtError, [mbOk], 0, mbOk);
    exit;
    end;
  FDataBits := s;
end;

procedure TOptions.SetEnable(const Value: boolean);
begin
  FEnable := Value;
  cbxENable.Checked := FEnable;
end;

procedure TOptions.SetFlowControl(const Value: string);
var
  i: Integer;
  s: string;
begin
  s := UpperCase(Trim(Value));
  cmbFlowControl.ItemIndex := -1;
  for i := 0 to cmbFlowControl.Items.Count - 1 do
    begin
    if s = cmbFlowControl.Items.Strings[i] then
      begin
      cmbFlowControl.ItemIndex := i;
      Break;
      end;
    end;
  if cmbFlowControl.ItemIndex = -1 then
    begin
    MessageDlg('FlowControl can not be found', mtError, [mbOk], 0, mbOk);
    exit;
    end;
  FFlowControl := s;
end;

procedure TOptions.SetHomePosition(const Value: integer);
begin
  FHomePosition :=  Value;
  edtHomePosition.Text  :=  IntToStr(FHomePosition);
end;

procedure TOptions.SetMapFileName(const Value: string);
begin
  FMapfileName := Trim(Value);
  edtMapFileName.Text := FMapFileName;
end;

procedure TOptions.SetModel(const Value: string);
var
  i: Integer;
  s: string;
begin
  s := UpperCase(Trim(Value));
  cmbModel.ItemIndex := -1;
  for i := 0 to cmbModel.Items.Count - 1 do
    begin
    if s = cmbModel.Items.Strings[i] then
      begin
      cmbModel.ItemIndex := i;
      Break;
      end;
    end;
  if cmbModel.ItemIndex = -1 then
    begin
    MessageDlg('Model can not be found', mtError, [mbOk], 0, mbOk);
    exit;
    end;
  FModel := s;
end;

procedure TOptions.SetOffsetAngle(const Value: Integer);
begin
  FOffsetAngle  := value;
  edtOffsetAngle.Text := IntToStr(FOffsetAngle);
end;

procedure TOptions.SetParity(const Value: string);
var
  i: Integer;
  s: string;
begin
  s := UpperCase(Trim(Value));
  cmbParity.ItemIndex := -1;
  for i := 0 to cmbParity.Items.Count - 1 do
    begin
    if s = cmbParity.Items.Strings[i] then
      begin
      cmbParity.ItemIndex := i;
      Break;
      end;
    end;
  if cmbParity.ItemIndex = -1 then
    begin
    MessageDlg('Parity can not be found', mtError, [mbOk], 0, mbOk);
    exit;
    end;
  FParity := s;
end;

procedure TOptions.SetPort(const Value: string);
var
  i: Integer;
  s: string;
begin
  s := UpperCase(Trim(Value));
  cmbPort.ItemIndex := -1;
  for i := 0 to cmbPort.Items.Count - 1 do
    begin
    if s = cmbPort.Items.Strings[i] then
      begin
      cmbPort.ItemIndex := i;
      Break;
      end;
    end;
  if cmbPort.ItemIndex = -1 then
    begin
    cmbPort.ItemIndex := 0;
    exit;
    end;
  FPort := s;
end;

procedure TOptions.SetRelay(Index: integer; const Value: TRelaySet);
begin
  if not FEnable  then
    exit;
  if (Index < 0) or (Index > 1) then
    exit;
end;

procedure TOptions.SetRelaysCount(const Value: Integer);
var
  i: integer;
begin
  cmbRelaysCount.ItemIndex := -1;
  for i := 0 to cmbStopBits.Items.Count - 1 do
    begin
    if Value = StrToInt(cmbRelaysCount.Items.Strings[i]) then
      begin
      cmbRelaysCount.ItemIndex := i;
      Break;
      end;
    end;
  if cmbRelaysCount.ItemIndex = -1 then
    begin
    cmbRelaysCount.ItemIndex := 0;
    exit;
    end;
  FRelaysCount := Value;
end;

procedure TOptions.SetReturnHome(const Value: boolean);
begin
  FReturnHome := Value;
  cbxReturnHome.Checked := FReturnHome;
end;

procedure TOptions.SetRotatinSpeed(const Value: string);
var
  i: Integer;
  s: string;
const
  ErrMsg: string = 'Rotation speed can not be found';
begin
  if not tryStrToInt('0' + Trim(Value) , i) then
    begin
    MessageDlg(s, mtError, [mbOk], 0, mbOk);
    exit;
    end;
  if i >  cmbRotationSpeed.Items.Count then
    begin
    MessageDlg(s, mtError, [mbOk], 0, mbOk);
    exit;
    end;
  cmbRotationSpeed.ItemIndex := i - 1;
  FRotationSpeed := IntToStr(i);
end;

procedure TOptions.SetSerialNo(const Value: string);
begin
  FSerialNo := Value;

end;

procedure TOptions.SetStopBits(const Value: string);
var
  i: Integer;
  s: string;
begin
  s := UpperCase(Trim(Value));
  cmbStopBits.ItemIndex := -1;
  for i := 0 to cmbStopBits.Items.Count - 1 do
    begin
    if s = cmbStopBits.Items.Strings[i] then
      begin
      cmbStopBits.ItemIndex := i;
      Break;
      end;
    end;
  if cmbStopBits.ItemIndex = -1 then
    begin
    MessageDlg('StopBits can not be found', mtError, [mbOk], 0, mbOk);
    exit;
    end;
  FStopBits := s;
end;

procedure TOptions.SetTitle(const Value: string);
begin
  FTitle := Trim(Value);
  EdtTitle.Text :=  FTitle;
end;

procedure TOptions.GetCommList();
var
  i: integer;
begin
  with TRegistry.Create(KEY_READ) do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKey('HARDWARE\DEVICEMAP\SERIALCOMM', False) then
        begin;
        GetValueNames(cmbPort.Items);
        for i:=0 to cmbPort.items.count-1 do
          cmbPort.items[i]  :=  UpperCase(ReadString(cmbPort.items[i]));
        end;
    finally
      free;
    end;
end;

function TOptions.GetRelaySet(Index: integer): TRelaySet;
begin
  result := FRelaySet[Index];
end;

{ TOptionComPort }

function TOptionComPort.GetBaudRate: string;
begin
  result := frmComPort.BaudRate;
end;

function TOptionComPort.GetDataBits: string;
begin
  result := frmComPort.DataBits;
end;

function TOptionComPort.GetFlowControl: string;
begin
  result := frmComPort.FlowControl;
end;

function TOptionComPort.GetParity: string;
begin
  result := frmComPort.Parity;
end;

function TOptionComPort.GetPort: string;
begin
  result := frmComPort.Port;
end;

function TOptionComPort.GetStopBits: string;
begin
  result := frmComPort.StopBits;
end;

procedure TOptionComPort.SetBaudRate(const Value: string);
begin
  frmComPort.BaudRate := Value;
end;

procedure TOptionComPort.SetDataBits(const Value: string);
begin
  frmComPort.DataBits := Value;
end;

procedure TOptionComPort.SetFlowControl(const Value: string);
begin
  frmComPort.FlowControl := Value;
end;

procedure TOptionComPort.SetParity(const Value: string);
begin
  frmComPort.Parity := Value;
end;

procedure TOptionComPort.SetPort(const Value: string);
begin
  frmComPort.Port := Value;
end;

procedure TOptionComPort.SetStopBits(const Value: string);
begin
  frmComPort.StopBits := Value;
end;

{ TRelayBox }

constructor TRelaySet.Create(Owner: TComponent);
begin
  inherited;
  FOptionComPort :=  TOptionComPort.Create(self);
end;

procedure TRelaySet.SetCount(const Value: integer);
var
  i: integer;
  ComboBox: TComboBox;
begin
  FCount := Value;
  ComboBox := TComboBox(GroupBox.FindChildControl('cmbRelayBox1_RelaysCount'));
  if ComboBox = nil then
    ComboBox := TComboBox(GroupBox.FindChildControl('cmbRelayBox2_RelaysCount'));
  if ComboBox <> nil then
    begin
    ComboBox.ItemIndex := -1;
    for i := 0 to ComboBox.Items.Count - 1 do
      begin
      if Value = StrToInt(ComboBox.Items.Strings[i]) then
        begin
        ComboBox.ItemIndex := i;
        Break;
        end;
      end;
    if ComboBox.ItemIndex = -1 then
      begin
      MessageDlg('StopBits can not be found', mtError, [mbOk], 0, mbOk);
      exit;
      end;
    end;
end;

procedure TRelaySet.SetEnable(const Value: boolean);
var
  CheckBox: TCheckBox;
begin
  FEnable := Value;
  CheckBox := TCheckBox(GroupBox.FindChildControl('cbxRelayBox1_Enable'));
  if CheckBox = nil then
    CheckBox := TCheckBox(GroupBox.FindChildControl('cbxRelayBox2_Enable'));
  if CheckBox <> nil then
    CheckBox.Checked := Value;
end;

procedure TRelaySet.SetMode(const Value: string);
var
  i: integer;
  ComboBox: TComboBox;
begin
  FMode := Value;
  ComboBox := TComboBox(GroupBox.FindChildControl('cmbRelayBox1_Mode'));
  if ComboBox = nil then
    ComboBox := TComboBox(GroupBox.FindChildControl('cmbRelayBox2_Mode'));
  if ComboBox <> nil then
    for i := 0 to ComboBox.Items.Count - 1 do
      if Value = ComboBox.Items[i] then
        begin
        ComboBox.ItemIndex := i;

        ComboBox.OnCloseUp(ComboBox);
        break;
        end;
end;

procedure TRelaySet.SetOptionComPort(const Value: TOptionComPort);
begin
  FOptionComPort := Value;
end;

procedure TRelaySet.SetSerialNo(const Value: string);
var
  i: integer;
  ComboBox: TComboBox;
begin
  FSerialNo := Value;
  ComboBox := TComboBox(GroupBox.FindChildControl('cmbRelayBox1_SerialNo'));
  if ComboBox = nil then
    ComboBox := TComboBox(GroupBox.FindChildControl('cmbRelayBox2_SerialNo'));
  if ComboBox <> nil then
    for i := 0 to ComboBox.Items.Count - 1 do
      if Value = ComboBox.Items[i] then
        begin
        ComboBox.ItemIndex := i;
        break;
        end;
end;

end.


