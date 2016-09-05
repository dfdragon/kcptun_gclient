program kcptun_gclient;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FMain},
  Class_ClientNode in 'Class_ClientNode.pas',
  PublicVar in 'PublicVar.pas',
  Interface_op in 'Interface_op.pas',
  Thread_ExecDOSCommand in 'Thread_ExecDOSCommand.pas',
  VerInfo in 'VerInfo.pas',
  OneCopy in 'OneCopy.pas',
  superdate in 'superobject\superdate.pas',
  superobject in 'superobject\superobject.pas',
  supertimezone in 'superobject\supertimezone.pas',
  supertypes in 'superobject\supertypes.pas',
  superxmlparser in 'superobject\superxmlparser.pas',
  PublicFun in 'PublicFun.pas',
  Photo in 'Photo.pas' {FPhoto};

{$R *.res}

var
  VerInfoRes: TVerInfoRes;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'KCPTun 客户端配置管理工具';
  VerInfoRes:= TVerInfoRes.Create(Application.ExeName);
  try
    PublicVar.FileVer:= Copy(VerInfoRes.FileVersion, 1, 5);
  finally
    VerInfoRes.Free;
  end;       //取EXE文件的版本信息
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFPhoto, FPhoto);
  Application.Run;
end.
