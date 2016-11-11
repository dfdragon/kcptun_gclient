unit Main;

interface

uses
  Winapi.Windows, Winapi.ShellAPI, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Xml.XMLIntf, Xml.XMLDoc, Vcl.Menus, Vcl.Buttons, Vcl.ImgList, System.JSON, System.IOUtils, PublicVar,
  Vcl.Samples.Spin;

type
  TFMain = class(TForm)
    ListView_Node: TListView;
    Btn_AddNode: TButton;
    Btn_DeleteNode: TButton;
    Btn_StartAll: TButton;
    Btn_StopAll: TButton;
    StatusBar_Status: TStatusBar;
    Panel_ClientNodeInfo: TPanel;
    GroupBox_BascPara: TGroupBox;
    Label_LocalPort: TLabel;
    Label_KCPServerIP: TLabel;
    Edit_LocalPort: TEdit;
    Edit_KCPServerIP: TEdit;
    Edit_KCPServerPort: TEdit;
    Label_KCPServerPort: TLabel;
    GroupBox_SelectPara: TGroupBox;
    CheckBox_Key: TCheckBox;
    Label_Key: TLabel;
    Edit_Key: TEdit;
    CheckBox_Crypt: TCheckBox;
    Label_Crypt: TLabel;
    ComboBox_Crypt: TComboBox;
    CheckBox_Conn: TCheckBox;
    Label_Conn: TLabel;
    Edit_Conn: TEdit;
    CheckBox_MTU: TCheckBox;
    Label_MTU: TLabel;
    Edit_MTU: TEdit;
    CheckBox_SndWnd: TCheckBox;
    Label_SndWnd: TLabel;
    Edit_SndWnd: TEdit;
    CheckBox_RcvWnd: TCheckBox;
    Label_RcvWnd: TLabel;
    Edit_RcvWnd: TEdit;
    CheckBox_NoComp: TCheckBox;
    CheckBox_DSCP: TCheckBox;
    Label_DSCP: TLabel;
    Edit_DSCP: TEdit;
    CheckBox_DataShard: TCheckBox;
    Label_DataShard: TLabel;
    Edit_DataShard: TEdit;
    CheckBox_ParityShard: TCheckBox;
    Label_ParityShard: TLabel;
    Edit_ParityShard: TEdit;
    GroupBox_Mode: TGroupBox;
    Memo_Log: TMemo;
    CheckBox_NoDelay: TCheckBox;
    CheckBox_Interval: TCheckBox;
    Label_Interval: TLabel;
    Edit_Interval: TEdit;
    CheckBox_Resend: TCheckBox;
    Label_Resend: TLabel;
    Edit_Resend: TEdit;
    CheckBox_NC: TCheckBox;
    Label_NC: TLabel;
    Edit_Remark: TEdit;
    Label_Remark: TLabel;
    Btn_Start: TButton;
    Btn_Stop: TButton;
    CheckBox_AutoStart: TCheckBox;
    Label_ClientEXEDir: TLabel;
    Edit_ClientEXEDir: TEdit;
    Btn_FindClientEXE: TButton;
    Memo_CMDLine: TMemo;
    OpenDialog_ClientEXE: TOpenDialog;
    CheckBox_Mode: TCheckBox;
    Label_Mode: TLabel;
    ComboBox_Mode: TComboBox;
    Label_NoComp: TLabel;
    Label_NoDelay: TLabel;
    GroupBox_HiddenPara: TGroupBox;
    CheckBox_ACKNoDelay: TCheckBox;
    Label_ACKNoDelay: TLabel;
    Label_SockBuf: TLabel;
    CheckBox_SockBuf: TCheckBox;
    Edit_SockBuf: TEdit;
    CheckBox_KeepAlive: TCheckBox;
    Label_KeepAlive: TLabel;
    Edit_KeepAlive: TEdit;
    PopupMenu_Tray: TPopupMenu;
    Menu_Show: TMenuItem;
    N2: TMenuItem;
    Menu_StartAll: TMenuItem;
    Menu_StopAll: TMenuItem;
    N5: TMenuItem;
    Menu_Exit: TMenuItem;
    TrayIcon_Sys: TTrayIcon;
    CheckBox_Minimize: TCheckBox;
    CheckBox_AutoExpire: TCheckBox;
    Label_AutoExpire: TLabel;
    Edit_AutoExpire: TEdit;
    SpeedBtn_ClearLog: TSpeedButton;
    SpeedBtn_CMDLine: TSpeedButton;
    ImageList_Menu: TImageList;
    CheckBox_ConfigFileDir: TCheckBox;
    PopupMenu_ClientNode: TPopupMenu;
    Menu_Start: TMenuItem;
    Menu_Stop: TMenuItem;
    N4: TMenuItem;
    Menu_Copy: TMenuItem;
    N7: TMenuItem;
    Menu_Delete: TMenuItem;
    Edit_ConfigFileDir: TEdit;
    Label_ConfigFileDir: TLabel;
    Btn_FindConfigFileDir: TButton;
    OpenDialog_JSON: TOpenDialog;
    Menu_ExportToJSON: TMenuItem;
    SaveDialog_JSON: TSaveDialog;
    Menu_ImportFromJSON: TMenuItem;
    CheckBox_AutoConn: TCheckBox;
    Label_AutoConnUnit: TLabel;
    SpinEdit_AutoConnTime: TSpinEdit;
    procedure Btn_AddNodeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_FindClientEXEClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListView_NodeClick(Sender: TObject);
    procedure CheckBox_KeyClick(Sender: TObject);
    procedure CheckBox_CryptClick(Sender: TObject);
    procedure CheckBox_ModeClick(Sender: TObject);
    procedure Edit_LocalPortChange(Sender: TObject);
    procedure Edit_KeyChange(Sender: TObject);
    procedure ListView_NodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_RemarkChange(Sender: TObject);
    procedure Edit_KCPServerIPChange(Sender: TObject);
    procedure Edit_KCPServerPortChange(Sender: TObject);
    procedure CheckBox_AutoStartClick(Sender: TObject);
    procedure ComboBox_CryptChange(Sender: TObject);
    procedure CheckBox_NoCompClick(Sender: TObject);
    procedure CheckBox_DataShardClick(Sender: TObject);
    procedure Edit_DataShardChange(Sender: TObject);
    procedure CheckBox_ParityShardClick(Sender: TObject);
    procedure Edit_ParityShardChange(Sender: TObject);
    procedure CheckBox_ConnClick(Sender: TObject);
    procedure Edit_ConnChange(Sender: TObject);
    procedure CheckBox_MTUClick(Sender: TObject);
    procedure Edit_MTUChange(Sender: TObject);
    procedure CheckBox_SndWndClick(Sender: TObject);
    procedure Edit_SndWndChange(Sender: TObject);
    procedure CheckBox_RcvWndClick(Sender: TObject);
    procedure Edit_RcvWndChange(Sender: TObject);
    procedure CheckBox_DSCPClick(Sender: TObject);
    procedure Edit_DSCPChange(Sender: TObject);
    procedure ComboBox_ModeChange(Sender: TObject);
    procedure CheckBox_NoDelayClick(Sender: TObject);
    procedure CheckBox_IntervalClick(Sender: TObject);
    procedure Edit_IntervalChange(Sender: TObject);
    procedure CheckBox_ResendClick(Sender: TObject);
    procedure Edit_ResendChange(Sender: TObject);
    procedure CheckBox_ACKNoDelayClick(Sender: TObject);
    procedure CheckBox_KeepAliveClick(Sender: TObject);
    procedure Edit_KeepAliveChange(Sender: TObject);
    procedure CheckBox_SockBufClick(Sender: TObject);
    procedure Edit_SockBufChange(Sender: TObject);
    procedure CheckBox_NCClick(Sender: TObject);
    procedure Btn_StartClick(Sender: TObject);
    procedure Btn_StopClick(Sender: TObject);
    procedure Btn_DeleteNodeClick(Sender: TObject);
    procedure Menu_ShowClick(Sender: TObject);
    procedure Menu_ExitClick(Sender: TObject);
    procedure TrayIcon_SysClick(Sender: TObject);
    procedure Edit_ClientEXEDirChange(Sender: TObject);
    procedure Memo_CMDLineDblClick(Sender: TObject);
    procedure CheckBox_MinimizeClick(Sender: TObject);
    procedure CheckBox_AutoExpireClick(Sender: TObject);
    procedure Edit_AutoExpireChange(Sender: TObject);
    procedure Edit_LocalPortKeyPress(Sender: TObject; var Key: Char);
    procedure ListView_NodeCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Btn_StartAllClick(Sender: TObject);
    procedure Btn_StopAllClick(Sender: TObject);
    procedure Menu_StartAllClick(Sender: TObject);
    procedure Menu_StopAllClick(Sender: TObject);
    procedure SpeedBtn_CMDLineClick(Sender: TObject);
    procedure SpeedBtn_ClearLogClick(Sender: TObject);
    procedure CheckBox_ConfigFileDirClick(Sender: TObject);
    procedure Edit_ConfigFileDirChange(Sender: TObject);
    procedure StatusBar_StatusMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Btn_FindConfigFileDirClick(Sender: TObject);
    procedure ListView_NodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Menu_StartClick(Sender: TObject);
    procedure Menu_StopClick(Sender: TObject);
    procedure Menu_DeleteClick(Sender: TObject);
    procedure Menu_ExportToJSONClick(Sender: TObject);
    procedure Menu_CopyClick(Sender: TObject);
    procedure Menu_ImportFromJSONClick(Sender: TObject);
    procedure CheckBox_AutoConnClick(Sender: TObject);
    procedure SpinEdit_AutoConnTimeChange(Sender: TObject);
  private
    { Private declarations }
    procedure WMSYSCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
  protected
    procedure WMDropFiles(var Msg: TMessage); message WM_DROPFILES;
    procedure WMDOSCommandStop(var Msg: TMessage); message WM_DOSCOMMANDSTOP;
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses
  Interface_op, Class_ClientNode, OneCopy, PublicFun, Photo;

{$R *.dfm}
{$R photo.RES}
//{$R 'uac.res' 'uac.rc'}

procedure TFMain.WMSYSCommand;
begin
  if (Msg.CmdType = SC_MINIMIZE) or (Msg.CmdType = SC_CLOSE)  then
    begin
      FMain.Visible:= False;
    end
  else
    DefaultHandler(Msg);

  if (Msg.CmdType = WM_PHOTO)  then
    FPhoto.ShowModal;
end;

procedure TFMain.WMDropFiles(var Msg:TMessage);
var
  i: Integer;
  Buffer: array[0..8190] of Char;
  FileFullName, LowerCaseFileName: string;
  FindFiles: Boolean;
begin
  FindFiles:= False;
  i:= DragQueryFile(Msg.wParam, $FFFFFFFF, Buffer, 8190);
  for i:= 0 to (i - 1) do
    begin    //处理选择多个文件
      DragQueryFile(Msg.wParam, i, Buffer, 8190);
      FileFullName:= Buffer;
      LowerCaseFileName:= LowerCase(ExtractFileName(FileFullName));
      if (LowerCaseFileName = 'client_windows_amd64.exe') or (LowerCaseFileName = 'client_windows_386.exe') then
        begin
          FindFiles:= True;
          Break;
        end;//if
    end;//for
  DragFinish(Msg.wParam);
  if FindFiles then
    begin
      PublicVar.ClientEXEDir:= FileFullName;
      Edit_ClientEXEDir.Text:= FileFullName;
    end;
end;

procedure TFMain.WMDOSCommandStop(var Msg: TMessage);
var
  ClientNode: TClientNode;
begin
  ClientNode:= TClientNode(Msg.LParam);
  ClientNode.StopCommand;
  if (ListView_Node.Selected <> nil) and (ListView_Node.Selected.Data = ClientNode) then
    begin
      Btn_Start.Enabled:= True;
      Btn_Stop.Enabled:= False;
    end;
  ListView_Node.Repaint;
end;

procedure TFMain.Btn_AddNodeClick(Sender: TObject);
var
  NewClientNode: TClientNode;
  NodeItem: TListItem;
  NewXMLNode: IXMLNode;
begin
  Btn_AddNode.Enabled:= False;
  try
    NewClientNode:= TClientNode.Create;
    NewClientNode.XMLDocument_Para:= PublicVar.XMLDocument_Para;

    NodeItem:= ListView_Node.Items.Add;
    NodeItem.Caption:= NewClientNode.KCPServerIP + ':' + NewClientNode.KCPServerPort + '——' + NewClientNode.LocalPort;
    NodeItem.Data:= NewClientNode;

    NewXMLNode:= PublicVar.ClientNodes.AddChild('node');
    NewClientNode.XMLNode:= NewXMLNode;
    NewClientNode.WriteToXMLNode(NewXMLNode);
    PublicVar.XMLDocument_Para.SaveToFile();
  finally
    Btn_AddNode.Enabled:= True;
  end;
end;

procedure TFMain.Btn_DeleteNodeClick(Sender: TObject);
var
  ClientNode: TClientNode;
begin
  if Application.MessageBox('确定要删除所选中的节点吗？删除后无法恢复！', '提示', MB_YESNO) = MrNo then
    Exit;
  ClientNode:= TClientNode(ListView_Node.Selected.Data);
  ClientNode.XMLNode.ParentNode.ChildNodes.Remove(ClientNode.XMLNode);
  PublicVar.XMLDocument_Para.SaveToFile;

  if ClientNode.isRunCMD <> 0  then
    begin
      ClientNode.CorrectQuit:= True;
      ClientNode.StopCommand;
    end;
  ClientNode.Free;
  ListView_Node.Selected.Delete;
  ListView_NodeClick(Self);
end;

procedure TFMain.Btn_FindClientEXEClick(Sender: TObject);
begin
  if not OpenDialog_ClientEXE.Execute then
    Exit;
  PublicVar.ClientEXEDir:= OpenDialog_ClientEXE.FileName;
  Edit_ClientEXEDir.Text:= OpenDialog_ClientEXE.FileName;
end;

procedure TFMain.Btn_FindConfigFileDirClick(Sender: TObject);
begin
  if not OpenDialog_JSON.Execute then
    Exit;
  Edit_ConfigFileDir.Text:= OpenDialog_JSON.FileName;
end;

procedure TFMain.Btn_StartAllClick(Sender: TObject);
var
  i: Integer;
  ClientNode: TClientNode;
  CMDLineStr: string;
begin
  for i := 0 to (ListView_Node.Items.Count - 1) do
    begin
      ClientNode:= TClientNode(ListView_Node.Items[i].Data);
      if (ClientNode.isRunCMD = 0) then
        begin
          CMDLineStr:= ClientNode.CreateCMDLine(Edit_ClientEXEDir.Text);
          ClientNode.RunCommand(CMDLineStr);
          ClientNode.RunState:= '1';
        end;
    end;
  ListView_Node.Repaint;
  ListView_NodeClick(Self);
end;

procedure TFMain.Btn_StartClick(Sender: TObject);
var
  CMDLineStr: string;
begin
  CMDLineStr:= TClientNode(ListView_Node.Selected.Data).CreateCMDLine(Edit_ClientEXEDir.Text);
  Memo_CMDLine.Lines.Text:= CMDLineStr;
  TClientNode(ListView_Node.Selected.Data).RunCommand(CMDLineStr);
  TClientNode(ListView_Node.Selected.Data).RunState:= '1';
  ListView_Node.Repaint;
  Btn_Start.Enabled:= False;
  Btn_Stop.Enabled:= True;
end;

procedure TFMain.Btn_StopAllClick(Sender: TObject);
var
  i: Integer;
  ClientNode: TClientNode;
begin
  for i := 0 to (ListView_Node.Items.Count - 1) do
    begin
      ClientNode:= TClientNode(ListView_Node.Items[i].Data);
      if (ClientNode.isRunCMD = 1) then
        begin
          ClientNode.CorrectQuit:= True;
          ClientNode.StopCommand;
          ClientNode.RunState:= '0';
        end;
    end;
  ListView_Node.Repaint;
  ListView_NodeClick(Self);
end;

procedure TFMain.Btn_StopClick(Sender: TObject);
begin
  TClientNode(ListView_Node.Selected.Data).CorrectQuit:= True;
  TClientNode(ListView_Node.Selected.Data).StopCommand;
  TClientNode(ListView_Node.Selected.Data).RunState:= '0';
  ListView_Node.Repaint;
  Btn_Start.Enabled:= True;
  Btn_Stop.Enabled:= False;
end;

procedure TFMain.CheckBox_ACKNoDelayClick(Sender: TObject);
begin
  Label_ACKNoDelay.Enabled:= CheckBox_ACKNoDelay.Checked;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isACKNoDelay:= Integer(CheckBox_ACKNoDelay.Checked);
end;

procedure TFMain.CheckBox_AutoConnClick(Sender: TObject);
begin
  PublicVar.AutoConn:= Integer(CheckBox_AutoConn.Checked);

  SpinEdit_AutoConnTime.Enabled:= CheckBox_AutoConn.Checked;
  Label_AutoConnUnit.Enabled:= CheckBox_AutoConn.Checked;
  if CheckBox_AutoConn.Checked then
    begin
      SpinEdit_AutoConnTime.Color:= clWindow;
      if PublicVar.CanFoucs then
        SpinEdit_AutoConnTime.SetFocus;
    end
  else
    begin
      SpinEdit_AutoConnTime.Color:= clBtnFace;
    end;

  if not PublicVar.CanModifyXML then
    Exit;
  PublicVar.ProgramNode.ChildNodes['autoconn'].Attributes['enable']:= PublicVar.AutoConn;
  PublicVar.XMLDocument_Para.SaveToFile;
end;

procedure TFMain.CheckBox_AutoExpireClick(Sender: TObject);
begin
  Label_AutoExpire.Enabled:= CheckBox_AutoExpire.Checked;
  Edit_AutoExpire.Enabled:= CheckBox_AutoExpire.Checked;
  if CheckBox_AutoExpire.Checked then
    begin
      Edit_AutoExpire.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_AutoExpire.SetFocus;
    end
  else
    begin
      Edit_AutoExpire.Color:= clBtnFace;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isAutoExpire:= Integer(CheckBox_AutoExpire.Checked);
end;

procedure TFMain.CheckBox_AutoStartClick(Sender: TObject);
begin
  PublicVar.AutoStart:= Integer(CheckBox_AutoStart.Checked);
  if not PublicVar.CanModifyXML then
    Exit;
  try
    WriteREGAutoRun(PublicVar.AutoStart, Application.ExeName);
    PublicVar.ProgramNode.ChildNodes['autostart'].NodeValue:= PublicVar.AutoStart;
    PublicVar.XMLDocument_Para.SaveToFile;
  except
    Application.MessageBox('试图操作注册表时出现错误，请以系统管理员身份运行后再次重试！', '提示', MB_OK);
    Exit;
  end;
end;

procedure TFMain.CheckBox_ConfigFileDirClick(Sender: TObject);
begin
  Label_ConfigFileDir.Enabled:= CheckBox_ConfigFileDir.Checked;
  Edit_ConfigFileDir.Enabled:= CheckBox_ConfigFileDir.Checked;
  Btn_FindConfigFileDir.Enabled:= CheckBox_ConfigFileDir.Checked;
  if CheckBox_ConfigFileDir.Checked then
    begin
      if PublicVar.CanFoucs then
        Btn_FindConfigFileDir.SetFocus;

      Interface_op.Enable_DisableAllCheckbox(False);
      Interface_op.Enable_DisableBasePara(False);
      DisableAllInterfaceExceptJSON;
//      Interface_op.Enable_DisableSelectPara(False);
//      Interface_op.Enable_DisableModePara(False);
//      Interface_op.Enable_DisableHiddenPara(False);
    end
  else
    begin
      Interface_op.Enable_DisableAllCheckbox(True);
      Interface_op.Enable_DisableBasePara(True);
      Interface_op.Enable_DisableSelectPara(True);
      Interface_op.Enable_DisableModePara(True);
      Interface_op.Enable_DisableHiddenPara(True);
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isJson:= Integer(CheckBox_ConfigFileDir.Checked);
end;

procedure TFMain.CheckBox_ConnClick(Sender: TObject);
begin
  Label_Conn.Enabled:= CheckBox_Conn.Checked;
  Edit_Conn.Enabled:= CheckBox_Conn.Checked;
  if CheckBox_Conn.Checked then
    begin
      Edit_Conn.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_Conn.SetFocus;
    end
  else
    begin
      Edit_Conn.Color:= clBtnFace;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isConn:= Integer(CheckBox_Conn.Checked);
end;

procedure TFMain.CheckBox_CryptClick(Sender: TObject);
begin
  Label_Crypt.Enabled:= CheckBox_Crypt.Checked;
  ComboBox_Crypt.Enabled:= CheckBox_Crypt.Checked;
  if CheckBox_Crypt.Checked then
    begin
      if PublicVar.CanFoucs then
        ComboBox_Crypt.SetFocus;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isCrypt:= Integer(CheckBox_Crypt.Checked);
end;

procedure TFMain.CheckBox_DataShardClick(Sender: TObject);
begin
  Label_DataShard.Enabled:= CheckBox_DataShard.Checked;
  Edit_DataShard.Enabled:= CheckBox_DataShard.Checked;
  if CheckBox_DataShard.Checked then
    begin
      Edit_DataShard.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_DataShard.SetFocus;
    end
  else
    begin
      Edit_DataShard.Color:= clBtnFace;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isDataShard:= Integer(CheckBox_DataShard.Checked);
end;

procedure TFMain.CheckBox_DSCPClick(Sender: TObject);
begin
  Label_DSCP.Enabled:= CheckBox_DSCP.Checked;
  Edit_DSCP.Enabled:= CheckBox_DSCP.Checked;
  if CheckBox_DSCP.Checked then
    begin
      Edit_DSCP.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_DSCP.SetFocus;
    end
  else
    begin
      Edit_DSCP.Color:= clBtnFace;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isDSCP:= Integer(CheckBox_DSCP.Checked);
end;

procedure TFMain.CheckBox_IntervalClick(Sender: TObject);
begin
  if (CheckBox_Mode.Checked) and (ComboBox_Mode.Text = 'manual') and (CheckBox_Interval.Checked) then
    begin
      Label_Interval.Enabled:= True;
      Edit_Interval.Color:= clWindow;
      Edit_Interval.Enabled:= True;
      if PublicVar.CanFoucs and PublicVar.ModeCanFouse then
        Edit_Interval.SetFocus;
    end
  else
    begin
      Label_Interval.Enabled:= False;
      Edit_Interval.Color:= clBtnFace;
      Edit_Interval.Enabled:= False;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isInterval:= Integer(CheckBox_Interval.Checked);
end;

procedure TFMain.CheckBox_KeepAliveClick(Sender: TObject);
begin
  Label_KeepAlive.Enabled:= CheckBox_KeepAlive.Checked;
  Edit_KeepAlive.Enabled:= CheckBox_KeepAlive.Checked;
  if CheckBox_KeepAlive.Checked then
    begin
      Edit_KeepAlive.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_KeepAlive.SetFocus;
    end
  else
    begin
      Edit_KeepAlive.Color:= clBtnFace;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isKeepAlive:= Integer(CheckBox_KeepAlive.Checked);
end;

procedure TFMain.CheckBox_KeyClick(Sender: TObject);
begin
  Label_Key.Enabled:= CheckBox_Key.Checked;
  Edit_Key.Enabled:= CheckBox_Key.Checked;
  if CheckBox_Key.Checked then
    begin
      Edit_Key.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_Key.SetFocus;
    end
  else
    begin
      Edit_Key.Color:= clBtnFace;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isKey:= Integer(CheckBox_Key.Checked);
end;

procedure TFMain.CheckBox_MinimizeClick(Sender: TObject);
begin
  PublicVar.Minimize:= Integer(CheckBox_Minimize.Checked);
  if not PublicVar.CanModifyXML then
    Exit;
  PublicVar.ProgramNode.ChildNodes['minimize'].NodeValue:= PublicVar.Minimize;
  PublicVar.XMLDocument_Para.SaveToFile;
end;

procedure TFMain.CheckBox_ModeClick(Sender: TObject);
begin
  Label_Mode.Enabled:= CheckBox_Mode.Checked;
  ComboBox_Mode.Enabled:= CheckBox_Mode.Checked;
  if CheckBox_Mode.Checked then
    begin
      if PublicVar.CanFoucs then
        ComboBox_Mode.SetFocus;
    end;
  PublicVar.ModeCanFouse:= False;
  if (ComboBox_Mode.Text = 'manual') and (CheckBox_Mode.Checked) then
    begin
      Interface_op.Enable_DisableModePara(True);
    end
  else
    begin
      Interface_op.Enable_DisableModePara(False);
    end;
  PublicVar.ModeCanFouse:= True;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isMode:= Integer(CheckBox_Mode.Checked);
end;

procedure TFMain.CheckBox_MTUClick(Sender: TObject);
begin
  Label_MTU.Enabled:= CheckBox_MTU.Checked;
  Edit_MTU.Enabled:= CheckBox_MTU.Checked;
  if CheckBox_MTU.Checked then
    begin
      Edit_MTU.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_MTU.SetFocus;
    end
  else
    begin
      Edit_MTU.Color:= clBtnFace;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isMTU:= Integer(CheckBox_MTU.Checked);
end;

procedure TFMain.CheckBox_NCClick(Sender: TObject);
begin
  if (CheckBox_Mode.Checked) and (ComboBox_Mode.Text = 'manual') and (CheckBox_NC.Checked) then
    begin
      Label_NC.Enabled:= True;
    end
  else
    begin
      Label_NC.Enabled:= False;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isNC:= Integer(CheckBox_NC.Checked);
end;

procedure TFMain.CheckBox_NoCompClick(Sender: TObject);
begin
  Label_NoComp.Enabled:= CheckBox_NoComp.Checked;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isNoComp:= Integer(CheckBox_NoComp.Checked);
end;

procedure TFMain.CheckBox_NoDelayClick(Sender: TObject);
begin
  if (CheckBox_Mode.Checked) and (ComboBox_Mode.Text = 'manual') and (CheckBox_NoDelay.Checked) then
    begin
      Label_NoDelay.Enabled:= True;
    end
  else
    begin
      Label_NoDelay.Enabled:= False;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isNoDelay:= Integer(CheckBox_NoDelay.Checked);
end;

procedure TFMain.CheckBox_ParityShardClick(Sender: TObject);
begin
  Label_ParityShard.Enabled:= CheckBox_ParityShard.Checked;
  Edit_ParityShard.Enabled:= CheckBox_ParityShard.Checked;
  if CheckBox_ParityShard.Checked then
    begin
      Edit_ParityShard.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_ParityShard.SetFocus;
    end
  else
    begin
      Edit_ParityShard.Color:= clBtnFace;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isParityShard:= Integer(CheckBox_ParityShard.Checked);
end;

procedure TFMain.CheckBox_RcvWndClick(Sender: TObject);
begin
  Label_RcvWnd.Enabled:= CheckBox_RcvWnd.Checked;
  Edit_RcvWnd.Enabled:= CheckBox_RcvWnd.Checked;
  if CheckBox_RcvWnd.Checked then
    begin
      Edit_RcvWnd.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_RcvWnd.SetFocus;
    end
  else
    begin
      Edit_RcvWnd.Color:= clBtnFace;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isRcvWnd:= Integer(CheckBox_RcvWnd.Checked);
end;

procedure TFMain.CheckBox_ResendClick(Sender: TObject);
begin
  if (CheckBox_Mode.Checked) and (ComboBox_Mode.Text = 'manual') and (CheckBox_Resend.Checked) then
    begin
      Label_Resend.Enabled:= True;
      Edit_Resend.Color:= clWindow;
      Edit_Resend.Enabled:= True;
      if PublicVar.CanFoucs and PublicVar.ModeCanFouse then
        Edit_Resend.SetFocus;
    end
  else
    begin
      Label_Resend.Enabled:= False;
      Edit_Resend.Color:= clBtnFace;
      Edit_Resend.Enabled:= False;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isResend:= Integer(CheckBox_Resend.Checked);
end;

procedure TFMain.CheckBox_SndWndClick(Sender: TObject);
begin
  Label_SndWnd.Enabled:= CheckBox_SndWnd.Checked;
  Edit_SndWnd.Enabled:= CheckBox_SndWnd.Checked;
  if CheckBox_SndWnd.Checked then
    begin
      Edit_SndWnd.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_SndWnd.SetFocus;
    end
  else
    begin
      Edit_SndWnd.Color:= clBtnFace;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isSndWnd:= Integer(CheckBox_SndWnd.Checked);
end;

procedure TFMain.CheckBox_SockBufClick(Sender: TObject);
begin
  Label_SockBuf.Enabled:= CheckBox_SockBuf.Checked;
  Edit_SockBuf.Enabled:= CheckBox_SockBuf.Checked;
  if CheckBox_SockBuf.Checked then
    begin
      Edit_SockBuf.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_SockBuf.SetFocus;
    end
  else
    begin
      Edit_SockBuf.Color:= clBtnFace;
    end;
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).isSockBuf:= Integer(CheckBox_SockBuf.Checked);
end;

procedure TFMain.ComboBox_CryptChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).Crypt:= ComboBox_Crypt.Text;
end;

procedure TFMain.ComboBox_ModeChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).Mode:= ComboBox_Mode.Text;
  if (ComboBox_Mode.Text = 'manual') then
    begin
      Enable_DisableModePara(True);
    end
  else
    begin
      Enable_DisableModePara(False);
    end;
end;

procedure TFMain.Edit_AutoExpireChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).AutoExpire:= Edit_AutoExpire.Text;
end;

procedure TFMain.Edit_ClientEXEDirChange(Sender: TObject);
begin
  if not PublicVar.CanModifyXML then
    Exit;
  PublicVar.ProgramNode.ChildNodes['clientexedir'].NodeValue:= Edit_ClientEXEDir.Text;
  PublicVar.XMLDocument_Para.SaveToFile;
end;

procedure TFMain.Edit_ConfigFileDirChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).Json:= Edit_ConfigFileDir.Text;
end;

procedure TFMain.Edit_ConnChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).Conn:= Edit_Conn.Text;
end;

procedure TFMain.Edit_DataShardChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).DataShard:= Edit_DataShard.Text;
end;

procedure TFMain.Edit_DSCPChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).DSCP:= Edit_DSCP.Text;
end;

procedure TFMain.Edit_IntervalChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).Interval:= Edit_Interval.Text;
end;

procedure TFMain.Edit_KCPServerIPChange(Sender: TObject);
var
  ClientNode: TClientNode;
  ShowCaption: string;
begin
  if ListView_Node.Selected = nil then
    Exit;
  ClientNode:= TClientNode(ListView_Node.Selected.Data);
  ClientNode.KCPServerIP:= Edit_KCPServerIP.Text;
  ShowCaption:= ClientNode.KCPServerIP + ':' + ClientNode.KCPServerPort + '——' + ClientNode.LocalPort;
  if (ClientNode.Remark.Trim <> '') then
    ShowCaption:= ClientNode.Remark.Trim + '(' + ShowCaption + ')';
  ListView_Node.Selected.Caption:= ShowCaption;
end;

procedure TFMain.Edit_KCPServerPortChange(Sender: TObject);
var
  ClientNode: TClientNode;
  ShowCaption: string;
begin
  if ListView_Node.Selected = nil then
    Exit;
  ClientNode:= TClientNode(ListView_Node.Selected.Data);
  ClientNode.KCPServerPort:= Edit_KCPServerPort.Text;
  ShowCaption:= ClientNode.KCPServerIP + ':' + ClientNode.KCPServerPort + '——' + ClientNode.LocalPort;
  if (ClientNode.Remark.Trim <> '') then
    ShowCaption:= ClientNode.Remark.Trim + '(' + ShowCaption + ')';
  ListView_Node.Selected.Caption:= ShowCaption;
end;

procedure TFMain.Edit_KeepAliveChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).KeepAlive:= Edit_KeepAlive.Text;
end;

procedure TFMain.Edit_KeyChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).Key:= Edit_Key.Text;
end;

procedure TFMain.Edit_LocalPortChange(Sender: TObject);
var
  ClientNode: TClientNode;
  ShowCaption: string;
begin
  if ListView_Node.Selected = nil then
    Exit;
  ClientNode:= TClientNode(ListView_Node.Selected.Data);
  ClientNode.LocalPort:= Trim(Edit_LocalPort.Text);
  ShowCaption:= ClientNode.KCPServerIP + ':' + ClientNode.KCPServerPort + '——' + ClientNode.LocalPort;
  if (ClientNode.Remark.Trim <> '') then
    ShowCaption:= ClientNode.Remark.Trim + '(' + ShowCaption + ')';
  ListView_Node.Selected.Caption:= ShowCaption;
end;

procedure TFMain.Edit_LocalPortKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', #8]) then
    Key:= #0;
end;

procedure TFMain.Edit_MTUChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).MTU:= Edit_MTU.Text;
end;

procedure TFMain.Edit_ParityShardChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).ParityShard:= Edit_ParityShard.Text;
end;

procedure TFMain.Edit_RcvWndChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).RcvWnd:= Edit_RcvWnd.Text;
end;

procedure TFMain.Edit_RemarkChange(Sender: TObject);
var
  ClientNode: TClientNode;
  ShowCaption: string;
begin
  if ListView_Node.Selected = nil then
    Exit;
  ClientNode:= TClientNode(ListView_Node.Selected.Data);
  ClientNode.Remark:= Edit_Remark.Text;
  ShowCaption:= ClientNode.KCPServerIP + ':' + ClientNode.KCPServerPort + '——' + ClientNode.LocalPort;
  if (ClientNode.Remark.Trim <> '') then
    ShowCaption:= ClientNode.Remark.Trim + '(' + ShowCaption + ')';
  ListView_Node.Selected.Caption:= ShowCaption;
end;

procedure TFMain.Edit_ResendChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).Resend:= Edit_Resend.Text;
end;

procedure TFMain.Edit_SndWndChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).SndWnd:= Edit_SndWnd.Text;
end;

procedure TFMain.Edit_SockBufChange(Sender: TObject);
begin
  if ListView_Node.Selected = nil then
    Exit;
  TClientNode(ListView_Node.Selected.Data).SockBuf:= Edit_SockBuf.Text;
end;

procedure TFMain.FormCreate(Sender: TObject);
var
  MyMenu_Photo: HMENU;
  i: Integer;
  ClientXMLNode: IXMLNode;
  ClientNode: TClientNode;
  NodeItem: TListItem;
  ShowCaption, CommandLine: string;
begin
  DragAcceptFiles(Handle, True);
  Interface_op.WriteHint_ModeDefault;
  Self.Caption:= Self.Caption + '      程序版本：' + PublicVar.FileVer;
  TrayIcon_Sys.Hint:= 'KCPTun 客户端配置管理工具 v' + PublicVar.FileVer;

  MyMenu_Photo:= GetSystemMenu(Handle, False);
  AppendMenu(MyMenu_Photo, MF_SEPARATOR, 0, nil);
  AppendMenu(MyMenu_Photo, MF_STRING, WM_PHOTO, '激励师玉照 ^_^');

  Interface_op.Enable_DisableAllCheckbox(False);
  Interface_op.DisableAllInterface;
  Label_Remark.Enabled:= False;
  Edit_Remark.Enabled:= False;
  Edit_Remark.Color:= clBtnFace;

  OpenDialog_ClientEXE.InitialDir:= ExtractFilePath(Application.ExeName);
  OpenDialog_JSON.InitialDir:= ExtractFilePath(Application.ExeName);
  SaveDialog_JSON.InitialDir:= ExtractFilePath(Application.ExeName);
  PublicVar.ParaXMLPathName:= ExtractFilePath(Application.ExeName) + 'kcptun.xml';
  if not FileExists(PublicVar.ParaXMLPathName) then
    begin
      //参数文件不存在，新建文件
      PublicFun.CreateBlankParaXML(PublicVar.ParaXMLPathName);
    end
  else
    begin
      //参数文件存在，检查参数文件，添加或删除其中的参数项
      PublicFun.RepairParaXML(PublicVar.ParaXMLPathName);
    end;

  PublicVar.XMLDocument_Para:= TXMLDocument.Create(Application);
  PublicVar.XMLDocument_Para.NodeIndentStr:= #9;
  PublicVar.XMLDocument_Para.Options:= PublicVar.XMLDocument_Para.Options + [doNodeAutoIndent];
  if (Interface_op.GetPublicVarFromXML(ParaXMLPathName) <> 0)  then
    begin
      Application.MessageBox('系统参数xml文件损坏，请还原xml文件后重试！', '提示', MB_OK);
      Application.Terminate;
    end;

  if (PublicVar.Minimize = 1) then
    FMain.WindowState:= wsMinimized
  else
    FMain.WindowState:= wsNormal;

  for i := 0 to (PublicVar.ClientNodes.ChildNodes.Count - 1) do
    begin
      ClientXMLNode:= PublicVar.ClientNodes.ChildNodes[i];
      ClientNode:= TClientNode.Create;
      ClientNode.MainFormHandle:= Self.Handle;
      ClientNode.XMLDocument_Para:= PublicVar.XMLDocument_Para;
      ClientNode.XMLNode:= ClientXMLNode;
      if (ClientNode.ReadFromXMLNode(ClientXMLNode) <> 0)  then
        begin
          Application.MessageBox('读取clientnodes节点时出现错误，请检查或还原xml文件后重试！', '提示', MB_OK);
          Application.Terminate;
        end;
      NodeItem:= ListView_Node.Items.Add;

      ShowCaption:= ClientNode.KCPServerIP + ':' + ClientNode.KCPServerPort + '——' + ClientNode.LocalPort;
      if (ClientNode.Remark.Trim <> '') then
        ShowCaption:= ClientNode.Remark.Trim + '(' + ShowCaption + ')';
      NodeItem.Caption:= ShowCaption;
      NodeItem.Data:= ClientNode;

      if ClientNode.RunState = '1' then
        begin
          CommandLine:= ClientNode.CreateCMDLine(PublicVar.ClientEXEDir);
          ClientNode.RunCommand(CommandLine);
        end;
    end;
  ListView_Node.Repaint;
end;

procedure TFMain.FormDestroy(Sender: TObject);
var
  i: Integer;
  ClientNode: TClientNode;
begin
  for i := 0 to (ListView_Node.Items.Count - 1) do
    begin
      ClientNode:= TClientNode(ListView_Node.Items.Item[i].Data);
      if (ClientNode.isRunCMD = 1) then
        begin
          ClientNode.CorrectQuit:= True;
          ClientNode.StopCommand;
        end;
      ClientNode.Free;
    end;
end;

procedure TFMain.ListView_NodeClick(Sender: TObject);
var
  i: Integer;
  ClientNode: TClientNode;
begin
  PublicVar.CanFoucs:= False;
  Memo_CMDLine.Clear;
  StatusBar_Status.Panels[0].Text:= '';
  for i := 0 to (ListView_Node.Items.Count - 1) do
    begin
      ClientNode:= ListView_Node.Items[i].Data;
      ClientNode.Memo_Log:= nil;
    end;
  Memo_Log.Clear;

  if (ListView_Node.Selected = nil) then
    begin
      Interface_op.DisableAllInterface;
      Exit;
    end;
  ClientNode:= ListView_Node.Selected.Data;
  ClientNode.CanModifyXML:= False;
  Interface_op.ShowClientInfoToInterface(ClientNode);

  ClientNode.Memo_Log:= Memo_Log;
  Memo_Log.Lines.Text:= ClientNode.WholeLog + ClientNode.GetWholeCommandOutput;
  Memo_Log.SelStart:= Length(Memo_Log.Lines.Text);
  SendMessage(Memo_Log.Handle, WM_VSCROLL, MAKELONG(SB_BOTTOM, 0), 0);

  if (ClientNode.isRunCMD = 1) then
    begin
      StatusBar_Status.Panels[0].Text:= 'PID = ' + ClientNode.GetPID.ToString;
    end
  else
    begin
      StatusBar_Status.Panels[0].Text:= '';
    end;

  Btn_DeleteNode.Enabled:= True;

  CheckBox_ConfigFileDir.Enabled:= True;
  CheckBox_ConfigFileDirClick(Self);
  ComboBox_ModeChange(Self);

  Label_Remark.Enabled:= True;
  Edit_Remark.Enabled:= True;
  Edit_Remark.Color:= clWhite;

  SpeedBtn_CMDLine.Enabled:= True;
  SpeedBtn_ClearLog.Enabled:= True;

  ClientNode.CanModifyXML:= True;
  PublicVar.CanFoucs:= True;
end;

procedure TFMain.ListView_NodeCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if (TClientNode(Item.Data).isRunCMD = 0) then
    ListView_Node.Canvas.Font.Color:= clBlack
  else
    ListView_Node.Canvas.Font.Color:= clBlue;
end;

procedure TFMain.ListView_NodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_Up) or (Key = VK_Down) or (Key = VK_Left) or (Key = VK_Right)  then
    ListView_NodeClick(Self);
end;

procedure TFMain.ListView_NodeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  CurPos: TPoint;
  ClientNode: TClientNode;
begin
  if (Button = mbright) and Assigned(ListView_Node.Selected)  then
    begin
      ListView_NodeClick(Self);

      ClientNode:= ListView_Node.Selected.Data;
      Menu_Start.Enabled:= not Boolean(ClientNode.isRunCMD);
      Menu_Stop.Enabled:= Boolean(ClientNode.isRunCMD);

      GetCursorPos(CurPos);
      PopupMenu_ClientNode.Popup(CurPos.X + 10, CurPos.Y + 10);
    end
  else
    begin
      Interface_op.DisableAllInterface;
    end;
end;

procedure TFMain.Menu_ShowClick(Sender: TObject);
begin
  FMain.Visible:= True;
  FMain.WindowState:= wsNormal;
end;

procedure TFMain.Menu_StartAllClick(Sender: TObject);
begin
  Btn_StartAllClick(Self);
end;

procedure TFMain.Menu_StartClick(Sender: TObject);
begin
  Btn_StartClick(Self);
end;

procedure TFMain.Menu_StopAllClick(Sender: TObject);
begin
  Btn_StopAllClick(Self);
end;

procedure TFMain.Menu_StopClick(Sender: TObject);
begin
  Btn_StopClick(Self);
end;

procedure TFMain.SpeedBtn_ClearLogClick(Sender: TObject);
begin
  TClientNode(ListView_Node.Selected.Data).WholeLog:= '';
  Memo_Log.Lines.Clear;
end;

procedure TFMain.SpeedBtn_CMDLineClick(Sender: TObject);
var
  CMDLineStr: string;
begin
  CMDLineStr:= TClientNode(ListView_Node.Selected.Data).CreateCMDLine(Edit_ClientEXEDir.Text);
  Memo_CMDLine.Lines.Text:= CMDLineStr;
end;

procedure TFMain.SpinEdit_AutoConnTimeChange(Sender: TObject);
begin
  PublicVar.AutoConnTime:= SpinEdit_AutoConnTime.Value;
  if not PublicVar.CanModifyXML then
    Exit;
  PublicVar.ProgramNode.ChildNodes['autoconn'].NodeValue:= SpinEdit_AutoConnTime.Text;
  PublicVar.XMLDocument_Para.SaveToFile;
end;

procedure TFMain.StatusBar_StatusMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, iCount, ClickIndex: Integer;
begin
  iCount:= 0;
  ClickIndex:= -1;
  for i:= 0 to (StatusBar_Status.Panels.Count - 1)  do
    begin
      iCount:= iCount + StatusBar_Status.Panels[i].Width;
      if iCount > X then
        begin
          ClickIndex:= i;
          Break;
        end;
    end;
  if ClickIndex = -1 then
    ClickIndex:= StatusBar_Status.Panels.Count - 1;
  case ClickIndex  of
    1:  ShellExecute(Application.Handle, 'open', PWideChar(SelfUpdateURL), nil, nil, SW_SHOWNORMAL);
    2:  ShellExecute(Application.Handle, 'open', PWideChar(IssuesURL), nil, nil, SW_SHOWNORMAL);
    3:  ShellExecute(Application.Handle, 'open', PWideChar(KcpTunClientDownloadURL), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TFMain.Memo_CMDLineDblClick(Sender: TObject);
begin
  Memo_CMDLine.SelectAll;
end;

procedure TFMain.Menu_CopyClick(Sender: TObject);
var
  SouClientNode, NewClientNode: TClientNode;
  NewXMLNode: IXMLNode;
  NewNodeItem: TListItem;
  NewRemarkStr, ShowCaption: string;
begin
  //克隆一个节点并保存到xml文件
  SouClientNode:= TClientNode(ListView_Node.Selected.Data);
  NewXMLNode:= SouClientNode.XMLNode.CloneNode(True);
  PublicVar.ClientNodes.ChildNodes.Add(NewXMLNode);
  PublicVar.XMLDocument_Para.SaveToFile();

  if (SouClientNode.Remark.Trim = '') then
    NewRemarkStr:= 'COPY'
  else
    NewRemarkStr:= SouClientNode.Remark + ' COPY';

  NewClientNode:= TClientNode.Create;
  NewClientNode.MainFormHandle:= Self.Handle;
  NewClientNode.XMLDocument_Para:= PublicVar.XMLDocument_Para;
  NewClientNode.XMLNode:= NewXMLNode;
  NewClientNode.Remark:= NewRemarkStr;
  NewClientNode.ReadFromXMLNode(NewXMLNode);

  ShowCaption:= NewClientNode.KCPServerIP + ':' + NewClientNode.KCPServerPort + '——' + NewClientNode.LocalPort;
  if (NewClientNode.Remark.Trim <> '') then
    ShowCaption:= NewClientNode.Remark.Trim + '(' + ShowCaption + ')';

  NewNodeItem:= ListView_Node.Items.Add;
  NewNodeItem.Caption:= ShowCaption;
  NewNodeItem.Data:= NewClientNode;
end;

procedure TFMain.Menu_DeleteClick(Sender: TObject);
begin
  Btn_DeleteNodeClick(Self);
end;

procedure TFMain.Menu_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFMain.Menu_ExportToJSONClick(Sender: TObject);
var
  ClientNode: TClientNode;
  DefaultJSONFileName: string;
  JSONStr: string;
  JSONFile: TextFile;
  isExcept: Boolean;
  ErrorInfoStr, HintStr: string;
begin
  ClientNode:= ListView_Node.Selected.Data;
  DefaultJSONFileName:= ClientNode.KCPServerIP + '.' + ClientNode.KCPServerPort + '--' + ClientNode.LocalPort;
  if (ClientNode.Remark.Trim <> '') then
    DefaultJSONFileName:= ClientNode.Remark.Trim + '(' + DefaultJSONFileName + ')';
  SaveDialog_JSON.FileName:= DefaultJSONFileName;
  if not SaveDialog_JSON.Execute then
    Exit;
  JSONStr:= ClientNode.CreateJSONConfig();

  isExcept:= False;
  ErrorInfoStr:= '';
  AssignFile(JSONFile, SaveDialog_JSON.FileName);
  try
    try
      Rewrite(JSONFile);
      Append(JSONFile);
      Write(JSONFile, JSONStr);
      Flush(JSONFile);
    except
      on E: Exception  do
        begin
          ErrorInfoStr:= E.Message;
          isExcept:= True;
        end;
    end;
  finally
    CloseFile(JSONFile);
  end;

  if isExcept then
    begin
      HintStr:= '导出参数JSON文件时出现错误，请稍后重试！错误原因为：' + ErrorInfoStr;
      Application.MessageBox(PWideChar(HintStr), '提示', MB_OK);
    end
  else
    begin
      StatusBar_Status.Panels[0].Text:= '导出参数JSON文件成功！';
//      Application.MessageBox('导出参数JSON文件成功！', '提示', MB_OK);
    end;
end;

procedure TFMain.Menu_ImportFromJSONClick(Sender: TObject);
var
  JSONStr: string;
  JSONObject: TJSONObject;
  ClientNode: TClientNode;
begin
  if Application.MessageBox('导入操作将完全覆盖现有的配置！确定要导入吗？', '提示', MB_YESNO) = MrNo then
    Exit;
  if not OpenDialog_JSON.Execute then
    Exit;
  JSONStr:= TFile.ReadAllText(OpenDialog_JSON.FileName);
  JSONObject:= TJSONObject.ParseJSONValue(JSONStr) as TJSONObject;
  if JSONObject = nil then
    begin
      Application.MessageBox('您所选择的文件不是有效的JSON格式文件，请重新选择！', '提示', MB_OK);
      Exit;
    end;
  ClientNode:= ListView_Node.Selected.Data;
  ClientNode.ReadFromJSONConfig(JSONStr);
  ListView_NodeClick(Self);
end;

procedure TFMain.TrayIcon_SysClick(Sender: TObject);
begin
  FMain.Visible:= not FMain.Visible;
  if FMain.Visible then
    begin
      FMain.WindowState:= wsNormal;
    end;
end;

initialization
  MessageID:= RegisterWindowMessage(UniqueAppStr);
  InitInstance;

end.


