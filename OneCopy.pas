unit OneCopy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  ComCtrls, ExtCtrls, StdCtrls;

const
  MI_QueryWindowHandle = 1;
  MI_RespondWindowHandle = 2;

  MI_Error_None = 0;
  MI_Error_FailSubClass = 1;
  MI_Error_CreatingMutex = 2;

const
  UniqueAppStr = 'kcptun_gclient';

var
  MessageID: Integer;
  WProc: TFNWndProc;
  MutHandle: THandle;
  MIError: Integer;

procedure InitInstance;

implementation

function NewWndProc(Handle: HWnd; Msg: Integer; wParam, lParam: Longint): Longint; stdcall;
begin
  Result:= 0;
  if Msg = MessageID  then
    begin
      case wParam of
        MI_QueryWindowHandle:
          begin
            if IsIconic(Application.Handle)  then
              begin
                Application.MainForm.WindowState:= wsNormal;
                Application.Restore;
              end;
            PostMessage(HWND(lParam), MessageID, MI_RespondWindowHandle,
                        Application.MainForm.Handle);
          end;
        MI_RespondWindowHandle:
          begin
            SetForegroundWindow(HWND(lParam));
            Application.Terminate;
          end;
      end;//case
    end
  else
    Result:= CallWindowProc(WProc, Handle, Msg, wParam, lParam);
end;{NewWndProc}

procedure SubClassApplication;
begin
  WProc:= TFNWndProc(SetWindowLong(Application.Handle, GWL_WNDPROC, Longint(@NewWndProc)));
  if WProc = nil  then
    MIError:= MIError or MI_Error_FailSubClass;
end;{SubClassApplication}

procedure DoFirstInstance;
begin
  MutHandle:= CreateMutex(nil, False, UniqueAppStr);
  if MutHandle = 0  then
    MIError:= MIError or MI_Error_CreatingMutex;
end;{DoFirstInstance}

procedure BroadcastFoucusMessage;
var
  BSMRecipients: DWord;
begin
  Application.ShowMainForm:= False;
  BSMRecipients:= BSM_Applications;
  BroadCastSystemMessage(BSF_IGNORECURRENTTASK or BSF_POSTMESSAGE,
                         @BSMRecipients, MessageID, MI_QueryWindowHandle,
                         Application.Handle);
end;{BroadcastFoucusMessage}

procedure InitInstance;
begin
  SubClassApplication;
  MutHandle:= OpenMutex(MUTEX_ALL_ACCESS, False, UniqueAppStr);
  if MutHandle = 0  then
    DoFirstInstance
  else
    {BroadcastFoucusMessage;
    Application.Terminate;}
    Halt;
end;{InitInstance}

end.
