unit PublicVar;

interface

uses
  Winapi.Messages, Xml.XMLIntf, Xml.XMLDoc;

const
  WM_PHOTO = WM_USER + 7788;
  WM_DOSCOMMANDSTOP = WM_USER + 9527;

  SelfUpdateURL = 'https://github.com/dfdragon/kcptun_gclient/releases';
  IssuesURL = 'https://github.com/dfdragon/kcptun_gclient';
  KcpTunClientDownloadURL = 'https://github.com/xtaci/kcptun/releases';

var
  FileVer: string;

  XMLDocument_Para: TXMLDocument;

  ParaXMLPathName: string;
  MainNode, ProgramNode, ClientNodes: IXMLNode;

  CanModifyXML: Boolean;
  AutoStart: Integer;
  Minimize: Integer;
  ClientEXEDir: string;

  AutoConn: Integer;
  AutoConnTime: Integer;

  CanFoucs: Boolean;
  ModeCanFouse: Boolean;

implementation

end.
