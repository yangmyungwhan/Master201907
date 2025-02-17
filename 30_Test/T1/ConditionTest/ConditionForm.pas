unit ConditionForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmCondition = class(TForm)
    edtId: TEdit;
    edtPwd: TEdit;
    Button1: TButton;
    mmoIds: TMemo;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FIds: array of string;
    FPwds: array of string;
  public
    { Public declarations }
    procedure InitData;

    function LoginCheck(AId, APwd: string): Integer;
  end;

var
  frmCondition: TfrmCondition;

const
  LOGIN_RESULT_OK           = 0;
  LOGIN_RESULT_NOTFOUND_ID  = 10;
  LOGIN_RESULT_INCORRECT    = 20;
  LOGIN_RESULT_EMPTY        = 30;

implementation

{$R *.dfm}

{ TForm2 }

procedure TfrmCondition.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  InitData;

  for I := 0 to Length(FIds) - 1 do
    mmoIds.Lines.Add(FIds[I] + '/' + FPwds[I]);
end;

procedure TfrmCondition.InitData;
begin
  FIds  := ['abc', 'test', 'yourid', 'myid', 'unknown'];
  FPwds := ['123', '123', '123', '123', '123'];
end;

function TfrmCondition.LoginCheck(AId, APwd: string): Integer;
begin
  { TODO : 아이디와 비밀번호가 없는(공백) 경우 30을 반환 }

  { TODO : 아이디가 FIds 배열안에 없는 경우 10 반환 }

  { TODO : 비밀번호가 맞지 않는 경우 20을 반환 }

  { TODO : 아이디 비밀번호가 맞는 경우 0 반환 }

  Result := LOGIN_RESULT_OK;
end;

procedure TfrmCondition.Button1Click(Sender: TObject);
var
  LoginResult: Integer;
begin
  LoginResult := LoginCheck(edtId.Text, edtPwd.Text);

  if LoginResult > 0 then
  begin
    case LoginResult of
    LOGIN_RESULT_NOTFOUND_ID,
    LOGIN_RESULT_INCORRECT:   ShowMessage('아이디 또는 비밀번호가 맞지 않습니다.');
    LOGIN_RESULT_EMPTY:       ShowMessage('아이디와 비밀번호를 입력하세요.');
    end;
    Exit;
  end;

  ShowMessage('로그인 성공');
end;

end.
