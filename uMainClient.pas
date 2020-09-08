unit uMainClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  StMaster_TLB, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TMainClien = class(TForm)
    btnMove: TButton;
    btnRotate: TButton;
    btnStatusGet: TButton;
    btnOpenClose: TButton;
    cbxEnable: TCheckBox;
    cbxRotatorActive1: TCheckBox;
    cbxRotatorActive2: TCheckBox;
    cbxRotatorActive3: TCheckBox;
    cbxRotatorActive4: TCheckBox;
    edtAzimuth_Rotator: TEdit;
    edtAzimuth1: TEdit;
    edtAzimuth2: TEdit;
    edtAzimuth3: TEdit;
    edtAzimuth4: TEdit;
    edtFreq_Rotate: TEdit;
    edtAzimuth_Move: TEdit;
    edtRotatorCount: TEdit;
    edtRotator_Move: TEdit;
    edtRotatorTitle1: TEdit;
    edtRotatorTitle2: TEdit;
    edtRotatorTitle3: TEdit;
    edtRotatorTitle4: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LalblAzimuth: TLabel;
    lblTitle: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnStatusGetClick(Sender: TObject);
    procedure btnRotateClick(Sender: TObject);
    procedure btnOpenCloseClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
  private
    { Private êÈåæ }
    StMaster: IStMaster;
    procedure SetValues;
  public
    { Public êÈåæ }
  end;

var
  MainClien: TMainClien;

implementation

{$R *.dfm}

procedure TMainClien.SetValues;
var
  ws: wideString;
begin
  StMaster.GetRotatorTitle(0, ws);
  edtRotatorTitle1.Text     := String(ws);
  cbxRotatorActive1.Checked := StMaster.GetRotatorActive(0);
  edtAzimuth1.Text          := IntToStr(StMaster.GetRotatorAzumuth(0));

  StMaster.GetRotatorTitle(1, ws);
  edtRotatorTitle2.Text     := String(ws);
  cbxRotatorActive2.Checked := StMaster.GetRotatorActive(1);
  edtAzimuth2.Text          := IntToStr(StMaster.GetRotatorAzumuth(1));

  StMaster.GetRotatorTitle(2, ws);
  edtRotatorTitle3.Text     := String(ws);
  cbxRotatorActive3.Checked := StMaster.GetRotatorActive(2);
  edtAzimuth3.Text          := IntToStr(StMaster.GetRotatorAzumuth(2));

  StMaster.GetRotatorTitle(3, ws);
  edtRotatorTitle4.Text     := string(ws);
  cbxRotatorActive4.Checked := StMaster.GetRotatorActive(3);
  edtAzimuth4.Text          := IntToStr(StMaster.GetRotatorAzumuth(3));
end;

procedure TMainClien.btnStatusGetClick(Sender: TObject);
begin
  cbxEnable.Checked         := StMaster.Get_Enable;
  edtRotatorCount.Text      := IntToStr(StMaster.RotatorCount);
  SetValues;
end;

procedure TMainClien.btnMoveClick(Sender: TObject);
var
  i: integer;
  a: Integer;
begin
  if TryStrToInt(edtRotator_Move.Text, i)
  and TryStrToInt(edtAzimuth_Move.Text, a) then
    if StMaster.GetRotatorActive(i - 1) then
      StMaster.Move(i - 1, a);
end;

procedure TMainClien.btnOpenCloseClick(Sender: TObject);
var
  i: integer;
begin
  if TryStrToInt(edtRotator_Move.Text, i) then
    if StMaster.GetRotatorActive(i - 1) then
      StMaster.Close(i - 1)
    else
      StMaster.Open(i - 1);
  SetValues;
end;

procedure TMainClien.btnRotateClick(Sender: TObject);
var
  i: integer;
  d: single;
begin
  if TryStrToInt(edtAzimuth_Rotator.Text, i)
  and TryStrToFloat(edtFreq_Rotate.Text, d) then
    StMaster.Rotate(i, d);
end;

procedure TMainClien.FormCreate(Sender: TObject);
begin
  StMaster := CoStMaster_.Create;
end;

end.
