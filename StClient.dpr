program StClient;

uses
  Vcl.Forms,
  uMainClient in 'uMainClient.pas' {MainClien};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainClien, MainClien);
  Application.Run;
end.
