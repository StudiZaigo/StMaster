unit Unit2;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes,
StMaster_TLB, StdVcl;

type
  TTest = class(TAutoObject, IConnectionPointContainer, ITest)
  private
    { Private �錾 }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: ITestEvents;
    { ����: FEvent �� *�P���* �C�x���g �V���N��ێ����܂��B������
      �C�x���g �V���N�ɃA�N�Z�X����ɂ́AFConnectionPoint.SinkList ���g�p���āA
      �V���N�̃��X�g���𔽕��I�Ɏ��s���܂��B}
  public
    procedure Initialize; override;
  protected
    function Get_Value: Integer; safecall;
    procedure ChangeColor; safecall;
    procedure Set_Value(Value: Integer); safecall;
    procedure Method1; safecall;
    { Protected �錾 }
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
