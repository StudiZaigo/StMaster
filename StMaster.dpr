program StMaster;

uses
  Windows,
  Forms,
  uMain in 'uMain.pas' {Main},
  uOptions in 'uOptions.pas' {Options},
  Gs232 in 'Gs232.pas',
  uABOUT in 'uABOUT.pas' {AboutBox},
  StMaster_TLB in 'StMaster_TLB.pas',
  StMasterOle in 'StMasterOle.pas' {StMaster: CoClass},
  uComPort in 'uComPort.pas' {frmComPort: TFrame},
  RelayBox in 'RelayBox.pas';

const
  UniqueName = 'MutexStMaster';

var
  hMutex: THandle;

  {$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
//  Application.CreateForm(TMain, Main);
//  Application.Run;
{アプリケーション二重起動防止}

  hMutex := CreateMutex(nil, False, UniqueName);
  if WaitForSingleObject(hMutex, 0) <> wait_TimeOut then
    begin
    Application.Initialize;
    Application.CreateForm(TMain, Main);
  Application.Run;
    end;
end.



