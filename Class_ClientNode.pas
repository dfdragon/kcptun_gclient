unit Class_ClientNode;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, Xml.XMLIntf, Xml.XMLDoc, Winapi.ActiveX,
  Thread_ExecDOSCommand, Vcl.StdCtrls, Vcl.Forms, System.JSON, Winapi.TlHelp32;

type
  TClientNode = class
  private
    FMainFormHandle: THandle;

    FMemo_Log: TMemo;
    FWholeLog: string;

    FCorrectQuit: Boolean;

    FCMDThread: TExecDOSCommand_Thread;

    FXMLDocument_Para: TXMLDocument;
    FXMLNode: IXMLNode;     //对应xml中的节点
    FCanModifyXML: Boolean;

    FID: string;
    FRunState: string;
    FRemark: string;

    FisJson: Integer;               FJson: string;

    FLocalPort: string;
    FKCPServerIP: string;
    FKCPServerPort: string;

    FisKey: Integer;                FKey: string;
    FisCrypt: Integer;              FCrypt: string;
    FisNoComp: Integer;
    FisDataShard: Integer;          FDataShard: string;
    FisParityShard: Integer;        FParityShard: string;
    FisConn: Integer;               FConn: string;
    FisMTU: Integer;                FMTU: string;
    FisSndWnd: Integer;             FSndWnd: string;
    FisRcvWnd: Integer;             FRcvWnd: string;
    FisDSCP: Integer;               FDSCP: string;
    FisAutoExpire: Integer;         FAutoExpire: string;

    FisMode: Integer;               FMode: string;
    FisNoDelay: Integer;
    FisInterval: Integer;           FInterval: string;
    FisResend: Integer;             FResend: string;
    FisNC: Integer;

    FisACKNoDelay: Integer;
    FisKeepAlive: Integer;          FKeepAlive: string;
    FisSockBuf: Integer;            FSockBuf: string;

    procedure initPara;
    function GetisRunCMD(): Integer;

    procedure SetMemo_log(const Value: TMemo);

    procedure SetCorrectQuit(const Value: Boolean);

    procedure SetRunState(const Value: string);
    procedure SetRemark(const Value: string);

    procedure SetisJson(const Value: Integer);
    procedure SetJson(const Value: string);

    procedure SetLocalPort(const Value: string);
    procedure SetKCPServerIP(const Value: string);
    procedure SetKCPServerPort(const Value: string);

    procedure SetisKey(const Value: Integer);
    procedure SetKey(const Value: string);

    procedure SetisCrypt(const Value: Integer);
    procedure SetCrypt(const Value: string);

    procedure SetisNoComp(const Value: Integer);

    procedure SetisDataShard(const Value: Integer);
    procedure SetDataShard(const Value: string);

    procedure SetisParityShard(const Value: Integer);
    procedure SetParityShard(const Value: string);

    procedure SetisConn(const Value: Integer);
    procedure SetConn(const Value: string);

    procedure SetisMTU(const Value: Integer);
    procedure SetMTU(const Value: string);

    procedure SetisSndWnd(const Value: Integer);
    procedure SetSndWnd(const Value: string);

    procedure SetisRcvWnd(const Value: Integer);
    procedure SetRcvWnd(const Value: string);

    procedure SetisDSCP(const Value: Integer);
    procedure SetDSCP(const Value: string);

    procedure SetisAutoExpire(const Value: Integer);
    procedure SetAutoExpire(const Value: string);

    procedure SetisMode(const Value: Integer);
    procedure SetMode(const Value: string);

    procedure SetisNoDelay(const Value: Integer);

    procedure SetisInterval(const Value: Integer);
    procedure SetInterval(const Value: string);

    procedure SetisResend(const Value: Integer);
    procedure SetResend(const Value: string);

    procedure SetisNC(const Value: Integer);

    procedure SetisACKNoDelay(const Value: Integer);

    procedure SetisKeepAlive(const Value: Integer);
    procedure SetKeepAlive(const Value: string);

    procedure SetisSockBuf(const Value: Integer);
    procedure SetSockBuf(const Value: string);
  public
    property MainFormHandle: THandle read FMainFormHandle write FMainFormHandle;

    property Memo_Log: TMemo read FMemo_Log write SetMemo_log;
    property WholeLog: string read FWholeLog write FWholeLog;

    property CorrectQuit: Boolean read FCorrectQuit write SetCorrectQuit;

    property XMLDocument_Para: TXMLDocument read FXMLDocument_Para write FXMLDocument_Para;
    property XMLNode: IXMLNode read FXMLNode write FXMLNode;
    property CanModifyXML: Boolean read FCanModifyXML write FCanModifyXML;
    property isRunCMD: Integer read GetisRunCMD;

    property ID: string read FID write FID;
    property RunState: string read FRunState write SetRunState;
    property Remark: string read FRemark write SetRemark;

    property isJson: Integer read FisJson write SetisJson;
    property Json: string read FJson write SetJson;

    //基础参数
    property LocalPort: string read FLocalPort write SetLocalPort;
    property KCPServerIP: string read FKCPServerIP write SetKCPServerIP;
    property KCPServerPort: string read FKCPServerPort write SetKCPServerPort;

    //可选参数
    property isKey: Integer read FisKey write SetisKey;
    property Key: string read FKey write SetKey;

    property isCrypt: Integer read FisCrypt write SetisCrypt;
    property Crypt: string read FCrypt write SetCrypt;

    property isNoComp: Integer read FisNoComp write SetisNoComp;

    property isDataShard: Integer read FisDataShard write SetisDataShard;
    property DataShard: string read FDataShard write SetDataShard;

    property isParityShard: Integer read FisParityShard write SetisParityShard;
    property ParityShard: string read FParityShard write SetParityShard;

    property isConn: Integer read FisConn write SetisConn;
    property Conn: string read FConn write SetConn;

    property isMTU: Integer read FisMTU write SetisMTU;
    property MTU: string read FMTU write SetMTU;

    property isSndWnd: Integer read FisSndWnd write SetisSndWnd;
    property SndWnd: string read FSndWnd write SetSndWnd;

    property isRcvWnd: Integer read FisRcvWnd write SetisRcvWnd;
    property RcvWnd: string read FRcvWnd write SetRcvWnd;

    property isDSCP: Integer read FisDSCP write SetisDSCP;
    property DSCP: string read FDSCP write SetDSCP;

    property isAutoExpire: Integer read FisAutoExpire write SetisAutoExpire;
    property AutoExpire: string read FAutoExpire write SetAutoExpire;

    //传输模式
    property isMode: Integer read FisMode write SetisMode;
    property Mode: string read FMode write SetMode;

    property isNoDelay: Integer read FisNoDelay write SetisNoDelay;

    property isInterval: Integer read FisInterval write SetisInterval;
    property Interval: string read FInterval write SetInterval;

    property isResend: Integer read FisResend write SetisResend;
    property Resend: string read FResend write SetResend;

    property isNC: Integer read FisNC write SetisNC;

    //隐藏参数
    property isACKNoDelay: Integer read FisACKNoDelay write SetisACKNoDelay;

    property isKeepAlive: Integer read FisKeepAlive write SetisKeepAlive;
    property KeepAlive: string read FKeepAlive write SetKeepAlive;

    property isSockBuf: Integer read FisSockBuf write SetisSockBuf;
    property SockBuf: string read FSockBuf write SetSockBuf;

    constructor Create;
    destructor Destroy; override;

    function ReadFromXMLNode(XMLClientNode: IXMLNode): Integer;
    function WriteToXMLNode(XMLClientNode: IXMLNode): Integer;

    function ModifyXMLNodeAttributes(Tag: string; AttributesName: string; AttributesValue: string): Integer;
    function ModifyXMLNodeValue(Tag: string; TagValue: string): Integer;
    function CreateCMDLine(ClientEXEPathName: string): string;
    function CreateJSONConfig(): string;
    function ReadFromJSONConfig(JSONStr: string): Integer;
    function GetHandle(): THandle;
    function GetPID(): Cardinal;
    function RunCommand(CommandLine: string): Integer;
    function StopCommand(): Integer;

    function SuspendCommand(): Integer;
    function ResumeCommand(): Integer;

    function GetWholeCommandOutput(): string;
  end;

function OpenThread(dwDesiredAccess: DWORD; bInheritHandle: BOOL; dwProcessId: DWORD): THandle; stdcall;

implementation

uses
  superobject;

function OpenThread; external kernel32 name 'OpenThread';

procedure TClientNode.initPara;
begin
  FisJson:= 0;            FJson:= '';

  FLocalPort:= '9527';    FKCPServerIP:= '127.0.0.1';   FKCPServerPort:= '29900';

  FisKey:= 0;             FKey:= '';
  FisCrypt:= 0;           FCrypt:= '';
  FisNoComp:= 0;
  FisDataShard:= 0;       FDataShard:= '';
  FisParityShard:= 0;     FParityShard:= '';
  FisConn:= 0;            FConn:= '';
  FisMTU:= 0;             FMTU:= '';
  FisSndWnd:= 0;          FSndWnd:= '';
  FisRcvWnd:= 0;          FRcvWnd:= '';
  FisDSCP:= 0;            FDSCP:= '';
  FisAutoExpire:= 0;      FAutoExpire:= '';

  FisMode:= 0;            FMode:= '';
  FisNoDelay:= 0;
  FisInterval:= 0;        FInterval:= '';
  FisResend:= 0;          FResend:= '';
  FisNC:= 0;

  FisACKNoDelay:= 0;
  FisKeepAlive:= 0;       FKeepAlive:= '';
  FisSockBuf:= 0;         FSockBuf:= '';
end;

constructor TClientNode.Create;
var
  NodeGUID: TGUID;
begin
  inherited;

  FMemo_Log:= nil;
  FWholeLog:= '';

  FCMDThread:= nil;
  FXMLNode:= nil;
  FCanModifyXML:= True;

  CoCreateGuid(NodeGUID);
  FID:= GUIDToString(NodeGUID);
  FRunState:= '0';
  FRemark:= '';

  initPara;
end;

destructor TClientNode.Destroy;
begin
  FCMDThread.Free;
  inherited;
end;

procedure TClientNode.SetMemo_log(const Value: TMemo);
begin
  if (FCMDThread <> nil) then
    FCMDThread.Memo_Log:= Value;
  FMemo_Log:= Value;
end;

procedure TClientNode.SetCorrectQuit(const Value: Boolean);
begin
  if (FCMDThread <> nil) then
    FCMDThread.CorrectQuit:= Value;
  FCorrectQuit:= Value;
end;

function TClientNode.GetisRunCMD: Integer;
begin
  Result:= 1;
  if (FCMDThread = nil) then
    Result:= 0;
end;

procedure TClientNode.SetRunState(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.Attributes['runstate']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FRunState:= Value;
end;

procedure TClientNode.SetRemark(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.Attributes['remark']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FRemark:= Value;
end;

procedure TClientNode.SetisJson(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('json').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisJson:= Value;
end;

procedure TClientNode.SetJson(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('json').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FJson:= Value;
end;

procedure TClientNode.SetLocalPort(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('localport').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FLocalPort:= Value;
end;

procedure TClientNode.SetKCPServerIP(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('kcpserverip').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FKCPServerIP:= Value;
end;

procedure TClientNode.SetKCPServerPort(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('kcpserverport').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FKCPServerPort:= Value;
end;

procedure TClientNode.SetisKey(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('key').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisKey:= Value;
end;

procedure TClientNode.SetKey(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('key').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FKey:= Value;
end;

procedure TClientNode.SetisCrypt(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('crypt').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisCrypt:= Value;
end;

procedure TClientNode.SetCrypt(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('crypt').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FCrypt:= Value;
end;

procedure TClientNode.SetisNoComp(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('nocomp').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisNoComp:= Value;
end;

procedure TClientNode.SetisDataShard(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('datashard').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisDataShard:= Value;
end;

procedure TClientNode.SetDataShard(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('datashard').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FDataShard:= Value;
end;

procedure TClientNode.SetisParityShard(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('parityshard').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisParityShard:= Value;
end;

procedure TClientNode.SetParityShard(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('parityshard').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FParityShard:= Value;
end;

procedure TClientNode.SetisConn(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('conn').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisConn:= Value;
end;

procedure TClientNode.SetConn(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('conn').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FConn:= Value;
end;

procedure TClientNode.SetisMTU(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('mtu').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisMTU:= Value;
end;

procedure TClientNode.SetMTU(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('mtu').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FMTU:= Value;
end;

procedure TClientNode.SetisSndWnd(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('sndwnd').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisSndWnd:= Value;
end;

procedure TClientNode.SetSndWnd(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('sndwnd').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FSndWnd:= Value;
end;

procedure TClientNode.SetisRcvWnd(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('rcvwnd').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisRcvWnd:= Value;
end;

procedure TClientNode.SetRcvWnd(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('rcvwnd').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FRcvWnd:= Value;
end;

procedure TClientNode.SetisDSCP(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('dscp').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisDSCP:= Value;
end;

procedure TClientNode.SetDSCP(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('dscp').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FDSCP:= Value;
end;

procedure TClientNode.SetisAutoExpire(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('autoexpire').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisAutoExpire:= Value;
end;

procedure TClientNode.SetAutoExpire(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('autoexpire').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FAutoExpire:= Value;
end;

procedure TClientNode.SetisMode(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('mode').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisMode:= Value;
end;

procedure TClientNode.SetMode(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('mode').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FMode:= Value;
end;

procedure TClientNode.SetisNoDelay(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('nodelay').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisNoDelay:= Value;
end;

procedure TClientNode.SetisInterval(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('interval').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisInterval:= Value;
end;

procedure TClientNode.SetInterval(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('interval').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FInterval:= Value;
end;

procedure TClientNode.SetisResend(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('resend').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisResend:= Value;
end;

procedure TClientNode.SetResend(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('resend').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FResend:= Value;
end;

procedure TClientNode.SetisNC(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('nc').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisNC:= Value;
end;

procedure TClientNode.SetisACKNoDelay(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('acknodelay').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisACKNoDelay:= Value;
end;

procedure TClientNode.SetisKeepAlive(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('keepalive').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisKeepAlive:= Value;
end;

procedure TClientNode.SetKeepAlive(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('keepalive').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FKeepAlive:= Value;
end;

procedure TClientNode.SetisSockBuf(const Value: Integer);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('sockbuf').Attributes['enable']:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FisSockBuf:= Value;
end;

procedure TClientNode.SetSockBuf(const Value: string);
begin
  if FCanModifyXML then
    begin
      FXMLNode.ChildNodes.FindNode('sockbuf').NodeValue:= Value;
      FXMLDocument_Para.SaveToFile;
    end;
  FSockBuf:= Value;
end;

function TClientNode.ReadFromXMLNode(XMLClientNode: IXMLNode): Integer;
var
  DealNode: IXMLNode;
begin
  Result:= 0;
  try
    FID:= VarToStr(XMLClientNode.Attributes['id']).Trim;
    FRunState:= VarToStr(XMLClientNode.Attributes['runstate']).Trim;
    FRemark:= VarToStr(XMLClientNode.Attributes['remark']);

    DealNode:= XMLClientNode.ChildNodes.FindNode('json');
    FisJson:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FJson:= VarToStr(DealNode.NodeValue);

    FLocalPort:= VarToStr(XMLClientNode.ChildNodes.FindNode('localport').NodeValue).Trim;
    FKCPServerIP:= VarToStr(XMLClientNode.ChildNodes.FindNode('kcpserverip').NodeValue).Trim;
    FKCPServerPort:= VarToStr(XMLClientNode.ChildNodes.FindNode('kcpserverport').NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('key');
    FisKey:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FKey:= VarToStr(DealNode.NodeValue);

    DealNode:= XMLClientNode.ChildNodes.FindNode('crypt');
    FisCrypt:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FCrypt:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('nocomp');
    FisNoComp:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);

    DealNode:= XMLClientNode.ChildNodes.FindNode('datashard');
    FisDataShard:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FDataShard:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('parityshard');
    FisParityShard:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FParityShard:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('conn');
    FisConn:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FConn:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('mtu');
    FisMTU:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FMTU:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('sndwnd');
    FisSndWnd:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FSndWnd:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('rcvwnd');
    FisRcvWnd:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FRcvWnd:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('dscp');
    FisDSCP:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FDSCP:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('autoexpire');
    FisAutoExpire:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FAutoExpire:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('mode');
    FisMode:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FMode:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('nodelay');
    FisNoDelay:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);

    DealNode:= XMLClientNode.ChildNodes.FindNode('interval');
    FisInterval:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FInterval:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('resend');
    FisResend:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FResend:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('nc');
    FisNC:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);

    DealNode:= XMLClientNode.ChildNodes.FindNode('acknodelay');
    FisACKNoDelay:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);

    DealNode:= XMLClientNode.ChildNodes.FindNode('keepalive');
    FisKeepAlive:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FKeepAlive:= VarToStr(DealNode.NodeValue).Trim;

    DealNode:= XMLClientNode.ChildNodes.FindNode('sockbuf');
    FisSockBuf:= StrToInt(VarToStr(DealNode.Attributes['enable']).Trim);
    FSockBuf:= VarToStr(DealNode.NodeValue).Trim;
  except
    Result:= 1;
  end;
end;

function TClientNode.WriteToXMLNode(XMLClientNode: IXMLNode): Integer;
var
  DealNode: IXMLNode;
begin
  Result:= 0;
  try
    XMLClientNode.Attributes['id']:= FID;
    XMLClientNode.Attributes['runstate']:= FRunState;
    XMLClientNode.Attributes['remark']:= FRemark;

    DealNode:= XMLClientNode.AddChild('json');
    DealNode.Attributes['enable']:= FisJson;
    DealNode.NodeValue:= FJson;

    DealNode:= XMLClientNode.AddChild('localport');
    DealNode.NodeValue:= FLocalPort;
    DealNode:= XMLClientNode.AddChild('kcpserverip');
    DealNode.NodeValue:= FKCPServerIP;
    DealNode:= XMLClientNode.AddChild('kcpserverport');
    DealNode.NodeValue:= FKCPServerPort;

    DealNode:= XMLClientNode.AddChild('key');
    DealNode.Attributes['enable']:= FisKey;
    DealNode.NodeValue:= FKey;
    
    DealNode:= XMLClientNode.AddChild('crypt');
    DealNode.Attributes['enable']:= FisCrypt;
    DealNode.NodeValue:= FCrypt;
   
    DealNode:= XMLClientNode.AddChild('nocomp');
    DealNode.Attributes['enable']:= FisNoComp;

    DealNode:= XMLClientNode.AddChild('datashard');
    DealNode.Attributes['enable']:= FisDataShard;
    DealNode.NodeValue:= FDataShard;

    DealNode:= XMLClientNode.AddChild('parityshard');
    DealNode.Attributes['enable']:= FisParityShard;
    DealNode.NodeValue:= FParityShard;

    DealNode:= XMLClientNode.AddChild('conn');
    DealNode.Attributes['enable']:= FisConn;
    DealNode.NodeValue:= FConn;

    DealNode:= XMLClientNode.AddChild('mtu');
    DealNode.Attributes['enable']:= FisMTU;
    DealNode.NodeValue:= FMTU;

    DealNode:= XMLClientNode.AddChild('sndwnd');
    DealNode.Attributes['enable']:= FisSndWnd;
    DealNode.NodeValue:= FSndWnd;

    DealNode:= XMLClientNode.AddChild('rcvwnd');
    DealNode.Attributes['enable']:= FisRcvWnd;
    DealNode.NodeValue:= FRcvWnd;

    DealNode:= XMLClientNode.AddChild('dscp');
    DealNode.Attributes['enable']:= FisDSCP;
    DealNode.NodeValue:= FDSCP;

    DealNode:= XMLClientNode.AddChild('autoexpire');
    DealNode.Attributes['enable']:= FisAutoExpire;
    DealNode.NodeValue:= FAutoExpire;

    DealNode:= XMLClientNode.AddChild('mode');
    DealNode.Attributes['enable']:= FisMode;
    DealNode.NodeValue:= FMode;

    DealNode:= XMLClientNode.AddChild('nodelay');
    DealNode.Attributes['enable']:= FisNoDelay;

    DealNode:= XMLClientNode.AddChild('interval');
    DealNode.Attributes['enable']:= FisInterval;
    DealNode.NodeValue:= FInterval;

    DealNode:= XMLClientNode.AddChild('resend');
    DealNode.Attributes['enable']:= FisResend;
    DealNode.NodeValue:= FResend;

    DealNode:= XMLClientNode.AddChild('nc');
    DealNode.Attributes['enable']:= FisNC;

    DealNode:= XMLClientNode.AddChild('acknodelay');
    DealNode.Attributes['enable']:= FisACKNoDelay;

    DealNode:= XMLClientNode.AddChild('keepalive');
    DealNode.Attributes['enable']:= FisKeepAlive;
    DealNode.NodeValue:= FKeepAlive;

    DealNode:= XMLClientNode.AddChild('sockbuf');
    DealNode.Attributes['enable']:= FisSockBuf;
    DealNode.NodeValue:= FSockBuf;

//    FXMLDocument_Para.SaveToFile;
  except
    Result:= 1;
  end;
end;

function TClientNode.ModifyXMLNodeAttributes(Tag: string; AttributesName: string; AttributesValue: string): Integer;
var
  DealNode: IXMLNode;
begin
  Result:= 0;
  try
    DealNode:= FXMLNode.ChildNodes.FindNode(Tag);
    DealNode.Attributes[AttributesName]:= AttributesValue;
  except
    Result:= 1;
  end;
end;

function TClientNode.ModifyXMLNodeValue(Tag: string; TagValue: string): Integer;
var
  DealNode: IXMLNode;
begin
  Result:= 0;
  try
    DealNode:= FXMLNode.ChildNodes.FindNode(Tag);
    DealNode.NodeValue:= TagValue;
  except
    Result:= 1;
  end;
end;

function TClientNode.CreateCMDLine(ClientEXEPathName: string): string;
var
  CMDLine: string;
begin
  CMDLine:= AnsiQuotedStr(ClientEXEPathName, Char('"'));

  if (FisJson <> 0) and (FJson.Trim <> '') then
    begin
      CMDLine:= CMDLine + ' -c ' + AnsiQuotedStr(FJson.Trim, Char('"'));;
      Result:= Trim(CMDLine);
      Exit;
    end;

  //基础参数
  CMDLine:= CMDLine + ' -l :' + FLocalPort + ' -r ' + FKCPServerIP + ':' + FKCPServerPort;

  //需要与服务端保持一致
  if (FisKey <> 0) and (FKey.Trim <> '') then
    CMDLine:= CMDLine + ' -key "' + StringReplace(FKey, '"', '"""', [rfReplaceAll]) + '"';
  if (FisCrypt <> 0) and (FCrypt.Trim <> '') then
    CMDLine:= CMDLine + ' -crypt ' + FCrypt;
  if (FisNoComp <> 0) then
    CMDLine:= CMDLine + ' -nocomp';
  if (FisDataShard <> 0) and (FDataShard.Trim <> '') then
    CMDLine:= CMDLine + ' -datashard ' + FDataShard;
  if (FisParityShard <> 0) and (FParityShard.Trim <> '') then
    CMDLine:= CMDLine + ' -parityshard ' + FParityShard;

  //可选参数
  if (FisConn <> 0) and (FConn.Trim <> '') then
    CMDLine:= CMDLine + ' -conn ' + FConn;
  if (FisMTU <> 0) and (FMTU.Trim <> '') then
    CMDLine:= CMDLine + ' -mtu ' + FMTU;
  if (FisSndWnd <> 0) and (FSndWnd.Trim <> '') then
    CMDLine:= CMDLine + ' -sndwnd ' + FSndWnd;
  if (FisRcvWnd <> 0) and (FRcvWnd.Trim <> '') then
    CMDLine:= CMDLine + ' -rcvwnd ' + FRcvWnd;
  if (FisDSCP <> 0) and (FDSCP.Trim <> '') then
    CMDLine:= CMDLine + ' -dscp ' + FDSCP;
  if (FisAutoExpire <> 0) and (FAutoExpire.Trim <> '') then
    CMDLine:= CMDLine + ' -autoexpire ' + FAutoExpire;

  //隐藏参数
  if (FisACKNoDelay <> 0) then
    CMDLine:= CMDLine + ' -acknodelay';
  if (FisKeepAlive <> 0) and (FKeepAlive.Trim <> '') then
    CMDLine:= CMDLine + ' -keepalive ' + FKeepAlive;
  if (FisSockBuf <> 0) and (FSockBuf.Trim <> '') then
    CMDLine:= CMDLine + ' -sockbuf ' + FSockBuf;

  //可手工调整参数
  if (FisMode <> 0) and (FMode.Trim <> '') then
    begin
      CMDLine:= CMDLine + ' -mode ' + FMode;
      if (FMode = 'manual') then
        begin
          if (FisNoDelay <> 0) then
            CMDLine:= CMDLine + ' -nodelay 1'
          else
            CMDLine:= CMDLine + ' -nodelay 0';
          if (FisInterval <> 0) and (FInterval.Trim <> '') then
            CMDLine:= CMDLine + ' -interval ' + FInterval;
          if (FisResend <> 0) and (FResend.Trim <> '') then
            CMDLine:= CMDLine + ' -resend ' + FResend;
          if (FisNC <> 0) then
            CMDLine:= CMDLine + ' -nc 1'
          else
            CMDLine:= CMDLine + ' -nc 0';
        end;
    end;

  Result:= Trim(CMDLine);
end;

function TClientNode.CreateJSONConfig(): string;
var
  JSONObject: TJSONObject;
  ResultJSON: ISuperObject;
begin
  JSONObject:= TJSONObject.Create;
  try
    if (FLocalPort.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('localaddr', ':' + FLocalPort.Trim));
    if (FKCPServerIP.Trim <> '') and (FKCPServerPort.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('remoteaddr', (FKCPServerIP.Trim + ':' + FKCPServerPort.Trim)));

    if (FisKey <> 0) and (FKey.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('key', FKey.Trim));
    if (FisCrypt <> 0) and (FCrypt.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('crypt', FCrypt.Trim));

    if (FisNoComp <> 0) then
      JSONObject.AddPair(TJSONPair.Create('nocomp', TJSONTrue.Create))
    else
      JSONObject.AddPair(TJSONPair.Create('nocomp', TJSONFalse.Create));

    if (FisDataShard <> 0) and (FDataShard.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('datashard', TJSONNumber.Create(FDataShard.Trim)));
    if (FisParityShard <> 0) and (FParityShard.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('parityshard', TJSONNumber.Create(FParityShard.Trim)));
    if (FisConn <> 0) and (FConn.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('conn', TJSONNumber.Create(FConn.Trim)));
    if (FisMTU <> 0) and (FMTU.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('mtu', TJSONNumber.Create(FMTU.Trim)));
    if (FisSndWnd <> 0) and (FSndWnd.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('sndwnd', TJSONNumber.Create(FSndWnd.Trim)));
    if (FisRcvWnd <> 0) and (FRcvWnd.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('rcvwnd', TJSONNumber.Create(FRcvWnd.Trim)));
    if (FisDSCP <> 0) and (FDSCP.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('dscp', TJSONNumber.Create(FDSCP.Trim)));
    if (FisAutoExpire <> 0) and (FAutoExpire.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('autoexpire', TJSONNumber.Create(FAutoExpire.Trim)));

    if (FisMode <> 0) and (FMode.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('mode', FMode.Trim));
    JSONObject.AddPair(TJSONPair.Create('nodelay', TJSONNumber.Create(FisNoDelay)));
    if (FisInterval <> 0) and (FInterval.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('interval', TJSONNumber.Create(FInterval.Trim)));
    if (FisResend <> 0) and (FResend.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('resend', TJSONNumber.Create(FResend.Trim)));
    JSONObject.AddPair(TJSONPair.Create('nc', TJSONNumber.Create(FisNC)));

    if (FisACKNoDelay <> 0) then
      JSONObject.AddPair(TJSONPair.Create('acknodelay', TJSONTrue.Create))
    else
      JSONObject.AddPair(TJSONPair.Create('acknodelay', TJSONFalse.Create));

    if (FisKeepAlive <> 0) and (FKeepAlive.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('keepalive', TJSONNumber.Create(FKeepAlive.Trim)));
    if (FisSockBuf <> 0) and (FSockBuf.Trim <> '') then
      JSONObject.AddPair(TJSONPair.Create('sockbuf', TJSONNumber.Create(FSockBuf.Trim)));

    ResultJSON:= TSuperObject.ParseString(PWideChar(JSONObject.ToString), True);
    Result:= ResultJSON.AsJson(True, False);
  finally
    JSONObject.Free;
  end;
end;

function TClientNode.ReadFromJSONConfig(JSONStr: string): Integer;
var
  JSONObject: TJSONObject;
  StringValue: string;
  BooleanValue: Boolean;
  IntegerValue: Integer;
  ColonPos: Integer;
begin
  Result:= 0;
  initPara;

  JSONObject:= TJSONObject.ParseJSONValue(JSONStr) as TJSONObject;
  if JSONObject.TryGetValue<string>('localaddr', StringValue) then
    begin
      ColonPos:= Pos(':', StringValue);
      if ColonPos <> 0 then
        LocalPort:= Trim(Copy(StringValue, (ColonPos + 1), (Length(StringValue) - ColonPos)));
    end;
  if JSONObject.TryGetValue<string>('remoteaddr', StringValue) then
    begin
      ColonPos:= Pos(':', StringValue);
      if ColonPos <> 0 then
        begin
          KCPServerIP:= Trim(Copy(StringValue, 1, (ColonPos - 1)));
          KCPServerPort:= Trim(Copy(StringValue, (ColonPos + 1), (Length(StringValue) - ColonPos)));
        end;
    end;

  if JSONObject.TryGetValue<string>('key', StringValue) then
    begin
      isKey:= 1;
      Key:= StringValue;
    end;
  if JSONObject.TryGetValue<string>('crypt', StringValue) then
    begin
      isCrypt:= 1;
      Crypt:= StringValue.Trim;
    end;
  if JSONObject.TryGetValue<Boolean>('nocomp', BooleanValue) then
    begin
      isNoComp:= Integer(BooleanValue);
    end;
  if JSONObject.TryGetValue<Integer>('datashard', IntegerValue) then
    begin
      isDataShard:= 1;
      DataShard:= IntegerValue.ToString;
    end;
  if JSONObject.TryGetValue<Integer>('parityshard', IntegerValue) then
    begin
      isParityShard:= 1;
      ParityShard:= IntegerValue.ToString;
    end;
  if JSONObject.TryGetValue<Integer>('conn', IntegerValue) then
    begin
      isConn:= 1;
      Conn:= IntegerValue.ToString;
    end;
  if JSONObject.TryGetValue<Integer>('mtu', IntegerValue) then
    begin
      isMTU:= 1;
      MTU:= IntegerValue.ToString;
    end;
  if JSONObject.TryGetValue<Integer>('sndwnd', IntegerValue) then
    begin
      isSndWnd:= 1;
      SndWnd:= IntegerValue.ToString;
    end;
  if JSONObject.TryGetValue<Integer>('rcvwnd', IntegerValue) then
    begin
      isRcvWnd:= 1;
      RcvWnd:= IntegerValue.ToString;
    end;
  if JSONObject.TryGetValue<Integer>('dscp', IntegerValue) then
    begin
      isDSCP:= 1;
      DSCP:= IntegerValue.ToString;
    end;
  if JSONObject.TryGetValue<Integer>('autoexpire', IntegerValue) then
    begin
      isAutoExpire:= 1;
      AutoExpire:= IntegerValue.ToString;
    end;

  if JSONObject.TryGetValue<string>('mode', StringValue) then
    begin
      isMode:= 1;
      Mode:= StringValue.Trim;
    end;
  if JSONObject.TryGetValue<Integer>('nodelay', IntegerValue) then
    begin
      isNoDelay:= IntegerValue;
    end;
  if JSONObject.TryGetValue<Integer>('interval', IntegerValue) then
    begin
      isInterval:= 1;
      Interval:= IntegerValue.ToString;
    end;
  if JSONObject.TryGetValue<Integer>('resend', IntegerValue) then
    begin
      isResend:= 1;
      Resend:= IntegerValue.ToString;
    end;
  if JSONObject.TryGetValue<Integer>('nc', IntegerValue) then
    begin
      isNC:= IntegerValue;
    end;

  if JSONObject.TryGetValue<Boolean>('acknodelay', BooleanValue) then
    begin
      isACKNoDelay:= Integer(BooleanValue);
    end;
  if JSONObject.TryGetValue<Integer>('keepalive', IntegerValue) then
    begin
      isKeepAlive:= 1;
      KeepAlive:= IntegerValue.ToString;
    end;
  if JSONObject.TryGetValue<Integer>('sockbuf', IntegerValue) then
    begin
      isSockBuf:= 1;
      SockBuf:= IntegerValue.ToString;
    end;
end;

function TClientNode.GetHandle(): THandle;
begin
  Result:= FCMDThread.CMDHandle;
end;

function TClientNode.GetPID(): Cardinal;
begin
  Result:= FCMDThread.CMDPID;
end;

function TClientNode.RunCommand(CommandLine: string): Integer;
begin
  FCMDThread:= TExecDOSCommand_Thread.Create(CommandLine, True);
  FCMDThread.MainFormHandle:= FMainFormHandle;
  FCMDThread.Owner:= Self;
  FCMDThread.Memo_Log:= FMemo_Log;
  FCMDThread.Start;
  Result:= 0;
end;

function TClientNode.StopCommand(): Integer;
begin
  TerminateProcess(GetHandle(), 0);
  while FCMDThread.ThreadState <> 2 do
    Application.ProcessMessages;
  FWholeLog:= FWholeLog + FCMDThread.GetWholeLog;
  FCMDThread.Terminate;
  FCMDThread:= nil;
  Result:= 0;
end;

function TClientNode.SuspendCommand(): Integer;
var
  CMDPID: Cardinal;
  hSnap: THandle;
  THR32: THREADENTRY32;
  hOpen: THandle;
begin
  Result:= -1;
  CMDPID:= GetProcessId(GetHandle());
  hSnap:= CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0);
  if hSnap <> INVALID_HANDLE_VALUE then
    begin
      THR32.dwSize:= SizeOf(THR32);
      Thread32First(hSnap, THR32);
      repeat
        if THR32.th32OwnerProcessID = CMDPID then
          begin
            hOpen:= OpenThread($0002, FALSE, THR32.th32ThreadID);   //THREAD_ALL_ACCESS
            if hOpen <> INVALID_HANDLE_VALUE then
              begin
                Result:= 0;
                SuspendThread(hOpen);
                CloseHandle(hOpen);
              end;
          end;
      until Thread32Next(hSnap, THR32) = FALSE;
      CloseHandle(hSnap);
    end;
end;

function TClientNode.ResumeCommand(): Integer;
var
  CMDPID: Cardinal;
  Snapshot, cThr: DWORD;
  ThrHandle: THandle;
  Thread: TThreadEntry32;
begin
  Result:= -1;
  CMDPID:= GetProcessId(GetHandle());
  cThr:= GetCurrentThreadId;
  Snapshot:= CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0);
  if Snapshot <> INVALID_HANDLE_VALUE then
    begin
      Thread.dwSize:= SizeOf(TThreadEntry32);
      if Thread32First(Snapshot, Thread) then
        repeat
          if (Thread.th32ThreadID <> cThr) and (Thread.th32OwnerProcessID = CMDPID) then
            begin
              ThrHandle:= OpenThread($0002, false, Thread.th32ThreadID);
              if ThrHandle = 0 then Exit;
              ResumeThread(ThrHandle);
              CloseHandle(ThrHandle);
            end;
        until not Thread32Next(Snapshot, Thread);
//      Result:= CloseHandle(Snapshot);
      if CloseHandle(Snapshot) then
        Result:= 0;
    end;
end;

function TClientNode.GetWholeCommandOutput(): string;
begin
  Result:= '';
  if (FCMDThread <> nil) then
    Result:= FCMDThread.GetWholeLog;
end;

end.
