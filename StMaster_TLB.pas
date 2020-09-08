unit StMaster_TLB;

// ************************************************************************ //
// 警告
// -------
// このファイルで宣言されている型はタイプ ライブラリから読み取られたデータから
// 生成されています。このタイプ ライブラリが明示的あるいは（このタイプ ライブラ
// リを参照しているほかのタイプ ライブラリ経由で）間接的に再インポートされた
// り、タイプ ライブライブラリの編集中にタイプ ライブラリ エディタの［更新］コマ
// ンドを実行した場合、このファイルの内容はすべて再生成され、手動で加えた変更
// はすべて失われます。
// ************************************************************************ //

// $Rev: 52393 $
// 下に説明されたタイプ ライブラリから 2015/10/10 5:33:05 に生成されたファイル。

// ************************************************************************  //
// タイプ ライブラリ: C:\Delphi Projects\StMaster\StMaster (1)
// LIBID: {0EB22D3C-2C47-401D-AC53-44A9B209FC93}
// LCID: 0
// ヘルプファイル:
// ヘルプ文字列:
// 依存関係リスト:
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// エラー:
//   ヒント: 'StMaster' の型情報名が 'StMaster_' に変更されました。
// ************************************************************************ //
{$TYPEDADDRESS OFF} // ポインタの型チェックをオフにしてコンパイルすること
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;

// *********************************************************************//
// タイプ ライブラリで宣言される GUID. 以下のプレフィックスを使う:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // タイプ ライブラリのメジャー バージョンとマイナー バージョン
  StMasterMajorVersion = 1;
  StMasterMinorVersion = 0;

  LIBID_StMaster: TGUID = '{0EB22D3C-2C47-401D-AC53-44A9B209FC93}';

  IID_IStMaster: TGUID = '{44E4330F-F220-4109-8C24-C51B5C0E3E3B}';
  CLASS_StMaster_: TGUID = '{D182F8B5-2ED4-4E91-92B7-1E9D3BD93A32}';
  CLASS_CoStMaster: TGUID = '{69D48E31-E66E-447D-8B22-DAAE4652301C}';
type
// *********************************************************************//
// タイプ ライブラリで宣言される前方参照
// *********************************************************************//
  IStMaster = interface;
  IStMasterDisp = dispinterface;
// *********************************************************************//
// タイプ ライブラリで宣言される CoClass
// (注意: ここで各 CoClass とデフォルトのインターフェイスをマッピングする)
// *********************************************************************//
  StMaster_ = IStMaster;


// *********************************************************************//
// インターフェイス: IStMaster
// フラグ: (4416) Dual OleAutomation Dispatchable
// GUID: {44E4330F-F220-4109-8C24-C51B5C0E3E3B}
// *********************************************************************//
  IStMaster = interface(IDispatch)
    ['{44E4330F-F220-4109-8C24-C51B5C0E3E3B}']
    function Get_Enable: WordBool; safecall;
    function Get_RotatorCount: Integer; safecall;
    function Get_RotatorIndex: Integer; safecall;
    function GetRotatorActive(RotatorIndex: Integer): WordBool; stdcall;
    procedure GetRotatorTitle(RotatorIndex: Integer; out GetRotatorTitle: WideString); safecall;
    function GetRotatorAzumuth(RotatorIndex: Integer): Integer; stdcall;
    function Move(RotatorIndex: Integer; Azimuth: Integer): WordBool; stdcall;
    function Open(RotatorIndex: Integer): WordBool; stdcall;
    function Close(RotatorIndex: Integer): WordBool; stdcall;
    function Rotate(Azimuth: Integer; Freq: Single): WordBool; stdcall;
    property Enable: WordBool read Get_Enable;
    property RotatorCount: Integer read Get_RotatorCount;
    property RotatorIndex: Integer read Get_RotatorIndex;
  end;

// *********************************************************************//
// DispIntf:  IStMasterDisp
// フラグ:     (4416) Dual OleAutomation Dispatchable
// GUID:      {44E4330F-F220-4109-8C24-C51B5C0E3E3B}
// *********************************************************************//
  IStMasterDisp = dispinterface
    ['{44E4330F-F220-4109-8C24-C51B5C0E3E3B}']
    property Enable: WordBool readonly dispid 1;
    property RotatorCount: Integer readonly dispid 2;
    property RotatorIndex: Integer readonly dispid 3;
    function GetRotatorActive(RotatorIndex: Integer): WordBool; dispid 4;
    procedure GetRotatorTitle(RotatorIndex: Integer; out GetRotatorTitle: WideString); dispid 5;
    function GetRotatorAzumuth(RotatorIndex: Integer): Integer; dispid 6;
    function Move(RotatorIndex: Integer; Azimuth: Integer): WordBool; dispid 9;
    function Open(RotatorIndex: Integer): WordBool; dispid 7;
    function Close(RotatorIndex: Integer): WordBool; dispid 8;
    function Rotate(Azimuth: Integer; Freq: Single): WordBool; dispid 10;
  end;

// *********************************************************************//
// クラス StMaster_ は、Create および CreateRemote メソッドを使用して
// CoClass StMaster_ が公開するデフォルトのインターフェイス IStMaster の
// インスタンスを作成する。このタイプ ライブラリのサーバーによって
// 公開された CoClass オブジェクトに対し、オートメーションを行いたい
// クライアントが用いるために、これらの関数が存在する。
// *********************************************************************//
  CoStMaster_ = class
    class function Create: IStMaster;
    class function CreateRemote(const MachineName: string): IStMaster;
  end;

implementation

uses System.Win.ComObj;

class function CoStMaster_.Create: IStMaster;
begin
  Result := CreateComObject(CLASS_StMaster_) as IStMaster;
end;

class function CoStMaster_.CreateRemote(const MachineName: string): IStMaster;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_StMaster_) as IStMaster;
end;

end.

