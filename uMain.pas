unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry, ExtCtrls, Buttons, ActnList, Menus,
  DateUtils, System.Actions, Vcl.Tabs, Vcl.ComCtrls,
  Math, System.Generics.Collections, System.UITypes,
  uRoutine, Gs232, RelayBox, XMLIniFile, Data.DB, Datasnap.DBClient, MidasLib;

//**********************************************************************//
//                                                                      //
//  Main Formのクラス                                                   //
//                                                                      //
//**********************************************************************//
type
  TMain = class(TForm)
    ActionList1: TActionList;
    actAboutBox: TAction;
    actClose: TAction;
    actGotoHome: TAction;
    actOptions: TAction;
    actDelRotator: TAction;
    actForwadRoatator: TAction;
    actBackwardRptator: TAction;
    actInsRotator: TAction;

    MainMenu1: TMainMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    AboutBox1: TMenuItem;
    InsertRotator1: TMenuItem;
    InsRotator1: TMenuItem;
    DeleteRotator1: TMenuItem;
    DelRotator1: TMenuItem;
    PopupMenu1: TPopupMenu;

    CtrlTable: TClientDataSet;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    pnlBandSwitch: TPanel;
    btnBand01: TButton;
    btnBand02: TButton;
    btnBand03: TButton;
    btnBand04: TButton;
    btnBand05: TButton;
    btnBand06: TButton;
    btnBand07: TButton;
    btnBand08: TButton;
    btnBand09: TButton;
    btnBand10: TButton;
    btnBand11: TButton;
    btnBand12: TButton;
    btnBand13: TButton;
    btnBand14: TButton;
    btnBand15: TButton;
    btnBand16: TButton;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnlRotator: TPanel;
    imgMap: TImage;
    imgRelay: TImage;
    imgPreset: TImage;
    imgDirection: TImage;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnCCW: TBitBtn;
    btnCW: TBitBtn;
    btnStop: TBitBtn;
    btnPreset: TButton;
    edtPresetD: TEdit;
    btnOpenClose: TButton;
    pnlConsole: TPanel;
    Label4: TLabel;
    edtCommand: TEdit;
    btnExecute: TButton;
    Memo1: TMemo;
    btnSave: TButton;
    btnClear: TButton;
    pnlDummy: TPanel;

    procedure actAboutBoxExecute(Sender: TObject);
    procedure actBackwardRptatorExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actDelRotatorExecute(Sender: TObject);
    procedure actForwadRoatatorExecute(Sender: TObject);
    procedure actGotoHomeExecute(Sender: TObject);
    procedure actInsRotatorExecute(Sender: TObject);
    procedure actOptionsExecute(Sender: TObject);
    procedure btnCCWClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnCWClick(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure btnOpenCloseClick(Sender: TObject);
    procedure btnPresetClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure edtPresetDEnter(Sender: TObject);
    procedure edtPresetDExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure imgDirectionClick(Sender: TObject);
    procedure imgDirectionDblClick(Sender: TObject);
    procedure imgDirectionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure btnBand01Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private 宣言 }
    Init: boolean;
    bDebug: boolean;
    bInitialization: boolean;  // RTC-59のEEPROMのReset用
    iBandSwitchCount: integer;

    AppName: string;
    AppPath: string;
    MapName: string;
    XmlName: string;
    XmlIni: TXmlIniFile;


    FileCW_On: string;
    FileCW_Off: string;
    FileCCW_On: string;
    FileCCW_Off: string;

    NewTabSheet:TTabSheet;

    NeedleCenterX : integer;
    NeedleCenterY : integer;
    NeedleLength : integer;

// Preset用
    MouseX,MouseY: integer;
    MouseButton: TMouseButton;
    KeyShift: TShiftState;
    BeforeValue: string;  // TEditのText値の変更確認用
    BeforeCommand1: string;
    BeforeCommand2: string;

    FPresetNeedleColor: TColor;
    FCurrentNeedleColor: TColor;
    FOffsetNeedleColor: TColor;

    procedure DrawNeedle(const Value: double; Overlap: boolean; AImage: TImage; AColor: TColor);
    procedure DrawRelays;
    procedure EraseNeedle(AImage: TImage);
    procedure SetPanelFace;
    procedure SaveSetting;
    function CreateRotatorTitle: string;
    procedure InitializeRotator;
    procedure RelayControl(ExecCommand, CompareCommand: string);
    procedure SetRelayArray(Init: boolean);
    function ConvertStr(Source: string): string;

    procedure OnReachPreset(Sender: TObject);
    procedure OnReachBound(Sender: TObject; Bound: TBoundPosition);
    procedure OnChangeAzEl(Sender: TObject);
    procedure OnChangeRelays(Sender: TObject);
    procedure DoDrawNeedle;
    procedure DoDrawRelays;
    procedure SetStatusBar;

    procedure WMNCLBUTTONDOWN(var Msg: TWMNCLBUTTONDOWN); message WM_NCLBUTTONDOWN;
    procedure SetBandSwith;
    procedure ResetRotator(RotatorIdx: Integer);
    procedure SetRotator(RotatorIdx: integer);
  public
    { Public 宣言 }
    CtrlName: string;
    CurrentRotator: integer; // 現在選ばれているローテータ
    CtrlTableEnable: boolean;
    Rotators: TStringList;
    Rotator: TStringList;
    Gs232s: TObjectList<TGs232>;
    Gs232: TGs232;
    RelayBoxs: TObjectList<TRelayBox>;
    RelayBox: TRelayBox;
    procedure AutoOperation(AAz: integer; AFreq: Double);
  end;

const
  cPi2: double = 2 * pi;                //  2 × PI
  cRotator: string = 'Rotator';
  cTitle: string = 'Title';
  cMapFileName: string = 'MapFileName';
  cEnable: string = 'Enable';
  cAutoActive: string = 'AutoActive';
  cModel: string = 'Model';
  cCenterPosition: string = 'CenterPosition';
  cAzimuthAngle: string  = 'AzimuthAngle';
  cRotationSpeed: string = 'RotationSpeed';
  cHome: string = 'Home';
  cReturnHome: string = 'ReturnHome';
  cOffset: string = 'Offset';
  cCommandB: string = 'CommandB';
  cCommandA: string = 'CommandA';
  cRelaysCount: string = 'RelaysCount';
  cPort: string = 'Port';
  cBaudRate: string = 'BaudRate';
  cDataBits: string = 'DataBits';
  cParity: string = 'Parity';
  cStopBits: string = 'StopBits';
  cFlowControl: string = 'FlowControl';
  cMode: string = 'Mode';
  cSerialNo: string = 'SerialNo';
  cBigBang: string = 'BigBang';
  cComPort: string = 'ComPort';

  cCount: string ='Count';

var
  Main: TMain;

implementation

uses uOptions, uAbout, StMasterOle;

{$R *.dfm}

procedure TMain.FormCreate(Sender: TObject);
var
  i: integer;
  s: string;
  Nodenames: TStringList;  //　Rotator_xのNodeの名前を一時保存
//  btn: TButton;
begin
  bDebug := true;
  bInitialization := true;;

  AppName   := Application.ExeName;
  AppPath   := ExtractFilePath(AppName);
  MapName   := AppPath + 'AzChart.bmp';
  CtrlName  := AppPath + 'CtrlTable.xml';
  XmlName   := ChangeFileExt(AppName, '.xml');
  FileCW_On := AppPath + 'CW_On.bmp';
  FileCW_Off:= AppPath + 'CW_Off.bmp';
  FileCCW_On  := AppPath + 'CCW_On.bmp';
  FileCCW_Off := AppPath + 'CCW_Off.bmp';

  XmlIni  := TXmlIniFile.Create(XmlName);
  try
    XmlIni.OpenNode('/Main', true);
    Top  := XmlIni.ReadInteger('Top', -1);
    Left := XmlIni.ReadInteger('Left', -1);
    if (Left > Screen.Width) or (Left < 0) then
      Left   := (Screen.Width - Width)   Div 2;
    if (Top > Screen.Height) or (Top < 0) then
      Top   := (Screen.Height - Main.Height)   Div 2;
  finally
    FreeAndNil(XmlIni);
  end;

// Rotatorの設定
  Rotators  := TstringList.Create;
  Rotator   := TstringList.Create;
  Gs232s    := TObjectList<TGs232>.Create();
  NodeNames := TStringList.Create;
  XmlIni  := TXmlIniFile.Create(XmlName);
  try
    XmlIni.OpenNode('/CtrlTable', true);
    CtrlTableEnable  := XmlIni.Readbool('Enable', false);
    if FileExists(CtrlName) then
      CtrlTable.LoadFromFile(CtrlName);

    if XmlIni.OpenNode('/Rotators', false) then
      begin
      for i := 0 to XmlIni.ChildNodesCount - 1 do
        begin
        s := XmlIni.ChildNodes(i, XmlIni.CurrentNode).NodeName;
        NodeNames.Add(s);
        end;

      for i := 0 to NodeNames.Count - 1 do
        begin
        Rotator.Clear;
        Gs232 := TGs232.Create(self);
        if i >= 1 then
          begin
          NewTabSheet := TTabSheet.Create(PageControl1);  //新規のTabSheetを作成
          NewTabSheet.Caption     := CreateRotatorTitle;
          NewTabSheet.PageControl := PageControl1;        //TabSheet
          NewTabSheet.PageIndex   := i;
          end;
        s := NodeNames[i];
        if XmlIni.OpenNode(format('/Rotators/%s', [s]), false) then
          begin
          s :=  XmlIni.ReadString(cTitle, '');
          if s = '' then
            s  := PageControl1.Pages[i].Caption;
          PageControl1.Pages[i].Caption := s;
          Rotator.Add(cTitle        + '=' + s);
          Rotator.Add(cMapFileName  + '=' + XmlIni.ReadString(cMapFileName, ''));
          Rotator.Add(cEnable       + '=' + BoolToStr(XmlIni.ReadBool(cEnable, false)));
          Rotator.Add(cAutoActive   + '=' + BoolToStr(XmlIni.ReadBool(cAutoActive, false)));

          Gs232.Model         := XmlIni.ReadString(cModel, 'GS-232A');
          Gs232.CenterPosition:= TCenterPosition(xmlIni.ReadInteger(cCenterPosition, Ord(cpNorth)));
          Gs232.AzimuthAngle  := TAzimuthAngle(XmlIni.ReadInteger(cAzimuthAngle, Ord(Az360)));
          Gs232.RotationSpeed := XmlIni.ReadString(cRotationSpeed, '4');
          Gs232.SetHome(XmlIni.ReadInteger(cHome, 0), 0);
          Gs232.ReturnHome    := XmlIni.ReadBool(cReturnHome, false);
          Gs232.SetOffset(XmlIni.ReadInteger(cOffset, 0), 0);
          Gs232.CommandB      := XmlIni.ReadString(cCommandB, '');
          Gs232.CommandA      := XmlIni.ReadString(cCommandA, '');
          Gs232.RelayArray.Count   := XmlIni.ReadInteger(cRelaysCount, 0);
          Gs232.ElEnable      := False;

          Gs232.Port          := XmlIni.ReadString(cPort, 'COM3');
          Gs232.BaudRate      := XmlIni.ReadString(cBaudRate, '9600');
          Gs232.DataBits      := XmlIni.ReadString(cDataBits, '8');
          Gs232.Parity        := XmlIni.ReadString(cParity, 'NONE');
          Gs232.StopBits      := XmlIni.ReadString(cStopBits, '1');
          Gs232.FlowControl   := XmlIni.ReadString(cFlowControl, 'NONE');
          Gs232.ReachPreset   := OnReachPreset;
          Gs232.ReachBound    := OnReachBound;
          Gs232.ChangeAzEl    := OnChangeAzEl;
          end;
        Rotators.Add(Rotator.Text);
        Gs232s.add(Gs232);
        end
      end
    else
      begin
      Rotator.Clear;
      Gs232 := TGs232.Create(self);
      InitializeRotator;    // 初期設定
      Rotators.Add(Rotator.Text);
      Gs232s.add(Gs232);
      end;
    for i := 0 to Gs232s.Count - 1 do
      begin
      Rotator.Text := Rotators.Strings[i];
      if StrToBool(Rotator.Values[cAutoActive]) then
        Gs232s[i].Open();
      end;
    SetRelayArray(true);     // RelayBoxを初期化する（Openしている機器のみ）

// ReloayBoxの設定
    RelayBoxs    := TObjectList<TRelayBox>.Create();
    for i := 0 to 1 do
      if XmlIni.OpenNode(format('/RelayBoxs/RelayBox_%d', [i]), true) then
        begin
        RelayBox  := TRelayBox.Create(self);
        RelayBox.Count          := XmlIni.ReadInteger(cCount, 8);
        RelayBox.Enable         := XmlIni.Readbool(cEnable, false);
        RelayBox.Mode           := XmlIni.ReadString(cMode, cBIGBANG);
        RelayBox.SerialNo       := XmlIni.ReadString(cSerialNo, '');
        RelayBox.Port           := XmlIni.ReadString(cPort, 'COM3');
        RelayBox.BaudRate       := XmlIni.ReadString(cBaudRate, '9600');
        RelayBox.DataBits       := XmlIni.ReadString(cDataBits, '8');
        RelayBox.Parity         := XmlIni.ReadString(cParity, 'NONE');
        RelayBox.StopBits       := XmlIni.ReadString(cStopBits, '1');
        RelayBox.FlowControl    := XmlIni.ReadString(cFlowControl, 'NONE');
        RelayBoxs.add(RelayBox);
        end;
    for i := 0 to RelayBoxs.Count - 1 do
      begin
      if RelayBoxs[i].Enable then
        RelayBoxs[i].Open();
      end;

  edtPresetD.Clear;
  edtCommand.Clear;
  pnlBandSwitch.Caption := '';
  Memo1.Clear;
  with pnlRotator do
    begin
    Top   := PageControl1.Top + 25;
    Left  := PageControl1.Left + 5;
    Height:= pnlDummy.Height;
    Width := pnlDummy.Width;
    end;
  with pnlConsole do
    begin
    color := pnlRotator.Color;
    Top   := pnlRotator.Top;
    Left  := pnlRotator.Left;
    Height:= pnlRotator.Height;
    Width := pnlRotator.Width;
    end;

  PageControl1.TabIndex := 0;
  with imgMap do
    begin
    Left := (pnlRotator.Width - width) div 2;
    end;
  with imgPreset do
    begin
    Left   := imgMap.Left;
    Top    := imgMap.Top;
    Width  := imgMap.Width;
    Height := imgMap.Height;
    BringToFront;
    Canvas.FillRect(imgPreset.ClientRect);
    Transparent  := True;
    end;
  with imgRelay do
    begin
    Left   := imgMap.Left;
    Top    := imgMap.Top;
    Width  := imgMap.Width;
    Height := imgMap.Height;
    BringToFront;
    Canvas.FillRect(imgRelay.ClientRect);
    Transparent  := True;
    end;
  with imgDirection do
    begin
    Left   := imgMap.Left;
    Top    := imgMap.Top;
    Width  := imgMap.Width;
    Height := imgMap.Height;
    BringToFront;
    Canvas.FillRect(imgDirection.ClientRect);
    Transparent  := True;
    end;

  SetBandSwith;

  NeedleCenterX := ImgMap.Width div 2;
  NeedleCenterY := ImgMap.Height div 2;
  NeedleLength  :=  NeedleCenterX * 4 div 5;

  FCurrentNeedleColor := clBlack;
  FPresetNeedleColor  := clBlue;
  FOffsetNeedleColor  := clGreen;

  PageControl1Change(PageControl1);
  finally
    FreeAndNil(XmlIni);
    FreeAndNil(NodeNames);
  end;
end;

// クライアントから起動されたとき、close時にフォームの位置が記録されないため
procedure TMain.WMNCLBUTTONDOWN(var Msg: TWMNCLBUTTONDOWN);
begin
  inherited;
  XmlIni := TXmlIniFile.Create(XmlName);
  try
    XmlIni.OpenNode('/Main', true);
    XmlIni.WriteString('Version', GetVersionInfo(AppName, vrFileVersion));
    XmlIni.WriteInteger('Left', Main.Left);
    XmlIni.WriteInteger('Top', Main.Top);
    XmlIni.CloseNode;
    XmlIni.UpdateFile;
  finally
    FreeAndNil(XmlIni);
  end;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  SetRelayArray(false);
  XmlIni := TXmlIniFile.Create(XmlName);
  try
    XmlIni.OpenNode('/Main', true);
    XmlIni.WriteString('Version', GetVersionInfo(AppName, vrFileVersion));
    XmlIni.WriteInteger('Left', Main.Left);
    XmlIni.WriteInteger('Top', Main.Top);
    XmlIni.CloseNode;
    XmlIni.UpdateFile;

    for i := 0 to Gs232s.Count - 1 do
      begin
      Rotator.Text := Rotators.Strings[i];
      if strToBool(Rotator.Values[cEnable]) then
//      if Gs232s[i].Port <> '' then
        begin
        if Gs232s[i].ReturnHome then
          begin
          if not Gs232s[i].Active then
            Gs232s[i].Open();
          Gs232s[i].GoHome();
          end;
        if Gs232s[i].Active then
          Gs232s[i].Close();
        end;
      end;
    for i := 0 to RelayBoxs.Count - 1 do
      begin
      if RelayBoxs[i].Active then
          RelayBoxs[i].Close();
      end;
    for i := PageControl1.PageCount - 1 downto 1 do
      PageControl1.Pages[i].Free;
  finally
    FreeAndNil(XmlIni);
//    FreeAndNil(Gs232);
    FreeAndNil(Gs232s);
    FreeAndNil(Rotators);
    FreeAndNil(Rotator);
    FreeAndNil(RelayBoxs);
  end;
end;

procedure TMain.InitializeRotator;
begin
  Rotator.Add(cTitle        + '=' + CreateRotatorTitle);
  Rotator.Add(cMapFileName  + '=' + '');
  Rotator.Add(cEnable       + '=' + BoolToStr(false));
  Rotator.Add(cAutoActive   + '=' + BoolToStr(false));

  Gs232.Model             := 'GS-232A';
  Gs232.CenterPosition    := cpNorth;
  Gs232.AzimuthAngle      := Az360;
  Gs232.RotationSpeed     := '4';
  Gs232.SetHome(0, 0);
  Gs232.ReturnHome        := false;
  Gs232.SetOffset(0, 0);
  Gs232.CommandB          := '';
  Gs232.CommandA          := '';
  Gs232.RelayArray.Count  := 0;
  Gs232.ElEnable          := False;

  Gs232.Port              := 'COM3';
  Gs232.BaudRate          := '9600';
  Gs232.DataBits          := '8';
  Gs232.Parity            := 'NONE';
  Gs232.StopBits          := '1';
  Gs232.FlowControl       := 'NONE';
  Gs232.ReachPreset       := OnReachPreset;
  Gs232.ReachBound        := OnReachBound;
  Gs232.ChangeAzEl        := OnChangeAzEl;
end;

procedure TMain.SetBandSwith;
var
  i: integer;
  s: string;
  btn: TButton;
begin
  for i := 0 to pnlBandSwitch.ControlCount - 1 do
    begin
    TButton(pnlBandSwitch.Controls[i]).Visible := false;
    end;

  iBandSwitchCount := 0;
//  if RelayBoxs[0].Enable or RelayBoxs[1].Enable then
    begin
    i := -1;
    CtrlTable.Filtered := false;
    CtrlTable.First;
    while not CtrlTable.Eof do
      begin
      if (CtrlTable.FieldByName('LowerFreq').AsFloat = 0)
      and (CtrlTable.FieldByName('UpperFreq').AsFloat = 0) then
        begin
        CtrlTable.Next;
        continue;
        end;
      inc(i);
      inc(iBandSwitchCount);
      btn := TButton(pnlBandSwitch.Controls[i]);
      btn.Visible := true;
      btn.Tag     := i;
      s := CtrlTable.FieldByName('Title').AsString;
      if s <> '' then
        btn.Caption := s
      else
        btn.Caption := 'Band' + IntToStr(i + 1);
      CtrlTable.Next;
      if i = pnlBandSwitch.ControlCount - 1 then
        Break;
      end;
    CtrlTable.First;
    end;

//  showMessage(IntToStr(width) + ' ' + IntToStr(ClientWidth));
  with pnlBandSwitch do
    begin
    Left := PageControl1.Width + 2;
    Top  := 0;
    Height := PageControl1.Height;
    if iBandSwitchCount = 0 then
      begin
      Visible := false;
      Self.Width := 275;
      end
    else if iBandSwitchCount <= 8 then
      begin
      Visible := true;
      Width   := 65;
      Self.Width := 275 + Width;
      end
    else
      begin
      Visible := true;
      Width   := 120;
      Self.Width := 275 + Width;
      end;
    end;
end;

procedure TMain.SaveSetting;
var
  i: integer;
  sl: TstringList;
begin
  XmlIni := TXmlIniFile.Create(XmlName);
  sl := TStringList.Create;
  try
    XmlIni.OpenNode('/CtrlTable', true);
    XmlIni.Writebool('Enable', CtrlTableEnable);
    XmlIni.CloseNode;
    XmlIni.UpdateFile;

    XMlIni.DeleteNode('Rotators', XmlIni.RootNode);
    XmlIni.CloseNode;
    XmlIni.UpdateFile;
    for i := 0 to Gs232s.Count - 1 do
      begin
      XmlIni.OpenNode(format('/Rotators/Rotator_%d', [i]), true);
      sl.Text  := Rotators.Strings[i];
      XmlIni.WriteString(cTitle,        sl.Values[cTitle]);
      XmlIni.WriteString(cMapFileName,  sl.Values[cMapFileName]);
      XmlIni.Writebool(cEnable,         StrToBool(sl.Values[cEnable]));
      XmlIni.Writebool(cAutoActive,     StrToBool(sl.Values[cAutoActive]));

      XmlIni.WriteString(cModel, Gs232s[i].Model);
      XmlIni.WriteInteger(cCenterPosition, Ord(Gs232s[i].CenterPosition));
      XmlIni.WriteInteger(cAzimuthAngle, Ord(Gs232s[i].AzimuthAngle));
      XmlIni.WriteString(cRotationSpeed,Gs232s[i].RotationSpeed);
      XmlIni.WriteInteger(cHome, Gs232s[i].AzHomeD);
      XmlIni.WriteBool(cReturnHome, Gs232s[i].ReturnHome);
      XmlIni.WriteInteger(cOffset, Gs232s[i].AzOffsetD);
      XmlIni.WriteString(cCommandB, Gs232s[i].CommandB);
      XmlIni.WriteString(cCommandA, Gs232s[i].CommandA);
      XmlIni.WriteInteger(cRelaysCount, Gs232s[i].RelayArray.Count);

      XmlIni.WriteString(cPort, Gs232s[i].Port);
      XmlIni.WriteString(cBaudRate, Gs232s[i].BaudRate);
      XmlIni.WriteString(cDataBits, Gs232s[i].DataBits);
      XmlIni.WriteString(cParity, Gs232s[i].Parity);
      XmlIni.WriteString(cStopBits, Gs232s[i].StopBits);
      XmlIni.WriteString(cFlowControl, Gs232s[i].FlowControl);
      XmlIni.CloseNode;
      XmlIni.UpdateFile;
      end;
    for i := 0 to RelayBoxs.Count - 1 do
      begin
      XmlIni.OpenNode(format('/RelayBoxs/RelayBox_%d', [i]), true);
      XmlIni.Writebool(cEnable,       RelayBoxs[i].Enable);
      XmlIni.WriteString(cMode,       RelayBoxs[i].Mode);
      XmlIni.WriteString(cSerialNo,   RelayBoxs[i].SerialNo);
      XmlIni.WriteInteger(cCount,     RelayBoxs[i].Count);

      XmlIni.WriteString(cPort, RelayBoxs[i].Port);
      XmlIni.WriteString(cBaudRate, RelayBoxs[i].BaudRate);
      XmlIni.WriteString(cDataBits, RelayBoxs[i].DataBits);
      XmlIni.WriteString(cParity, RelayBoxs[i].Parity);
      XmlIni.WriteString(cStopBits, RelayBoxs[i].StopBits);
      XmlIni.WriteString(cFlowControl, RelayBoxs[i].FlowControl);
      XmlIni.CloseNode;
      XmlIni.UpdateFile;
      end;
  finally
    FreeAndNil(XmlIni);
    FreeAndNil(sl);
  end;
end;

function TMain.CreateRotatorTitle(): string;
var
  i,j: integer;
  sl: TStringList;
begin
  sl := TStringList.Create;
  result := '';
  try
    for i := 0 to  PageControl1.PageCount - 1 do
      begin
      if Copy(PageControl1.Pages[i].Caption, 1, Length(cRotator)) = cRotator then
        if tryStrToInt(Copy(PageControl1.Pages[i].Caption, Length(cRotator) + 1, 7), j) then
          sl.Add(Format('%5.d', [j]));
      end;
    sl.Sort;
    j := 1;
    for i := 1 to sl.Count do
      if i <> StrToInt(sl[i - 1]) then
        begin
        j := i;
        break;
        end;
    result := cRotator + IntToStr(j);
  finally
    freeAndNil(sl);
  end;
end;

//**********************************************************************//
//                                                                      //
//  PageControl                                                         //
//                                                                      //
//**********************************************************************//
procedure TMain.SetRotator(RotatorIdx: integer);
begin
//  Rotatorは変更後の値
  if RotatorIdx <= PageControl1.PageCount - 2 then
    begin
    pnlRotator.BringToFront;
    CurrentRotator      := PageControl1.TabIndex;
    Rotator.Text        := Rotators[CurrentRotator];
    Gs232               := Gs232s[CurrentRotator];
    Gs232.Current       := true;
    Gs232.ReachPreset   := OnReachPreset;
    Gs232.ReachBound    := OnReachBound;
    Gs232.ChangeAzEl    := OnChangeAzEl;
    Gs232.RelayArray.ChangeRelays  := OnChangeRelays;

    SetPanelFace;
    DoDrawNeedle;
    end
  else if PageControl1.TabIndex = PageControl1.PageCount - 1 then
    begin
    pnlConsole.BringToFront;
    end;
end;

procedure TMain.ResetRotator(RotatorIdx: Integer);
begin
//  Rotatorは変更前の値
  if RotatorIdx <= Gs232s.Count - 1 then
    begin
    Gs232.Current       := false;
    Gs232.ReachPreset   := nil;
    Gs232.ReachBound    := nil;
    Gs232.ChangeAzEl    := nil;
    Gs232.RelayArray.ChangeRelays  := nil;
    end;
end;



procedure TMain.AutoOperation(AAz: integer; AFreq: Double);
var
  s: string;
  sl: TStringList;
  lOrder: integer;
  lRotater: integer;
  lOffset: integer;
//  lCommand1: string;
//  lCommand2: string;
  btn: TButton;
begin
  sl := TstringList.Create;
  try
    if not CtrlTableEnable then
      exit;

    s := FloatToStr(AFreq);
    CtrlTable.Filter   := 'LowerFreq <= ' + S + ' AND UpperFreq >= ' + s;
    CtrlTable.Filtered := true;
    CtrlTable.First;
    if CtrlTable.Eof then
      exit;

    lOrder    := ctrlTable.FieldByName('Order').Asinteger;
    lRotater  := ctrlTable.FieldByName('Rotator').Asinteger - 1;
    lOffset   := ctrlTable.FieldByName('Offset').AsInteger;
//    lCommand1 := ctrlTable.FieldByName('Command1').AsString;
//    lCommand2 := ctrlTable.FieldByName('Command2').AsString;
//    RelayControl(BeforeCommand2, lCommand2);
//    RelayControl(lCommand1, BeforeCommand1);
//    BeforeCommand1 := lCommand1;
//    BeforeCommand2 := lCommand2;
    CtrlTable.Filtered := false;
// Buttonを決める
    btn := TButton(pnlBandSwitch.Controls[lOrder]);
    btn.Click;

    if (lRotater < -1) or (lRotater >= Gs232s.Count) then
      exit;
    sl.Text := Rotators.Strings[lRotater];
    if not StrToBool(sl.Values[cEnable]) then
      exit;

    if lRotater >=  0 then
      begin
      if lRotater = PageControl1.ActivePageIndex then
        begin
        edtPresetD.text := IntToStr(AAz);
        EraseNeedle(imgPreset);
        DrawNeedle(DegToRad(AAz), false, imgPreset, FPresetNeedleColor);
        end;
      if not Gs232s[lRotater].Active then
        exit;
      Gs232s[lRotater].TempOffsetD := lOffset;
      Gs232s[lRotater].GoPreset(AAz);
      end;

  finally
//    CtrlTable.Filtered := true;
    FreeAndNil(sl);
  end;
end;

procedure TMain.SetRelayArray(Init: boolean);
var
  lCommand1: string;
  lCommand2: string;
begin
  if not CtrlTableEnable then
    exit;
  if CtrlTable.RecordCount = 0 then
    exit;

  CtrlTable.Filter   := 'LowerFreq = 0 and UpperFreq = 0';
  CtrlTable.Filtered := true;
  CtrlTable.First;
  if CtrlTable.Eof then
    exit;

  lCommand1 := ctrlTable.FieldByName('Command1').AsString;
  lCommand2 := ctrlTable.FieldByName('Command2').AsString;
  if Init then
    RelayControl(lCommand1, '')
  else
    RelayControl(lCommand2, '');
  CtrlTable.Filtered := false;
end;

procedure TMain.RelayControl(ExecCommand, CompareCommand: string);
var
  i: integer;
  s: string;
  CorR: string;
  Num: integer;
  cmd: string;
  sl: TstringList;
begin
  sl  := TstringList.Create;
  try
    if (ExecCommand <> CompareCommand) and (ExecCommand <> '') then
      begin
      sl.CommaText  := ConvertStr(ExecCommand);
      for i := 0 to sl.Count - 1 do
        begin
        s := sl.Strings[i];
        CorR := Copy(s, 1, 1);
        TryStrToInt(Copy(s, 2, 1), Num);
        cmd := Copy(s, 4, 128);
        if (CorR = 'C') and (Num >= 1) and (Num <= Gs232s.Count) and (Copy(s, 3, 1)=':') then
          Gs232s[Num - 1].DoCmd(cmd);
        if (CorR = 'R') and (Num >= 1) and (Num <= RelayBoxs.Count) and (Copy(s, 3, 1)=':') then
          RelayBoxs[Num - 1].DoCmd(cmd);
        end;
      end;
  finally
    FreeAndNil(sl);
  end;
end;

function TMain.ConvertStr(Source: string): string;
var
  i: integer;
  i1,i2: Integer;
  j1,j2: integer;
  s: string;
  p: integer;
  len: integer;
  src: string;
  Dest: string;
const
  cApos: string = '''';
  cChar:  string = 'CHAR(';
begin
  src := UpperCase(Source);
  Len := Length(Source);
  p := 1;
  repeat
    i1 := Pos(cApos, src, p);
    j1 := Pos(cChar, src, p);
    if (i1 = 0) and (J1 = 0) then
      begin
      Result := Dest + Copy(Source, p, 999);
      exit;
      end;

    if i1 = 0 then
     i1 := 999;
    if j1 = 0 then
     j1 := 999;
    if i1 < J1 then
      begin
      if i1 <> p then
        begin
        Dest := Dest + Copy(Source, p, i1 - 1);
        end;
      i2 := Pos(cApos, src, i1 + 1);
      if I2 = 0 then
        begin
        Result := Dest + Copy(Source, p, 999);
        exit;
        end
      else
        Dest := Dest + Copy(Source, i1 + 1, i2 - i1 - 1);
        p := I2 + 1;
      end
    else
      begin
      if J1 <> p then
        begin
        Dest := Dest + Copy(Source, p, j1 - 1);
        end;
      j2 := Pos(')', src, j1 + 5);
      if j2 = 0 then
        begin
        s := Copy(Source, p, 999);
        Result := Dest + s;
        exit;
        end
      else
        s := Copy(Source, j1 + 5, j2 - j1 - 5);
        if TryStrToInt(s, i) then
        Dest := Dest + char(i);
        p := j2 + 1;
      end
  until p > Len;
end;

//**********************************************************************//
//                                                                      //
//  Panel1 procedure                                                    //
//                                                                      //
//**********************************************************************//
procedure TMain.SetPanelFace();
begin
//    PageControl1.Pages[PageControl1.ActivePageIndex].Caption  := Rotator.Values[cTitle];


  PageControl1.ActivePage.Caption := Rotator.Values[cTitle];
  if Rotator.Values[cMapFileName] = '' then
    imgMap.Picture.LoadFromFile(MapName)
  else
    imgMap.Picture.LoadFromFile(Rotator.Values[cMapFileName]);
  if Gs232.Presetting then
    begin
    edtPresetD.Text := IntToStr(Gs232.AzPresetD);
    DrawNeedle(Gs232.AzPresetR, false, imgPreset, FPresetNeedleColor);
    end
  else
    begin
    edtPresetD.Clear;
    EraseNeedle(imgPreset);
    end;
  DrawRelays;

  if StrToBool(Rotator.Values[cEnable]) then
    begin
    btnOpenClose.Enabled  := true;
    if Gs232.Active then
      begin
      btnOpenClose.Caption  := 'Close';
      btnPreset.Enabled     :=  true;
      btnCCW.Enabled        :=  true;
      btnCW.Enabled         :=  true;
      btnStop.Enabled       :=  true;
      edtPresetD.Enabled    :=  true;
      end
    else
      begin
      btnOpenClose.Caption  := 'Open';
      btnPreset.Enabled     :=  false;
      btnCCW.Enabled        :=  false;
      btnCW.Enabled         :=  false;
      btnStop.Enabled       :=  false;
      edtPreSetD.Enabled    :=  false;
      end
    end
  else
    begin
    btnOpenClose.Enabled  := false;
    if Gs232.Active then
      Gs232.Close;
    btnOpenClose.Caption  := 'Open';
    btnPreset.Enabled     :=  false;
    btnCCW.Enabled        :=  false;
    btnCW.Enabled         :=  false;
    btnStop.Enabled       :=  false;
    end;
  SetStatusBar;
end;

procedure TMain.SetStatusBar();
var
  i: integer;
begin
  for i := 0 to StatusBar1.Panels.Count -1 do
    begin
    if i <= Gs232s.Count - 1 then
      StatusBar1.Panels[i].Text := format('AZ=%d°', [gs232s[i].AzimuthD])
    else
      StatusBar1.Panels[i].Text := '';
    end;
end;


procedure TMain.SpeedButton1Click(Sender: TObject);
begin
//  SpeedButton1.Down  :=  not tSpeedButton.Down;
end;

//**********************************************************************//
//                                                                      //
//  Image                                                               //
//                                                                      //
//**********************************************************************//
procedure TMain.DoDrawNeedle;
begin
  EraseNeedle(imgDirection);
  DrawNeedle(gs232.AzimuthR, Gs232.Overlap, imgDirection, clBlack);
  if Gs232.TempOffsetD  <> 0  then
    DrawNeedle(gs232.AzimuthR + Gs232.TempOffsetR, Gs232.Overlap, imgDirection, clGreen);

end;

procedure TMain.DoDrawRelays;
begin
  if Gs232.RelayArray.Enable then
    DrawRelays;
end;

procedure TMain.DrawNeedle(const Value: double; Overlap: boolean; AImage: TImage; AColor: TColor);
var
  Angle: Double;
  N1,N3: integer;
begin
  Angle := Pi2 - Value + (Pi2 /4);

  N1 := Trunc(NeedleLength * 0.9);
  N3 := NeedleLength - N1;

  if Overlap then
    begin
    aImage.Canvas.Pen.Color := clRed;
    aImage.Canvas.Pen.Style := psSolid;
    aImage.Canvas.Pen.Width := 5;
    aImage.Canvas.Brush.Style := bsSolid;
    aImage.Canvas.Brush.Color := clRed;
    aImage.Canvas.Ellipse(10,10,20,20);
    aImage.Canvas.FloodFill(15, 15, clRed, fsborder);

    aImage.Canvas.Font.Size := 9;
    aImage.Canvas.Font.Color := clRed;
    aImage.Canvas.Brush.Style := bsClear;
    aImage.Canvas.TextOut(26, 7, 'OVERLAP');
    end;

  with AImage do
    begin
    Canvas.Pen.Color := AColor;
    Canvas.Pen.Width := 5;
    Canvas.MoveTo(NeedleCenterX - Round(N3 * cos(-Angle)),
        NeedleCenterY - Round(N3 * sin(-Angle)));
    Canvas.LineTo(NeedleCenterX + Round(N1 * cos(Angle)),
        NeedleCenterY - Round(N1 * sin(Angle)));
    end;
end;

procedure TMain.DrawRelays;
var
  i: integer;
  x,y: integer;
  cl: TColor;
begin
  imgRelay.Canvas.Brush.Color := clWhite;          // 全て白で塗りつぶし
  imgRelay.Canvas.FillRect(imgDirection.ClientRect);
  if not Gs232.RelayArray.Enable then
    exit;
  y := imgRelay.Height - 20;
  imgRelay.Canvas.Pen.Style   := psSolid;
  imgRelay.Canvas.Pen.Width   := 5;
  imgRelay.Canvas.Brush.Style := bsSolid;
  for i := 0 to Gs232.RelayArray.Count - 1 do
    begin
    x := 20 * i + 10;
    if Gs232.RelayArray.Relay[i] then
      cl := clRed
    else
      cl := clGreen;
    imgRelay.Canvas.Pen.Color   := cl;
    imgRelay.Canvas.Brush.Color := cl;
    imgRelay.Canvas.Ellipse(x, y, X + 10, Y + 10);
    imgRelay.Canvas.FloodFill(x + 5, y + 5, cl, fsborder);
    end;
end;

procedure TMain.EraseNeedle(AImage: TImage);
begin
  with AImage do
    begin
    AImage.Canvas.Brush.Color := clWhite;          // 全て白で塗りつぶし
    Canvas.FillRect(imgDirection.ClientRect);
    end;
  Invalidate;
end;

//**********************************************************************//
//                                                                      //
//  Event procdure from Gs232                                           //
//                                                                      //
//**********************************************************************//
procedure TMain.OnChangeAzEl(Sender: TObject);
begin
  if not btnCW.Enabled then
    btnCw.Enabled := true;
  if not btnCCW.Enabled then
    btnCCw.Enabled := true;
  DoDrawNeedle;
  SetStatusBar;
end;

procedure TMain.OnChangeRelays(Sender: TObject);
begin
  DoDrawRelays;
end;

procedure TMain.OnReachBound(Sender: TObject; Bound: TBoundPosition);
begin
  if Bound = bpCwBound then
    if btnCW.Enabled then
      btnCw.Enabled := false;
  if Bound = bpCcwBound then
    if btnCCW.Enabled then
      btnCCw.Enabled := false;
  DoDrawNeedle;
  btnStop.OnClick(btnStop);
end;

procedure TMain.OnReachPreset(Sender: TObject);
begin
  DoDrawNeedle;
  edtPresetD.Clear;
  EraseNeedle(imgPreset);
  Gs232.DoCmd('S');
end;

//**********************************************************************//
//                                                                      //
//  Action                                                              //
//                                                                      //
//**********************************************************************//
procedure TMain.actAboutBoxExecute(Sender: TObject);
var
  AboutBox: TAboutBox;
begin
  AboutBox := TAboutBox.Create(self);
  try
    AboutBox.ShowModal;
  finally
    FreeAndNil(AboutBox);
  end;
end;

procedure TMain.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TMain.actDelRotatorExecute(Sender: TObject);
var
  i: integer;
begin
  if (PageControl1.PageCount >= 3) and (PageControl1.ActivePageIndex < PageControl1.PageCount - 1) then
    begin
    LockWindowUpdate(PageControl1.Handle);
    i :=  PageControl1.ActivePageIndex;
    PageControl1.Pages[i].Free;
    if i = 0 then
      PageControl1.ActivePageIndex := PageControl1.PageCount - 2          //強制的に右端に戻す
    else
      PageControl1.ActivePageIndex := i - 1;
    LockWindowUpdate(0);

    Rotators.Delete(i);
    Gs232s.Delete(i);
    Gs232 := Gs232s[PageControl1.ActivePageIndex];
    SetStatusBar;
    SaveSetting;
    end;
end;

procedure TMain.actBackwardRptatorExecute(Sender: TObject);
var
  i,j: integer;
begin
  //TabSheet の配置を変更
  i := Pagecontrol1.ActivePageIndex;
  if i <=  Pagecontrol1.PageCount - 2 then
    begin
    if i >=  Pagecontrol1.PageCount - 2 then
      j := 0
    else
      j :=  i + 1;
    Pagecontrol1.ActivePage.PageIndex := j;
    PageControl1.ActivePageIndex := j;         //ActivePage を設定して一番手前に表示
    Rotators.Exchange(i, j);
    Gs232s.Exchange(i, j);
    SetStatusBar;
    SaveSetting;
    end;
end;

procedure TMain.actForwadRoatatorExecute(Sender: TObject);
var
  i,j: integer;
begin
  //TabSheet の配置を変更
  i := Pagecontrol1.ActivePageIndex;
  if i <=  Pagecontrol1.PageCount - 2 then
    begin
    if i =  0 then
      j := Pagecontrol1.PageCount - 2
    else
      j :=  i - 1;
    Pagecontrol1.ActivePage.PageIndex := j;
    PageControl1.ActivePageIndex := j;         //ActivePage を設定して一番手前に表示
    Rotators.Exchange(i, j);
    Gs232s.Exchange(i, j);
    SetStatusBar;
    SaveSetting;
    end;
end;

procedure TMain.actGotoHomeExecute(Sender: TObject);
begin
  Gs232.GoHome();
end;

procedure TMain.actInsRotatorExecute(Sender: TObject);
var
  i: integer;
  s: string;
begin
  i := PageControl1.ActivePageIndex;
  s := CreateRotatorTitle;

  NewTabSheet := TTabSheet.Create(PageControl1); //新規のTabSheetを作成
  NewTabSheet.Caption     := s;
  NewTabSheet.PageControl := PageControl1; //TabSheet
  NewTabSheet.PageIndex   := i;
  Rotator.Clear;
  Gs232 := TGs232.Create(self);
  InitializeRotator;
  Rotators.Insert(i, Rotator.Text);
  Gs232s.Insert(i, Gs232);
  PageControl1.ActivePageIndex  := i;
  PageControl1.ActivePage.Caption := Rotator.Values[cTitle];
  SetStatusBar;
  SaveSetting;
end;

procedure TMain.actOptionsExecute(Sender: TObject);
var
  i: integer;
  Options: TOptions;
  RelaySet: TRelaySet;
  OptionComPort: TOptionComPort;
begin
  Options := TOptions.Create(self);
  try
    Options.CtrlTableEnable :=  CtrlTableEnable;

    Options.Title           :=  Rotator.Values[cTitle];
    Options.MapFileName     :=  Rotator.Values[cMapFileName];
    Options.Enable          :=  StrToBool(Rotator.Values[cEnable]);
    Options.AutoActive      :=  StrToBool(Rotator.Values[cAutoActive]);
    Options.Model           :=  Gs232.Model;
    Options.CenterPosition  :=  Ord(Gs232.CenterPosition);
    Options.AzimuthAngle    :=  Ord(Gs232.AzimuthAngle);
    Options.RotationSpeed   :=  Gs232.RotationSpeed;
    Options.HomePosition    :=  Gs232.AzHomeD;
    Options.ReturnHome      :=  Gs232.ReturnHome;
    Options.OffsetAngle     :=  Gs232.AzOffsetD;
    Options.CommandB        :=  Gs232.CommandB;
    Options.CommandA        :=  Gs232.CommandA;
    Options.RelaysCount     :=  Gs232.RelayArray.Count;
    Options.CurrentPosition :=  Gs232.AzimuthD;

    Options.Port            :=  Gs232.Port;
    Options.BaudRate        :=  Gs232.BaudRate;
    Options.DataBits        :=  Gs232.DataBits;
    Options.Parity          :=  Gs232.Parity;
    Options.StopBits        :=  Gs232.StopBits;
    Options.FlowControl     :=  Gs232.FlowControl;

    for i := 0 to 1 do
      begin
      RelaySet                    :=  Options.RelaySet[i];

      RelaySet.Enable             :=  RelayBoxs[i].Enable;
      RelaySet.Mode               :=  RelayBoxs[i].Mode;
      RelaySet.SerialNo           :=  RelayBoxs[i].SerialNo;
      RelaySet.Count              :=  RelayBoxs[i].Count;
      OptionComPort               :=  Options.RelaySet[i].OptionComPort;
      OptionComPort.Port          :=  RelayBoxs[i].Port;
      OptionComPort.BaudRate      :=  RelayBoxs[i].BaudRate;
      OptionComPort.DataBits      :=  RelayBoxs[i].DataBits;
      OptionComport.StopBits      :=  RelayBoxs[i].StopBits;
      OptionComPort.Parity        :=  RelayBoxs[i].Parity;
      OptionComPort.FlowControl   :=  RelayBoxs[i].FlowControl;
      end;

    if Options.ShowModal = mrOK then
      begin
      if Gs232.Active then
        Gs232.Close();
      CtrlTableEnable         :=  Options.CtrlTableEnable;
      Rotator.Values[cTitle]          :=  Options.Title;
      Rotator.Values[cMapFileName]    :=  Options.MapFileName;
      Rotator.Values[cEnable]         :=  BoolToStr(Options.Enable);
      Rotator.Values[cAutoActive]     :=  BoolToStr(Options.AutoActive);
      Rotators.Strings[CurrentRotator] := Rotator.Text;
      Gs232.Model             :=  Options.Model;
      Gs232.CenterPosition    :=  TCenterPosition(Options.CenterPosition);
      Gs232.AzimuthAngle      :=  TAzimuthAngle(Options.AzimuthAngle);
      Gs232.RotationSpeed     :=  Options.RotationSpeed;
      Gs232.SetHome(Options.HomePosition);
      Gs232.ReturnHome        :=  Options.ReturnHome;
      Gs232.SetOffset(Options.OffsetAngle);
      Gs232.CommandB          :=  Options.CommandB;
      Gs232.CommandA          :=  Options.CommandA;
      Gs232.RelayArray.Count  :=  Options.RelaysCount;

      Gs232.Port              :=  Options.Port;
      Gs232.BaudRate          :=  Options.BaudRate;
      Gs232.DataBits          :=  Options.DataBits;
      Gs232.Parity            :=  Options.Parity;
      Gs232.StopBits          :=  Options.StopBits;
      Gs232.FlowControl       :=  Options.FlowControl;

    for i := 0 to 1 do
      begin
      RelaySet                    :=  Options.RelaySet[i];
      RelayBoxs[i].Enable         :=  RelaySet.Enable;
      RelayBoxs[i].Mode           :=  RelaySet.Mode;
      RelayBoxs[i].SerialNo       :=  RelaySet.SerialNo;
      RelayBoxs[i].Count          :=  RelaySet.Count;
      OptionComPort               :=  Options.RelaySet[i].OptionComPort;
      RelayBoxs[i].Port           :=  OptionComPort.Port;
      RelayBoxs[i].BaudRate       :=  OptionComPort.BaudRate;
      RelayBoxs[i].DataBits       :=  OptionComPort.DataBits;
      RelayBoxs[i].StopBits       :=  OptionComport.StopBits;
      RelayBoxs[i].Parity         :=  OptionComPort.Parity;
      RelayBoxs[i].FlowControl    :=  OptionComPort.FlowControl;
      end;

      SaveSetting;

      if FileExists(CtrlName) then
        CtrlTable.LoadFromFile(CtrlName);

      if StrToBool(Rotator.Values[cAutoActive]) then
        Gs232.Open();
      SetPanelFace;
      SetBandSwith;

      end;
  finally
    FreeAndNil(Options);
    Init := true;
  end;
end;

//**********************************************************************//
//                                                                      //
//  Control関係処理                                                     //
//                                                                      //
//**********************************************************************//
procedure TMain.btnBand01Click(Sender: TObject);
var
  i: integer;
  lRotater: integer;
//  lOffset: integer;
  lCommand1: string;
  lCommand2: string;
  btn: TButton;
begin
  btn := TButton(Sender);
  for i := 0 to pnlBandSwitch.ControlCount - 1 do
    begin
    TButton(pnlBandSwitch.Controls[i]).Font.Style := [];
    end;

  i := TButton(Sender).Tag;
  btn.Font.Style := [fsBold];
  CtrlTable.Filtered := false;
  if CtrlTable.Locate('Order', i, []) then
    begin
    lRotater  := ctrlTable.FieldByName('Rotator').Asinteger - 1;
//    lOffset   := ctrlTable.FieldByName('Offset').AsInteger;
    lCommand1 := ctrlTable.FieldByName('Command1').AsString;
    lCommand2 := ctrlTable.FieldByName('Command2').AsString;

    RelayControl(BeforeCommand2, lCommand2);
    RelayControl(lCommand1, BeforeCommand1);
    BeforeCommand1 := lCommand1;
    BeforeCommand2 := lCommand2;

    if (lRotater < 0) or (lRotater >= Gs232s.Count) then
      exit;
    PageControl1.ActivePageIndex := LRotater;
    SetRotator(PageControl1.TabIndex);
    end;
end;

procedure TMain.btnCCWClick(Sender: TObject); // 左回転
begin
  btnCCW.Tag := not btnCCW.Tag;
  if boolean(btnCCW.Tag)  then
    btnCcw.Glyph.LoadFromFile(FileCCW_On)
  else
    btnCcw.Glyph.LoadFromFile(FileCCW_Off);

  if boolean(btnCCW.Tag)  then
    Gs232.GoCCW
  else
    Gs232.Stop;           // Az回転停止
end;

procedure TMain.btnClearClick(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TMain.btnCWClick(Sender: TObject);  // 右回転
begin
  btnCW.Tag := not btnCW.Tag;
  if boolean(btnCW.Tag)  then
    btnCw.Glyph.LoadFromFile(FileCW_On)
  else
    btnCw.Glyph.LoadFromFile(FileCW_Off);

  if boolean(btnCW.Tag)  then
    Gs232.GoCw       // Right回転
  else
    Gs232.Stop;
end;

procedure TMain.btnExecuteClick(Sender: TObject);
var
  c1, c2: string;
  s: string;
begin
  if edtCommand.Text = '' then
    exit;
  edtCommand.Text  :=  UpperCase(edtCommand.Text);
  memo1.Lines.Add('S--> ' + edtCommand.Text);
  Gs232.DoCmd(edtCommand.Text + #13);
  c1 := copy(edtCommand.Text, 1, 1);
  c2 := copy(edtCommand.Text, 2, 1);
  if (c1 = 'C') or (c1 = 'B') then
    begin
    s := Gs232.DoRecv(20);
    s := StringReplace(s, #10, '"#10"', [rfReplaceAll]);
    s := StringReplace(s, #13, '"#13"', [rfReplaceAll]);
    memo1.Lines.Add('R--> ' + s);
    end
  else if c1 = 'H' then
    begin
    s := Gs232.DoRecv(2000);
    memo1.Lines.Add('R--> ' + s);
    end;
end;

procedure TMain.btnOpenCloseClick(Sender: TObject);
var
  i: integer;
  s: string;
begin
  if Gs232.Active  then
    Gs232.Close()
  else
    begin
    s := Gs232.Port;
    for i := 0 to Gs232s.Count - 1 do
      if (s = Gs232s[i].Port) and  Gs232s[i].Active then
        begin
        MessageDlg('The port is already open', mtError, [mbOk], 0, mbOk);
        exit;
        end;
    Gs232.Open;
    end;
  SetPanelFace();
end;

procedure TMain.btnSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
  Memo1.Clear;
end;

procedure TMain.btnStopClick(Sender: TObject);
begin
  btnCCW.Tag  := Integer(false);
  btnCW.Tag   := Integer(false);
  btnCcw.Glyph.LoadFromFile(FileCCW_Off);
  btnCw.Glyph.LoadFromFile(FileCW_Off);
  Gs232.Stop;
end;

procedure TMain.btnPresetClick(Sender: TObject);
begin
  Gs232.GoPreset();
end;

procedure TMain.edtPresetDEnter(Sender: TObject);
begin
  BeforeValue := edtPresetD.text;
end;

procedure TMain.edtPresetDExit(Sender: TObject);
var
  i: integer;
begin
  if edtPresetD.Text <> BeforeValue then
    if edtPresetD.Text = '' then
      begin
      Gs232.ResetPreset;
      EraseNeedle(imgPreset);
      end
    else
      begin
      i :=  StrToInt(edtPresetD.Text);    // NumbesOnly=Trueにしてある
      if (i < 0) or ((gs232.AzimuthAngle = az360) and (i > 360))
      or ((gs232.AzimuthAngle = az450) and (i > 450))then
        begin
        MessageDlg('Value exceeds the range', mtError, [mbOk], 0, mbOk);
        edtPreSetD.SetFocus;
        exit;
        end;
      Gs232.SetPreset(i);
      edtPreSetD.Text :=  IntToStr(Gs232.AzPresetD);
      EraseNeedle(imgPreset);
      DrawNeedle(Gs232.AzPresetR, false, imgPreset, FPresetNeedleColor);
      end;
end;

procedure TMain.imgDirectionClick(Sender: TObject);
var
  dx, dy: integer;
  d: double;
begin
  dx := MouseX - NeedleCenterX;
  dy := NeedleCenterY - MouseY;
  if dx = 0 then
    begin
    if (dy = 0) then
      exit
    else if dy > 0 then
      d := pi / 2
    else
      d := pi * 3 / 2;
    end
  else
    d := ArcTan(dy / dx);  // 結果は、XY座標のラジアン
  if dx < 0 then
    d := D + pi;
  d := PI/2 - d;
  if d < 0 then
    d := d + pi2;

  if ssCtrl in KeyShift then
    d := d + pi2;

  case MouseButton of
    mbRight:
      d := d + pi;
  end;
  Gs232.SetPreset(d);
  edtPreSetD.Text :=  IntToStr(Gs232.AzPresetD);
  EraseNeedle(imgPreset);
  DrawNeedle(d, false, imgPreset, FPresetNeedleColor);
  MouseX := 0;
  MouseY := 0;
end;

procedure TMain.imgDirectionDblClick(Sender: TObject);
begin
  Gs232.GoPreset();
end;

procedure TMain.imgDirectionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MouseX := x;
  MouseY := Y;
  MouseButton := Button;
  KeyShift := Shift;
  case Button of
    mbLeft, mbRight:
      begin
      imgDirectionClick(Sender);
      if ssShift in Shift then
        imgDirectionDblClick(Sender);
      end;
    end;
end;

procedure TMain.PageControl1Change(Sender: TObject);
begin
//  PageControl1.TabIndexは変更後の値
  SetRotator(PageControl1.TabIndex);
//  if PageControl1.TabIndex <= PageControl1.PageCount - 2 then
//    begin
//    pnlRotator.BringToFront;
//    CurrentRotator      := PageControl1.TabIndex;
//    Rotator.Text        := Rotators[CurrentRotator];
//    Gs232               := Gs232s[CurrentRotator];
//    Gs232.Current       := true;
//    Gs232.ReachPreset   := OnReachPreset;
//    Gs232.ReachBound    := OnReachBound;
//    Gs232.ChangeAzEl    := OnChangeAzEl;
//    Gs232.RelayArray.ChangeRelays  := OnChangeRelays;
//
//    SetPanelFace;
//    DoDrawNeedle;
//    end
//  else if PageControl1.TabIndex = PageControl1.PageCount - 1 then
//    begin
//    pnlConsole.BringToFront;
//    end;
end;

procedure TMain.PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
begin
//  PageControl1.TabIndexは変更前の値
  ResetRotator(PageControl1.TabIndex);
//  if PageControl1.TabIndex <= Gs232s.Count - 1 then
//    begin
//    Gs232.Current       := false;
//    Gs232.ReachPreset   := nil;
//    Gs232.ReachBound    := nil;
//    Gs232.ChangeAzEl    := nil;
//    Gs232.RelayArray.ChangeRelays  := nil;
//    end;
end;

end.


