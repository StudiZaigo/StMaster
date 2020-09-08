unit uRelayBox;

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

    procedure DoCmd(Cmd: string);
    procedure DoDoCmd(Cmd: string; recursive: boolean);
    function GetBaudRate: string;
    function GetDataBits: string;
    function GetFlowControl: string;
    function GetParity: string;
    function GetPort: string;
    function GetRelay(Index: integer): boolean;
    function GetStopBits: string;
    procedure SetAvtive(const Value: boolean);
    procedure SetBaudRate(const Value: string);
    procedure SetDataBits(const Value: string);
    procedure SetFlowControl(const Value: string);
    procedure SetParity(const Value: string);
    procedure SetPort(const Value: string);
    procedure SetRelay(Index: integer; const Value: boolean);
    procedure SetStopBits(const Value: string);
    procedure SetEnable(const Value: boolean);
    function MakeSendMess: string;
  public
    property Active: boolean read FActive write SetAvtive;
    property Count: Integer read FCount;
    property Enable: boolean read FEnable write SetEnable;
    property Relay[Index: integer]: boolean read GetRelay write SetRelay;
    property ChangeRelays: TChangeRelaysEvent read FChangeRelays write FChangeRelays;
    property ChangeRelay: TChangeRelayEvent read FChangeRelay write FChangeRelay;
    // RS232関連
    property BaudRate: string read GetBaudRate write SetBaudRate;
    property DataBits: string read GetDataBits write SetDataBits;
    property FlowControl: string read GetFlowControl write SetFlowControl;
    property Parity: string read GetParity write SetParity;
    property Port: string read GetPort write SetPort;
    property StopBits: string read GetStopBits write SetStopBits;

    constructor Create(Owner: TComponent; Count: integer);
    destructor Destroy; override;
    procedure Open();
    procedure Close();

  end;

implementation

{ TRelayBox }

constructor TRelayBox.Create(Owner: TComponent; Count: integer);
var
  i: integer;
begin
  inherited Create(Owner);
  FActive := false;
  FCount  := Count;
  SetLength(FRelay, Count);
  for i := Low(FRelay) to High(FRelay) do
    FRelay[i] := false;
end;

destructor TRelayBox.Destroy;
begin
  inherited;
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
  s,s1, s2,sz: string;
begin
  try
    s1  := Copy(s, 1, 1);
    s2  := Copy(s, 1, 4);
    if (s1 = 'Y') then
      begin
      TryStrToInt(Copy(s, 2, 1), j);
      if Copy(s, 3, 1) = '1' then
        b := true
      else
        b := false;
//      Relay.SetRelay(j - 1, b);
      ComPort.SendStr(s + #13);
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

procedure TRelayBox.Open;
begin
  if FEnable and not FActive then
    begin
    Comport.Delimiter   := #10;     // GS232用固定
    Comport.TriggersOnRxChar := false;
//  Comport.OnRecvMsg := GetDirectionOnRx;   // RTX-59,GS-232共通化するため使わない
//  Comport.OnException  := ComException;
//  ComPort.OnError      := ComError;
    ComPort.Open;
    ComPort.Clear;
    FActive := true;
    end;
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
  ComPort.BaudRate := Value;
end;

procedure TRelayBox.SetDataBits(const Value: string);
begin
  ComPort.DataBits := Value;
end;

procedure TRelayBox.SetEnable(const Value: boolean);
begin
  if not FActive then
    FEnable := Value;
end;

procedure TRelayBox.SetFlowControl(const Value: string);
begin
  ComPort.FlowControl := Value;
end;

procedure TRelayBox.SetParity(const Value: string);
begin
  ComPort.Parity := Value;
end;

procedure TRelayBox.SetPort(const Value: string);
begin
  ComPort.Port := Value;
end;

procedure TRelayBox.SetRelay(Index: integer; const Value: boolean);
begin
  if not FActive  then
    exit;
  if (Index < Low(FRelay)) or (Index > High(FRelay)) then
    exit;

  if Value <> Relay[Index] then
    begin
    FRelay[Index] := value;
    if Assigned(FChangeRelay) then
      FChangeRelay(self, Index, Value);
    if Assigned(FChangeRelays) then
      FChangeRelays(self);
    end;
end;

procedure TRelayBox.SetStopBits(const Value: string);
begin
  ComPort.StopBits := Value;
end;

function TRelayBox.MakeSendMess: string;
var
  i: integer;
  b: byte;
begin
  b := 0;
  for i := 0 to 7 do
    begin
    b :=  b shl 1;
    if FRelay[i] then
      b := b or 1;
    end;
  result := chr(b);
end;

end.
