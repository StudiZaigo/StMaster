unit RelayBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  CPortX;

type
  TChangeRelaysEvent  = procedure(Sender: TObject) of object;
  TChangeRelayEvent   = procedure(Sender: TObject; Index: Integer; State: boolean) of object;

type
  TRelayBox = class(TComponent)
  private
    ComPort: TCPortX;

    FActive: boolean;
    FEnable: boolean;
    FCount: Integer;
    FRelay: array of boolean;
    FChangeRelay: TChangeRelayEvent;
    FChangeRelays: TChangeRelaysEvent;
    FMode: string;
    FSerialNo: string;
    FBaudRate: string;
    FParity: string;
    FStopBits: string;
    FPort: string;
    FFlowControl: string;
    FDataBits: string;

    procedure DoDoCmd(Cmd: string; recursive: boolean);
    function GetBaudRate: string;
    function GetDataBits: string;
    function GetFlowControl: string;
    function GetParity: string;
    function GetPort: string;
    function GetRelay(Index: integer): boolean;
    function GetStopBits: string;
    function MakeSendMess: string;
    procedure SetAvtive(const Value: boolean);
    procedure SetBaudRate(const Value: string);
    procedure SetDataBits(const Value: string);
    procedure SetFlowControl(const Value: string);
    procedure SetParity(const Value: string);
    procedure SetPort(const Value: string);
    procedure SetRelay(Index: integer; const Value: boolean);
    procedure SetStopBits(const Value: string);
    procedure SetEnable(const Value: boolean);
    procedure SetCount(const Value: Integer);
    procedure SetMode(const Value: string);
    procedure SetSerialNo(const Value: string);
  public
    property Active: boolean read FActive write SetAvtive;
    property Count: Integer read FCount write SetCount;
    property Enable: boolean read FEnable write SetEnable;
    property Mode: string read FMode write SetMode;
    property SerialNo: string read FSerialNo write SetSerialNo;
    property Relay[Index: integer]: boolean read GetRelay write SetRelay;
    property ChangeRelays: TChangeRelaysEvent read FChangeRelays write FChangeRelays;
    property ChangeRelay: TChangeRelayEvent read FChangeRelay write FChangeRelay;
    // RS232関連
    property BaudRate: string read FBaudRate write SetBaudRate;
    property DataBits: string read FDataBits write SetDataBits;
    property FlowControl: string read FFlowControl write SetFlowControl;
    property Parity: string read FParity write SetParity;
    property Port: string read FPort write SetPort;
    property StopBits: string read FStopBits write SetStopBits;

    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure Open();
    procedure Close();
    procedure DoCmd(Cmd: string);
  end;

implementation

{ TRelayBox }

constructor TRelayBox.Create(Owner: TComponent);
begin
  inherited;
  ComPort := TCPortX.Create(self);

  FActive := false;
  FEnable := false;
  FMode   := 'Com';
  FCount  := 0;
  FChangeRelay  := nil;
  FChangeRelays := nil;
end;

destructor TRelayBox.Destroy;
begin
  if ComPort <> nil then
    FreeAndNil(ComPort);
  inherited;
end;

procedure TRelayBox.Open;
var
 a: ansistring;
begin
  if FEnable and not FActive then
    begin
    Comport.Delimiter   := #10;     // GS232用固定
    Comport.TriggersOnRxChar := false;
//  Comport.OnRecvMsg := GetDirectionOnRx;   // RTX-59,GS-232共通化するため使わない
//  Comport.OnException  := ComException;
//  ComPort.OnError      := ComError;

    ComPort.DataBits  := FDataBits;
    ComPort.BaudRate  := FBaudRate;
    ComPort.Parity    := FParity;
    ComPort.StopBits  := FStopBits;
    ComPort.Port      := FPort;
    ComPort.FlowControl := FFlowControl;

    ComPort.Open;
    ComPort.Clear;
    FActive := true;

    a := #3;
    Comport.Write(a,1);

    end;
end;

procedure TRelayBox.Close;
begin
  if FActive then
    begin
    ComPort.Clear;
    ComPort.Close;
    FActive := false;
    end;
end;

procedure TRelayBox.DoCmd(Cmd: string);          // Cmdの内容を解析しながら送る
begin
  if FActive then
    DoDoCmd(Cmd, true);
end;

procedure TRelayBox.DoDoCmd(Cmd: string; recursive: boolean);          // Cmdの内容を解析しながら送る
var
  b: boolean;
  i,j: integer;
  s1,s2,s3: string;
begin
  try
    s1  := Copy(Cmd, 1, 1);
    s2  := Copy(Cmd, 2, 1);
    s3  := Copy(Cmd, 3, 16);
    if (s1 = 'Y') then
      begin
      TryStrToInt(s2, i);
      TryStrToInt(s3, j);
      if s3 = '1' then
        b := true
      else
        b := false;
      SetRelay(i - 1, b);
      end;
  finally

  end;
end;

function TRelayBox.GetBaudRate: string;
begin
  result := Comport.BaudRate;
end;

function TRelayBox.GetDataBits: string;
begin
  result := ComPort.DataBits;
end;

function TRelayBox.GetFlowControl: string;
begin
  result := ComPort.FlowControl;
end;

function TRelayBox.GetParity: string;
begin
  result := ComPort.Parity;
end;

function TRelayBox.GetPort: string;
begin
  result := ComPort.Port;
end;

function TRelayBox.GetRelay(Index: integer): boolean;
begin
  if FEnable and (Index <= FCount) then
    result := FRelay[Index]
  else
    result := false;
end;

function TRelayBox.GetStopBits: string;
begin
  result := ComPort.StopBits;
end;


procedure TRelayBox.SetAvtive(const Value: boolean);
begin
  if Value <> FActive then
    if Value then
      Open
    else
      Close;
end;

procedure TRelayBox.SetBaudRate(const Value: string);
begin
  FBaudRate := Value;
//  ComPort.BaudRate := Value;
end;

procedure TRelayBox.SetCount(const Value: Integer);
var
  i: integer;
begin
  if not FActive then
    begin
    FCount := Value;
    SetLength(FRelay, Count);
    for i := Low(FRelay) to High(FRelay) do
      FRelay[i] := false;
    end;
end;

procedure TRelayBox.SetDataBits(const Value: string);
begin
  FDataBits := Value;
//  ComPort.DataBits := Value;
end;

procedure TRelayBox.SetEnable(const Value: boolean);
begin
  if not FActive then
    FEnable := Value;
end;

procedure TRelayBox.SetFlowControl(const Value: string);
begin
//  ComPort.FlowControl := Value;
  FFlowControl := Value;
end;

procedure TRelayBox.SetMode(const Value: string);
begin
  FMode := Value;
end;

procedure TRelayBox.SetParity(const Value: string);
begin
  FParity := Value;
//  ComPort.Parity := Value;
end;

procedure TRelayBox.SetPort(const Value: string);
begin
  FPort := Value;
//  ComPort.Port := Value;
end;

procedure TRelayBox.SetRelay(Index: integer; const Value: boolean);
var
  s: string;
  a: AnsiString;
begin
  if not FActive  then
    exit;
  if (Index < Low(FRelay)) or (Index > High(FRelay)) then
    exit;

  if Value <> Relay[Index] then
    begin
    FRelay[Index] := value;
    s := MakeSendMess;
//    ComPort.WriteStr(s);
//    a := AnsiString(s)+#0;

    a := #255 + #01 + #01;

    ComPort.Write(a, 3);
    if Assigned(FChangeRelay) then
      FChangeRelay(self, Index, Value);
    if Assigned(FChangeRelays) then
      FChangeRelays(self);
    end;
end;

procedure TRelayBox.SetSerialNo(const Value: string);
begin
  FSerialNo := Value;
end;

procedure TRelayBox.SetStopBits(const Value: string);
begin
  FStopBits := Value;
//  ComPort.StopBits := Value;
end;

function TRelayBox.MakeSendMess: string;
var
  i: integer;
  b: byte;
begin
  b := 0;
  for i := 7 Downto 0 do
    begin
    b :=  b shl 1;
    if FRelay[i] then
      b := b or 1;
    end;
  result := chr(b);
end;

end.
