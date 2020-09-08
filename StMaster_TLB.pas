unit StMaster_TLB;

// ************************************************************************ //
// �x��
// -------
// ���̃t�@�C���Ő錾����Ă���^�̓^�C�v ���C�u��������ǂݎ��ꂽ�f�[�^����
// ��������Ă��܂��B���̃^�C�v ���C�u�����������I���邢�́i���̃^�C�v ���C�u��
// �����Q�Ƃ��Ă���ق��̃^�C�v ���C�u�����o�R�Łj�ԐړI�ɍăC���|�[�g���ꂽ
// ��A�^�C�v ���C�u���C�u�����̕ҏW���Ƀ^�C�v ���C�u���� �G�f�B�^�́m�X�V�n�R�}
// ���h�����s�����ꍇ�A���̃t�@�C���̓��e�͂��ׂčĐ�������A�蓮�ŉ������ύX
// �͂��ׂĎ����܂��B
// ************************************************************************ //

// $Rev: 52393 $
// ���ɐ������ꂽ�^�C�v ���C�u�������� 2015/10/10 5:33:05 �ɐ������ꂽ�t�@�C���B

// ************************************************************************  //
// �^�C�v ���C�u����: C:\Delphi Projects\StMaster\StMaster (1)
// LIBID: {0EB22D3C-2C47-401D-AC53-44A9B209FC93}
// LCID: 0
// �w���v�t�@�C��:
// �w���v������:
// �ˑ��֌W���X�g:
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// �G���[:
//   �q���g: 'StMaster' �̌^��񖼂� 'StMaster_' �ɕύX����܂����B
// ************************************************************************ //
{$TYPEDADDRESS OFF} // �|�C���^�̌^�`�F�b�N���I�t�ɂ��ăR���p�C�����邱��
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;

// *********************************************************************//
// �^�C�v ���C�u�����Ő錾����� GUID. �ȉ��̃v���t�B�b�N�X���g��:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // �^�C�v ���C�u�����̃��W���[ �o�[�W�����ƃ}�C�i�[ �o�[�W����
  StMasterMajorVersion = 1;
  StMasterMinorVersion = 0;

  LIBID_StMaster: TGUID = '{0EB22D3C-2C47-401D-AC53-44A9B209FC93}';

  IID_IStMaster: TGUID = '{44E4330F-F220-4109-8C24-C51B5C0E3E3B}';
  CLASS_StMaster_: TGUID = '{D182F8B5-2ED4-4E91-92B7-1E9D3BD93A32}';
  CLASS_CoStMaster: TGUID = '{69D48E31-E66E-447D-8B22-DAAE4652301C}';
type
// *********************************************************************//
// �^�C�v ���C�u�����Ő錾�����O���Q��
// *********************************************************************//
  IStMaster = interface;
  IStMasterDisp = dispinterface;
// *********************************************************************//
// �^�C�v ���C�u�����Ő錾����� CoClass
// (����: �����Ŋe CoClass �ƃf�t�H���g�̃C���^�[�t�F�C�X���}�b�s���O����)
// *********************************************************************//
  StMaster_ = IStMaster;


// *********************************************************************//
// �C���^�[�t�F�C�X: IStMaster
// �t���O: (4416) Dual OleAutomation Dispatchable
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
// �t���O:     (4416) Dual OleAutomation Dispatchable
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
// �N���X StMaster_ �́ACreate ����� CreateRemote ���\�b�h���g�p����
// CoClass StMaster_ �����J����f�t�H���g�̃C���^�[�t�F�C�X IStMaster ��
// �C���X�^���X���쐬����B���̃^�C�v ���C�u�����̃T�[�o�[�ɂ����
// ���J���ꂽ CoClass �I�u�W�F�N�g�ɑ΂��A�I�[�g���[�V�������s������
// �N���C�A���g���p���邽�߂ɁA�����̊֐������݂���B
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

