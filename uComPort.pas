unit uComPort;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  UITypes, Registry;

type
  TfrmComPort = class(TFrame)
    gbxComPort: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cmbPort: TComboBox;
    cmbBaudRate: TComboBox;
    cmbDataBits: TComboBox;
    cmbParity: TComboBox;
    cmbStopBits: TComboBox;
    cmbFlowControl: TComboBox;
    procedure cmbPortChange(Sender: TObject);
    procedure cmbBaudRateChange(Sender: TObject);
    procedure cmbDataBitsChange(Sender: TObject);
    procedure cmbParityChange(Sender: TObject);
    procedure cmbStopBitsChange(Sender: TObject);
    procedure cmbFlowControlChange(Sender: TObject);
  private
    FBaudRate: string;
    FParity: string;
    FStopBits: string;
    FPort: string;
    FFlowControl: string;
    FDataBits: string;
    procedure GetCommList;
    procedure SetBaudRate(const Value: string);
    procedure SetDataBits(const Value: string);
    procedure SetFlowControl(const Value: string);
    procedure SetParity(const Value: string);
    procedure SetPort(const Value: string);
    procedure SetStopBits(const Value: string);
    { Private êÈåæ }
  public
    { Public êÈåæ }
    property BaudRate: string read FBaudRate write SetBaudRate;
    property DataBits: string read FDataBits write SetDataBits;
    property FlowControl: string read FFlowControl write SetFlowControl;
    property Parity: string read FParity write SetParity;
    property Port: string read FPort write SetPort;
    property StopBits: string read FStopBits write SetStopBits;
    procedure SetEnabled(value: boolean);
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

constructor TfrmComPort.Create(Owner: TComponent);
begin
  inherited;
  GetCommList;
end;

destructor TfrmComPort.Destroy;
begin

  inherited;
end;

procedure TfrmComPort.GetCommList();
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

procedure TfrmComPort.SetBaudRate(const Value: string);
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

procedure TfrmComPort.SetDataBits(const Value: string);
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

procedure TfrmComPort.SetEnabled(value: boolean);
var
  i: integer;
  ctl: TControl;
begin
  Enabled := value;
  for i := 0 to gbxComPort.ControlCount - 1 do
    gbxComPort.Controls[i].Enabled := value;
end;

procedure TfrmComPort.SetFlowControl(const Value: string);
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

procedure TfrmComPort.SetParity(const Value: string);
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

procedure TfrmComPort.SetPort(const Value: string);
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

procedure TfrmComPort.SetStopBits(const Value: string);
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

procedure TfrmComPort.cmbBaudRateChange(Sender: TObject);
begin
  FBaudRate := cmbBaudRate.Text;
end;

procedure TfrmComPort.cmbDataBitsChange(Sender: TObject);
begin
  FDataBits := cmbDataBits.Text;
end;

procedure TfrmComPort.cmbFlowControlChange(Sender: TObject);
begin
  FFlowControl  :=  cmbFlowControl.Text;
end;

procedure TfrmComPort.cmbParityChange(Sender: TObject);
begin
  FParity := cmbParity.Text;
end;

procedure TfrmComPort.cmbPortChange(Sender: TObject);
begin
  FPort :=  cmbPort.Text;
end;

procedure TfrmComPort.cmbStopBitsChange(Sender: TObject);
begin
  FStopBits := cmbStopBits.Text;
end;

end.
