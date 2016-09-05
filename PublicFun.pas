unit PublicFun;

interface

uses
  Xml.XMLIntf, Xml.XMLDoc, Winapi.Windows, Vcl.Forms, System.Win.Registry;

procedure CreateBlankParaXML(ParaXMLPathName: string);
procedure RepaireParaXML(ParaXMLPathName: string);
procedure WriteREGAutoRun(AutoStart: Integer; FileFullName: string);

implementation

procedure CreateBlankParaXML(ParaXMLPathName: string);
var
  XMLDocument_BlankPara: TXMLDocument;
  Blank_ParasNode, Blank_ProgramParaNode: IXMLNode;
begin
  XMLDocument_BlankPara:= TXMLDocument.Create(Application);
  XMLDocument_BlankPara.Active:= True;
  XMLDocument_BlankPara.Version:='1.0';
  XMLDocument_BlankPara.Encoding:= 'gbk';
  XMLDocument_BlankPara.NodeIndentStr:= #9;
  XMLDocument_BlankPara.Options:= XMLDocument_BlankPara.Options + [doNodeAutoIndent];
  try
    Blank_ParasNode:= XMLDocument_BlankPara.AddChild('paras');
    Blank_ParasNode.Attributes['author']:= 'badcat';

    Blank_ProgramParaNode:= Blank_ParasNode.AddChild('programpara');
    Blank_ProgramParaNode.AddChild('autostart').NodeValue:= 0;
    Blank_ProgramParaNode.AddChild('minimize').NodeValue:= 0;
    Blank_ProgramParaNode.AddChild('clientexedir');

    Blank_ParasNode.AddChild('clientnodes');

    XMLDocument_BlankPara.SaveToFile(ParaXMLPathName);
  finally
    XMLDocument_BlankPara.Free;
  end;
end;

//实现-c参数，Node中加入json节点
procedure RepaireParaXML(ParaXMLPathName: string);
var
  isModify: Boolean;
  XMLDocument_BlankPara: TXMLDocument;
  ParasNode, ClientNode, Node, JsonNode: IXMLNode;
  i: Integer;
begin
  isModify:= False;
  XMLDocument_BlankPara:= TXMLDocument.Create(Application);
  XMLDocument_BlankPara.Active:= True;
  XMLDocument_BlankPara.Version:='1.0';
  XMLDocument_BlankPara.Encoding:= 'gbk';
  XMLDocument_BlankPara.NodeIndentStr:= #9;
  XMLDocument_BlankPara.Options:= XMLDocument_BlankPara.Options + [doNodeAutoIndent];
  XMLDocument_BlankPara.LoadFromFile(ParaXMLPathName);
  try
    ParasNode:= XMLDocument_BlankPara.DocumentElement;
    ClientNode:= ParasNode.ChildNodes.FindNode('clientnodes');
    for i := 0 to (ClientNode.ChildNodes.Count - 1) do
      begin
        Node:= ClientNode.ChildNodes[i];
        JsonNode:= Node.ChildNodes.FindNode('json');
        if JsonNode = nil then
          begin
            isModify:= True;
            JsonNode:= Node.AddChild('json');
            JsonNode.Attributes['enable']:= 0;
          end;
      end;
    if isModify then
      XMLDocument_BlankPara.SaveToFile(ParaXMLPathName);
  finally
    XMLDocument_BlankPara.Free;
  end;
end;

procedure WriteREGAutoRun(AutoStart: Integer; FileFullName: string);
var
  Reg: TRegistry;
begin
  Reg:= TRegistry.Create;
  try
    Reg.RootKey:= HKEY_LOCAL_MACHINE;
    Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True);
    try
      if AutoStart = 0 then
        begin
          Reg.DeleteValue('KCPTun 客户端配置管理工具');
        end
      else
        begin
          Reg.WriteString('KCPTun 客户端配置管理工具', FileFullName);
        end;
    finally
      Reg.CloseKey;
    end;//try
  finally
    Reg.Free;
  end;//try
end;

end.
