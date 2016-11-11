unit Thread_ExecDOSCommand;

interface

uses
  Classes, Windows, Messages, SysUtils, ExtCtrls, StdCtrls, Forms, System.SyncObjs;

type
  TArg<T> = reference to procedure(const Arg: T);

type
  TExecDOSCommand_Thread = class(TThread)
  private
    FThreadState: Integer;      //线程运行状态

    FOwner: TObject;            //所有者，这里是TClientNode对象
    FMainFormHandle: THandle;   //主窗口句柄

    FLock: TCriticalSection;    //锁对象
    FCMDLog: string;            //完整的输出日志
    FReadFromPipeStr: string;   //从控制台管道中读出的字符串
    FCommandLine: string;       //待执行的命令行
    FCMDHandle: THandle;        //控制台程序句柄
    FCMDPID: Cardinal;          //控制台PID
    FMemo_Log: TMemo;
    FCorrectQuit: Boolean;      //是否是正常的退出

    procedure MySleep(Timeout: Integer);
    procedure SetMemo_log(const Value: TMemo);

    procedure InputToMemo;
    procedure CaptureConsoleOutput(const ACommand, AParameters: string; CallBack: TArg<PAnsiChar>);
    procedure AppendOutputToLog(AppendStr: string);
  protected
    procedure Execute; override;
  public
    property ThreadState: Integer read FThreadState;
    property Owner: TObject read FOwner write FOwner;
    property MainFormHandle: THandle read FMainFormHandle write FMainFormHandle;
    property CMDHandle: THandle read FCMDHandle;
    property CMDPID: Cardinal read FCMDPID;
    property Memo_Log: TMemo read FMemo_Log write SetMemo_log;
    property CorrectQuit: Boolean read FCorrectQuit write FCorrectQuit;

    constructor Create(CommandLine: string; CreateSuspended: Boolean);
    destructor Destroy; override;

    function GetWholeLog: string;
  end;

const
  MaxCommandLen = 8191;

implementation

uses
  PublicVar;

{ TExecDOSCommand_Thread }

procedure TExecDOSCommand_Thread.MySleep(Timeout: Integer);
var
  DeadLine: TDateTime;
begin
  DeadLine:= Now + Timeout / 86400000;
  while (not FCorrectQuit) and (Now <= DeadLine) do
    begin
      Application.ProcessMessages;
    end;
end;

procedure TExecDOSCommand_Thread.SetMemo_log(const Value: TMemo);
begin
  FLock.Acquire;
  try
    try
      FMemo_Log:= Value;
    except
      ;
    end;
  finally
    FLock.Release;
  end;
end;

procedure TExecDOSCommand_Thread.InputToMemo;
begin
  if (FMemo_Log = nil) then
    Exit;
  FMemo_Log.Lines.Text:= FMemo_Log.Lines.Text + FReadFromPipeStr;
  FMemo_Log.SelStart:= Length(FMemo_Log.Lines.Text);
  SendMessage(FMemo_Log.Handle, WM_VSCROLL, MAKELONG(SB_BOTTOM, 0), 0);
end;

procedure TExecDOSCommand_Thread.CaptureConsoleOutput(const ACommand, AParameters: string; CallBack: TArg<PAnsiChar>);
const
//  CReadBuffer = 2400;
  CReadBuffer = 115200;
var
  saSecurity: TSecurityAttributes;
  hRead: THandle;
  hWrite: THandle;
  suiStartup: TStartupInfo;
  piProcess: TProcessInformation;
  pBuffer: array [0 .. CReadBuffer] of AnsiChar;
  dBuffer: array [0 .. CReadBuffer] of AnsiChar;
  dRead: DWORD;
  dRunning: DWORD;
  dAvailable: DWORD;
begin
  saSecurity.nLength:= SizeOf(TSecurityAttributes);
  saSecurity.bInheritHandle:= true;
  saSecurity.lpSecurityDescriptor:= nil;
  if CreatePipe(hRead, hWrite, @saSecurity, 0) then
    try
      FillChar(suiStartup, SizeOf(TStartupInfo), #0);
      suiStartup.cb:= SizeOf(TStartupInfo);
      suiStartup.hStdInput:= hRead;
      suiStartup.hStdOutput:= hWrite;
      suiStartup.hStdError:= hWrite;
      suiStartup.dwFlags:= STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
      suiStartup.wShowWindow:= SW_HIDE;
      if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity, @saSecurity, true, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup, piProcess) then
        try
          FCMDHandle:= piProcess.hProcess;
          FCMDPID:= piProcess.dwProcessId;
          repeat
            dRunning:= WaitForSingleObject(piProcess.hProcess, 100);
            PeekNamedPipe(hRead, nil, 0, nil, @dAvailable, nil);
            if (dAvailable > 0) then
              repeat
                dRead:= 0;
                ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
                pBuffer[dRead]:= #0;
                OemToCharA(pBuffer, dBuffer);
                CallBack(dBuffer);
              until (dRead < CReadBuffer);
            Application.ProcessMessages;
          until (dRunning <> WAIT_TIMEOUT);
          FCMDPID:= 0;
        finally
          CloseHandle(piProcess.hProcess);
          CloseHandle(piProcess.hThread);
        end;//try
    finally
      CloseHandle(hRead);
      CloseHandle(hWrite);
    end;//try
end;

procedure TExecDOSCommand_Thread.AppendOutputToLog(AppendStr: string);
begin
  FLock.Acquire;
  try
    try
      FCMDLog:= FCMDLog + AppendStr;
    except
      ;
    end;
  finally
    FLock.Release;
  end;
end;

function TExecDOSCommand_Thread.GetWholeLog: string;
begin
  FLock.Acquire;
  try
    Result:= FCMDLog;
  finally
    FLock.Release;
  end;
end;

constructor TExecDOSCommand_Thread.Create(CommandLine: string; CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);

  FLock:= TCriticalSection.Create;
  FCMDLog:= '';
  FMemo_Log:= nil;
  FCorrectQuit:= False;
  FCommandLine:= CommandLine;
  FThreadState:= 0;
end;

destructor TExecDOSCommand_Thread.Destroy;
begin
  FLock.Free;
  inherited;
end;

procedure TExecDOSCommand_Thread.Execute;
begin
  FThreadState:= 1;
  FCorrectQuit:= False;
  try
    repeat
      FReadFromPipeStr:= '执行命令：' + FCommandLine + #13 + #10;
      AppendOutputToLog(FReadFromPipeStr);
      Synchronize(InputToMemo);
      if Length(FCommandLine) > MaxCommandLen then
        begin
          FReadFromPipeStr:= '命令行字符数大于所允许的最大长度，命令中止！' + #13 + #10;
          AppendOutputToLog(FReadFromPipeStr);
          Synchronize(InputToMemo);
        end
      else
        begin
          FReadFromPipeStr:= '*************************** begin ***************************' + #13 + #10;
          AppendOutputToLog(FReadFromPipeStr);
          Synchronize(InputToMemo);

          CaptureConsoleOutput(FCommandLine, '',
            procedure(const Line: PAnsiChar)
              begin
                FReadFromPipeStr:= string(Line);
                AppendOutputToLog(FReadFromPipeStr);
                Synchronize(InputToMemo);
              end
          );
        end;
      FReadFromPipeStr:= '**************************** end ****************************' + #13 + #10 + #13 + #10;
      AppendOutputToLog(FReadFromPipeStr);
      Synchronize(InputToMemo);

      if (not FCorrectQuit) then
        begin
          if (PublicVar.AutoConn = 0) then
            PostMessage(FMainFormHandle, WM_DOSCOMMANDSTOP, 0, LPARAM(FOwner))
          else
            MySleep(PublicVar.AutoConnTime * 1000);
        end;
    until (Terminated or FCorrectQuit or (PublicVar.AutoConn = 0));

    FThreadState:= 2;
    while not Terminated do
      begin
        Application.ProcessMessages;
        Sleep(200);
      end;
  finally
    FThreadState:= 0;
  end;//try
end;

end.
