unit StMasterOle;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, StMaster_TLB,
  uMain, Classes, SysUtils,
  Windows, System.Win.Registry;

type
  TRegAction =(raReg, raUnReg, raRegPerUser, raUnRegPerUser);

type
  TStMaster = class(TAutoObject, IStMaster)
  private
    function GetValue(Index: integer; Value: string): string;
  protected
    function Close(RotatorIndex: Integer): WordBool; stdcall;
    function Get_Enable: WordBool; safecall;
    function Get_RotatorCount: Integer; safecall;
    function Get_RotatorIndex: Integer; safecall;
    function GetRotatorActive(RotatorIndex: Integer): WordBool; stdcall;
    function GetRotatorAzumuth(RotatorIndex: Integer): Integer; stdcall;
    function Move(RotatorIndex: Integer; Azimuth: Integer): WordBool; stdcall;
    function Open(RotatorIndex: Integer): WordBool; stdcall;
    function Rotate(Azimuth: Integer; Freq: Single): WordBool; stdcall;
    procedure GetRotatorTitle(RotatorIndex: Integer; out GetRotatorTitle: WideString); safecall;
  public
  end;

implementation

uses ComServ;

{ TStMaster }

function TStMaster.Close(RotatorIndex: Integer): WordBool;
begin
  result := false;
  if RotatorIndex < Main.Gs232s.Count then
    if StrToBool(GetValue(RotatorIndex, cEnable)) then
      if Main.Gs232s[RotatorIndex].Active then
        begin
        Main.Gs232s[RotatorIndex].Close;
        result := true;
        end;
end;

function TStMaster.GetRotatorActive(RotatorIndex: Integer): WordBool;
begin
  result := false;
  if RotatorIndex < Main.Gs232s.Count then
    begin
    result := Main.Gs232s[RotatorIndex].Active;
    end;
end;

function TStMaster.GetRotatorAzumuth(RotatorIndex: Integer): Integer;
begin
  result := 0;
  if RotatorIndex < Main.Gs232s.Count then
    begin
    result := Main.gs232s[RotatorIndex].AzimuthD;
    end;
end;

procedure TStMaster.GetRotatorTitle(RotatorIndex: Integer; out GetRotatorTitle: WideString);
begin
  GetRotatorTitle := '';
  if RotatorIndex < Main.Gs232s.Count then
    begin
    GetRotatorTitle := WideString(GetValue(RotatorIndex, cTitle));
    end;
end;

function TStMaster.GetValue(Index: integer; Value: string): string;
var
  sl: TStringList;
begin
  result := '';
  sl := TstringList.Create;
  try
    if Index < Main.Gs232s.Count then
      begin
      sl.Text := Main.Rotators[Index];
      result  := WideString(sl.Values[Value]);
    end;
  finally
    FreeAndNil(sl);
  end;
end;

function TStMaster.Open(RotatorIndex: Integer): WordBool;
begin
  result := false;
  if RotatorIndex < Main.Gs232s.Count then
    if StrToBool(GetValue(RotatorIndex, cEnable)) then
      if not Main.Gs232s[RotatorIndex].Active then
        begin
        Main.Gs232s[RotatorIndex].Open;
        result := true;
        end;
end;

function TStMaster.Rotate(Azimuth: Integer; Freq: Single): WordBool;
begin
  result := false;
  if Main.CtrlTableEnable then
    begin
    Main.AutoOperation(Azimuth, Freq);
    result := true;
    end;
end;

function TStMaster.Get_Enable: WordBool;
begin
  result := Main.CtrlTableEnable;
end;

function TStMaster.Get_RotatorCount: Integer;
begin
  result := 0;
  if Main.CtrlTableEnable then
    result := Main.Gs232s.Count;
end;

function TStMaster.Get_RotatorIndex: Integer;
begin
  Result := Main.CurrentRotator;
end;

function TStMaster.Move(RotatorIndex, Azimuth: Integer): WordBool;
begin
  result := false;
  if RotatorIndex < Main.Gs232s.Count then
    if StrToBool(GetValue(RotatorIndex, cEnable)) then
      if Main.Gs232s[RotatorIndex].Active then
        begin
        Main.Gs232s[RotatorIndex].SetPreset(Azimuth);
        Main.Gs232s[RotatorIndex].GoPreset();
        result := true;
        end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TStMaster, Class_StMaster_,
    ciSingleInstance, tmSingle);

//  TAutoObjectFactory.Create(ComServer, TStMaster, Class_StMaster_,
//    ciMultiInstance, tmApartment);
end.
