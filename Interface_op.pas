unit Interface_op;

interface

uses
  System.SysUtils, System.Variants, Vcl.Forms, Vcl.Graphics, System.TypInfo,
  Class_ClientNode;

function GetPublicVarFromXML(ParaXMLPathName: string): Integer;

procedure Enable_DisableAllCheckbox(State: Boolean);

procedure Enable_DisableBasePara(State: Boolean);
procedure Enable_DisableSelectPara(State: Boolean);
procedure Enable_DisableModePara(State: Boolean);
procedure Enable_DisableHiddenPara(State: Boolean);

procedure DisableAllInterfaceExceptJSON;
procedure DisableAllInterface;

procedure ShowClientInfoToInterface(ClientNode: TClientNode);

procedure WriteHint_ModeDefault;

implementation

uses
  PublicVar, Main;

function GetPublicVarFromXML(ParaXMLPathName: string): Integer;
begin
  Result:= 0;
  PublicVar.CanModifyXML:= False;
  try
    PublicVar.XMLDocument_Para.LoadFromFile(ParaXMLPathName);
    PublicVar.XMLDocument_Para.Active:= True;

    PublicVar.MainNode:= XMLDocument_Para.DocumentElement;
    PublicVar.ProgramNode:= MainNode.ChildNodes.FindNode('programpara');
    PublicVar.ClientNodes:= MainNode.ChildNodes.FindNode('clientnodes');

    PublicVar.AutoStart:= StrToInt(ProgramNode.ChildNodes.FindNode('autostart').NodeValue);
    FMain.CheckBox_AutoStart.Checked:= Boolean(PublicVar.AutoStart);

    PublicVar.Minimize:= StrToInt(ProgramNode.ChildNodes.FindNode('minimize').NodeValue);
    FMain.CheckBox_Minimize.Checked:= Boolean(PublicVar.Minimize);

    PublicVar.ClientEXEDir:= VarToStr(ProgramNode.ChildNodes.FindNode('clientexedir').NodeValue);
    FMain.Edit_ClientEXEDir.Text:= PublicVar.ClientEXEDir;

    PublicVar.AutoConn:= StrToInt(ProgramNode.ChildNodes.FindNode('autoconn').Attributes['enable']);
    PublicVar.AutoConnTime:= StrToInt(ProgramNode.ChildNodes.FindNode('autoconn').NodeValue);
    FMain.SpinEdit_AutoConnTime.Value:= PublicVar.AutoConnTime;
    FMain.CheckBox_AutoConn.Checked:= Boolean(PublicVar.AutoConn);
    FMain.CheckBox_AutoConnClick(FMain);
  except
    Result:= 1;
  end;
  PublicVar.CanModifyXML:= True;
end;

procedure Enable_DisableAllCheckbox(State: Boolean);
begin
  with FMain  do
    begin
      CheckBox_Key.Enabled:= State;
      CheckBox_Crypt.Enabled:= State;
      CheckBox_NoComp.Enabled:= State;
      CheckBox_DataShard.Enabled:= State;
      CheckBox_ParityShard.Enabled:= State;
      CheckBox_Conn.Enabled:= State;
      CheckBox_MTU.Enabled:= State;
      CheckBox_SndWnd.Enabled:= State;
      CheckBox_RcvWnd.Enabled:= State;
      CheckBox_DSCP.Enabled:= State;
      CheckBox_AutoExpire.Enabled:= State;

      CheckBox_Mode.Enabled:= State;
      CheckBox_NoDelay.Enabled:= State;
      CheckBox_Interval.Enabled:= State;
      CheckBox_Resend.Enabled:= State;
      CheckBox_NC.Enabled:= State;

      CheckBox_ACKNoDelay.Enabled:= State;
      CheckBox_KeepAlive.Enabled:= State;
      CheckBox_SockBuf.Enabled:= State;
    end;
end;

//界面上禁用或启用基础参数
procedure Enable_DisableBasePara(State: Boolean);
begin
  with FMain  do
    begin
      if State then
        begin
          Edit_LocalPort.Color:= clWindow;
          Edit_KCPServerIP.Color:= clWindow;
          Edit_KCPServerPort.Color:= clWindow;
        end
      else
        begin
          Edit_LocalPort.Color:= clBtnFace;
          Edit_KCPServerIP.Color:= clBtnFace;
          Edit_KCPServerPort.Color:= clBtnFace;
        end;
      Label_LocalPort.Enabled:= State;            Edit_LocalPort.Enabled:= State;
      Label_KCPServerIP.Enabled:= State;          Edit_KCPServerIP.Enabled:= State;
      Label_KCPServerPort.Enabled:= State;        Edit_KCPServerPort.Enabled:= State;
    end;
end;

//界面上禁用或启用可选参数
procedure Enable_DisableSelectPara(State: Boolean);
begin
  with FMain  do
    begin
      CheckBox_Key.Enabled:= State;           CheckBox_KeyClick(FMain);
      CheckBox_Crypt.Enabled:= State;         CheckBox_CryptClick(FMain);
      CheckBox_NoComp.Enabled:= State;        CheckBox_NoCompClick(FMain);
      CheckBox_DataShard.Enabled:= State;     CheckBox_DataShardClick(FMain);
      CheckBox_ParityShard.Enabled:= State;   CheckBox_ParityShardClick(FMain);
      CheckBox_Conn.Enabled:= State;          CheckBox_ConnClick(FMain);
      CheckBox_MTU.Enabled:= State;           CheckBox_MTUClick(FMain);
      CheckBox_SndWnd.Enabled:= State;        CheckBox_SndWndClick(FMain);
      CheckBox_RcvWnd.Enabled:= State;        CheckBox_RcvWndClick(FMain);
      CheckBox_DSCP.Enabled:= State;          CheckBox_DSCPClick(FMain);
      CheckBox_AutoExpire.Enabled:= State;    CheckBox_AutoExpireClick(FMain);
    end;
end;

//界面上禁用或启用模式参数
procedure Enable_DisableModePara(State: Boolean);
begin
  with FMain  do
    begin
      CheckBox_NoDelay.Enabled:= State;     CheckBox_NoDelayClick(FMain);
      CheckBox_Interval.Enabled:= State;    CheckBox_IntervalClick(FMain);
      CheckBox_Resend.Enabled:= State;      CheckBox_ResendClick(FMain);
      CheckBox_NC.Enabled:= State;          CheckBox_NCClick(FMain);
    end;
end;

//界面上禁用或启用隐藏参数
procedure Enable_DisableHiddenPara(State: Boolean);
begin
  with FMain  do
    begin
      CheckBox_ACKNoDelay.Enabled:= State;    CheckBox_ACKNoDelayClick(FMain);
      CheckBox_KeepAlive.Enabled:= State;     CheckBox_KeepAliveClick(FMain);
      CheckBox_SockBuf.Enabled:= State;       CheckBox_SockBufClick(FMain);
    end;
end;

procedure DisableAllInterfaceExceptJSON;
begin
  with FMain  do
    begin
      Label_Key.Enabled:= False;          Edit_Key.Enabled:= False;         Edit_Key.Color:= clBtnFace;
      Label_Crypt.Enabled:= False;        ComboBox_Crypt.Enabled:= False;
      Label_NoComp.Enabled:= False;
      Label_DataShard.Enabled:= False;    Edit_DataShard.Enabled:= False;   Edit_DataShard.Color:= clBtnFace;
      Label_ParityShard.Enabled:= False;  Edit_ParityShard.Enabled:= False; Edit_ParityShard.Color:= clBtnFace;
      Label_Conn.Enabled:= False;         Edit_Conn.Enabled:= False;        Edit_Conn.Color:= clBtnFace;
      Label_MTU.Enabled:= False;          Edit_MTU.Enabled:= False;         Edit_MTU.Color:= clBtnFace;
      Label_SndWnd.Enabled:= False;       Edit_SndWnd.Enabled:= False;      Edit_SndWnd.Color:= clBtnFace;
      Label_RcvWnd.Enabled:= False;       Edit_RcvWnd.Enabled:= False;      Edit_RcvWnd.Color:= clBtnFace;
      Label_DSCP.Enabled:= False;         Edit_DSCP.Enabled:= False;        Edit_DSCP.Color:= clBtnFace;
      Label_AutoExpire.Enabled:= False;   Edit_AutoExpire.Enabled:= False;  Edit_AutoExpire.Color:= clBtnFace;

      Label_Mode.Enabled:= False;         ComboBox_Mode.Enabled:= False;
      Label_NoDelay.Enabled:= False;
      Label_Interval.Enabled:= False;     Edit_Interval.Enabled:= False;    Edit_Interval.Color:= clBtnFace;
      Label_Resend.Enabled:= False;       Edit_Resend.Enabled:= False;      Edit_Resend.Color:= clBtnFace;
      Label_NC.Enabled:= False;

      Label_ACKNoDelay.Enabled:= False;
      Label_KeepAlive.Enabled:= False;    Edit_KeepAlive.Enabled:= False;   Edit_KeepAlive.Color:= clBtnFace;
      Label_SockBuf.Enabled:= False;      Edit_SockBuf.Enabled:= False;     Edit_SockBuf.Color:= clBtnFace;
    end;
end;

procedure DisableAllInterface;
begin
  with FMain  do
    begin
      Btn_DeleteNode.Enabled:= False;

      CheckBox_ConfigFileDir.Enabled:= False;
      Label_ConfigFileDir.Enabled:= False;
      Edit_ConfigFileDir.Enabled:= False;
      Btn_FindConfigFileDir.Enabled:= False;

      Label_Remark.Enabled:= False;
      Edit_Remark.Enabled:= False;
      Edit_Remark.Color:= clBtnFace;

      SpeedBtn_CMDLine.Enabled:= False;
      SpeedBtn_ClearLog.Enabled:= False;
      Btn_Start.Enabled:= False;
      Btn_Stop.Enabled:= False;

      Interface_op.Enable_DisableAllCheckbox(False);
      Interface_op.Enable_DisableBasePara(False);
      DisableAllInterfaceExceptJSON;
//      Interface_op.Enable_DisableSelectPara(False);
//      Interface_op.Enable_DisableModePara(False);
//      Interface_op.Enable_DisableHiddenPara(False);
    end;
end;

procedure ShowClientInfoToInterface(ClientNode: TClientNode);
begin
  with FMain  do
    begin
      Edit_LocalPort.Text:= ClientNode.LocalPort;
      Edit_KCPServerIP.Text:= ClientNode.KCPServerIP;
      Edit_KCPServerPort.Text:= ClientNode.KCPServerPort;

      CheckBox_Key.Checked:= Boolean(ClientNode.isKey);
      Edit_Key.Text:= ClientNode.Key;
      CheckBox_Key.OnClick(FMain);

      CheckBox_Crypt.Checked:= Boolean(ClientNode.isCrypt);
      ComboBox_Crypt.ItemIndex:= ComboBox_Crypt.Items.IndexOf(ClientNode.Crypt);
      CheckBox_Crypt.OnClick(FMain);

      CheckBox_NoComp.Checked:= Boolean(ClientNode.isNoComp);
      CheckBox_NoComp.OnClick(FMain);

      CheckBox_DataShard.Checked:= Boolean(ClientNode.isDataShard);
      Edit_DataShard.Text:= ClientNode.DataShard;
      CheckBox_DataShard.OnClick(FMain);

      CheckBox_ParityShard.Checked:= Boolean(ClientNode.isParityShard);
      Edit_ParityShard.Text:= ClientNode.ParityShard;
      CheckBox_ParityShard.OnClick(FMain);

      CheckBox_Conn.Checked:= Boolean(ClientNode.isConn);
      Edit_Conn.Text:= ClientNode.Conn;
      CheckBox_Conn.OnClick(FMain);

      CheckBox_MTU.Checked:= Boolean(ClientNode.isMTU);
      Edit_MTU.Text:= ClientNode.MTU;
      CheckBox_MTU.OnClick(FMain);

      CheckBox_SndWnd.Checked:= Boolean(ClientNode.isSndWnd);
      Edit_SndWnd.Text:= ClientNode.SndWnd;
      CheckBox_SndWnd.OnClick(FMain);

      CheckBox_RcvWnd.Checked:= Boolean(ClientNode.isRcvWnd);
      Edit_RcvWnd.Text:= ClientNode.RcvWnd;
      CheckBox_RcvWnd.OnClick(FMain);

      CheckBox_DSCP.Checked:= Boolean(ClientNode.isDSCP);
      Edit_DSCP.Text:= ClientNode.DSCP;
      CheckBox_DSCP.OnClick(FMain);

      CheckBox_AutoExpire.Checked:= Boolean(ClientNode.isAutoExpire);
      Edit_AutoExpire.Text:= ClientNode.AutoExpire;
      CheckBox_AutoExpire.OnClick(FMain);

//-------------------------------------------------------------------------------------
      ComboBox_Mode.ItemIndex:= ComboBox_Mode.Items.IndexOf(ClientNode.Mode);

      CheckBox_NoDelay.Checked:= Boolean(ClientNode.isNoDelay);
      CheckBox_NoDelay.OnClick(FMain);

      CheckBox_Interval.Checked:= Boolean(ClientNode.isInterval);
      Edit_Interval.Text:= ClientNode.Interval;
      CheckBox_Interval.OnClick(FMain);

      CheckBox_Resend.Checked:= Boolean(ClientNode.isResend);
      Edit_Resend.Text:= ClientNode.Resend;
      CheckBox_Resend.OnClick(FMain);

      CheckBox_NC.Checked:= Boolean(ClientNode.isNC);
      CheckBox_NC.OnClick(FMain);

      CheckBox_Mode.Checked:= Boolean(ClientNode.isMode);
      CheckBox_Mode.OnClick(FMain);
//-------------------------------------------------------------------------------------

      CheckBox_ACKNoDelay.Checked:= Boolean(ClientNode.isACKNoDelay);
      CheckBox_ACKNoDelay.OnClick(FMain);

      CheckBox_KeepAlive.Checked:= Boolean(ClientNode.isKeepAlive);
      Edit_KeepAlive.Text:= ClientNode.KeepAlive;
      CheckBox_KeepAlive.OnClick(FMain);

      CheckBox_SockBuf.Checked:= Boolean(ClientNode.isSockBuf);
      Edit_SockBuf.Text:= ClientNode.SockBuf;
      CheckBox_SockBuf.OnClick(FMain);

      Edit_Remark.Text:= ClientNode.Remark;

      Btn_Start.Enabled:= not Boolean(ClientNode.isRunCMD);
      Btn_Stop.Enabled:= Boolean(ClientNode.isRunCMD);

      CheckBox_ConfigFileDir.Checked:= Boolean(ClientNode.isJson);
      Edit_ConfigFileDir.Text:= ClientNode.Json;
      CheckBox_ConfigFileDir.OnClick(FMain);
    end;
end;

procedure WriteHint_ModeDefault;
var
  NoDelayStr, IntervalStr, ResendStr, NCStr: string;
begin
  with FMain  do
    begin
//      NoDelayStr:= '默认值：' + #13 + #10 + 'fast3：开启' + #13 + #10 + 'fast2：开启' + #13 + #10 +
//        'fast：不开启' + #13 + #10 + 'normal：不开启' + #13 + #10 + 'manual：不开启';
//      IntervalStr:= '默认值：' + #13 + #10 + 'fast3：10' + #13 + #10 + 'fast2：20' + #13 + #10 +
//        'fast：20' + #13 + #10 + 'normal：30' + #13 + #10 + 'manual：40';
//      ResendStr:= '默认值：' + #13 + #10 + 'fast3：2' + #13 + #10 + 'fast2：2' + #13 + #10 +
//        'fast：2' + #13 + #10 + 'normal：2' + #13 + #10 + 'manual：0';
//      NCStr:= '默认值：' + #13 + #10 + 'fast3：开启' + #13 + #10 + 'fast2：开启' + #13 + #10 +
//        'fast：开启' + #13 + #10 + 'normal：开启' + #13 + #10 + 'manual：不开启';

      NoDelayStr:= '默认值：' + #13 + #10 + 'fast3：开启' + #13 + #10 + 'fast2：开启' + #13 + #10 +
        'fast：不开启' + #13 + #10 + 'normal：不开启';
      IntervalStr:= '默认值：' + #13 + #10 + 'fast3：10' + #13 + #10 + 'fast2：20' + #13 + #10 +
        'fast：20' + #13 + #10 + 'normal：30';
      ResendStr:= '默认值：' + #13 + #10 + 'fast3：2' + #13 + #10 + 'fast2：2' + #13 + #10 +
        'fast：2' + #13 + #10 + 'normal：2';
      NCStr:= '默认值：' + #13 + #10 + 'fast3：开启' + #13 + #10 + 'fast2：开启' + #13 + #10 +
        'fast：开启' + #13 + #10 + 'normal：开启';

      CheckBox_NoDelay.Hint:= NoDelayStr;       Label_NoDelay.Hint:= NoDelayStr;
      CheckBox_Interval.Hint:= IntervalStr;     Label_Interval.Hint:= IntervalStr;   Edit_Interval.Hint:= IntervalStr;
      CheckBox_Resend.Hint:= ResendStr;         Label_Resend.Hint:= ResendStr;        Edit_Resend.Hint:= ResendStr;
      CheckBox_NC.Hint:= NCStr;                 Label_NC.Hint:= NCStr;
    end;
end;


end.
