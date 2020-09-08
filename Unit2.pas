unit Unit2;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes,
StMaster_TLB, StdVcl;

type
  TTest = class(TAutoObject, IConnectionPointContainer, ITest)
  private
    { Private 宣言 }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: ITestEvents;
    { メモ: FEvent は *単一の* イベント シンクを保持します。複数の
      イベント シンクにアクセスするには、FConnectionPoint.SinkList を使用して、
      シンクのリスト内を反復的に実行します。}
  public
    procedure Initialize; override;
  protected
    function Get_Value: Integer; safecall;
    procedure ChangeColor; safecall;
    procedure Set_Value(Value: Integer); safecall;
    procedure Method1; safecall;
    { Protected 宣言 }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;

  end;

implementation

uses ComServ;

procedure TTest.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITestEvents;
end;

procedure TTest.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;


function TTest.Get_Value: Integer;
begin

end;

procedure TTest.ChangeColor;
begin

end;

procedure TTest.Set_Value(Value: Integer);
begin

end;

procedure TTest.Method1;
begin

end;

initialization
  TAutoObjectFactory.Create(ComServer, TTest, Class_Test,
    ciSingleInstance, tmApartment);
end.
