object FMain: TFMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'KCPTun '#23458#25143#31471#37197#32622#31649#29702#24037#20855
  ClientHeight = 688
  ClientWidth = 1188
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object Label_ClientEXEDir: TLabel
    Left = 284
    Top = 11
    Width = 126
    Height = 12
    Caption = 'KCPTun'#23458#25143#31471'exe'#25991#20214#65306
  end
  object Label_AutoConnUnit: TLabel
    Left = 143
    Top = 572
    Width = 12
    Height = 12
    Caption = #31186
  end
  object ListView_Node: TListView
    Left = 8
    Top = 8
    Width = 264
    Height = 521
    Columns = <
      item
        Caption = #23458#25143#31471#21015#34920
        Width = 255
      end>
    FlatScrollBars = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = ListView_NodeClick
    OnCustomDrawItem = ListView_NodeCustomDrawItem
    OnKeyUp = ListView_NodeKeyUp
    OnMouseDown = ListView_NodeMouseDown
  end
  object Btn_AddNode: TButton
    Left = 35
    Top = 600
    Width = 75
    Height = 25
    Caption = #28155#21152
    TabOrder = 4
    OnClick = Btn_AddNodeClick
  end
  object Btn_DeleteNode: TButton
    Left = 163
    Top = 600
    Width = 75
    Height = 25
    Caption = #21024#38500
    Enabled = False
    TabOrder = 5
    OnClick = Btn_DeleteNodeClick
  end
  object Btn_StartAll: TButton
    Left = 35
    Top = 639
    Width = 75
    Height = 25
    Caption = #20840#37096#21551#21160
    TabOrder = 6
    OnClick = Btn_StartAllClick
  end
  object Btn_StopAll: TButton
    Left = 163
    Top = 639
    Width = 75
    Height = 25
    Caption = #20840#37096#20572#27490
    TabOrder = 7
    OnClick = Btn_StopAllClick
  end
  object StatusBar_Status: TStatusBar
    Left = 0
    Top = 669
    Width = 1188
    Height = 19
    Panels = <
      item
        Width = 750
      end
      item
        Alignment = taCenter
        Text = #26816#26597#26356#26032
        Width = 100
      end
      item
        Alignment = taCenter
        Text = #39033#30446#20027#39029
        Width = 100
      end
      item
        Alignment = taCenter
        Text = #21442#25968#20381#25454' '#8212#8212' KcpTun '#29256#26412#65306'20160906'
        Width = 50
      end>
    OnMouseDown = StatusBar_StatusMouseDown
  end
  object Panel_ClientNodeInfo: TPanel
    Left = 278
    Top = 32
    Width = 905
    Height = 633
    BevelInner = bvLowered
    TabOrder = 10
    object Label_Remark: TLabel
      Left = 14
      Top = 313
      Width = 36
      Height = 12
      Caption = #22791#27880#65306
    end
    object SpeedBtn_ClearLog: TSpeedButton
      Left = 870
      Top = 310
      Width = 23
      Height = 22
      Hint = #28165#38500#26085#24535
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000112141F018392ED018293EC0157
        639E011315210000000000000000000000000000000000000000000000000000
        0000000000000000000000000000010B0D13017D8CE24FC2D1FD5CD3E1FF30B2
        C2FA098B9CF6015D69A9010C0D14000000000000000000000000000000000000
        0000000000000000000000000000016E7BC536B2C1FA60D8E7FF27CADFFF4FD4
        E5FF6ED9E7FF32B1C2FB018090E6011618260000000000000000000000000000
        0000000000000000000001262A431A96A5F66DDAE8FF11C5DCFF04C2DAFF04C2
        DAFF16C6DCFF5CD7E7FF56C7D5FE068898F10123283F00000000000000000000
        00000000000000000000027786D45FCFDDFF47DAEDFF19D0E7FF12CBE3FF08C4
        DCFF04C2DAFF04C2DAFF4DD3E4FF59CDDCFF058899F40110121C000000000000
        000000000000010F111A1190A0F78BEDFBFF3DE5FCFF38E4FBFF30DEF6FF24D7
        EEFF15CDE5FF05C3DBFF04C2DAFF57D6E6FF33B3C3FB015F69A8000000000000
        00000000000001303B5F2EA9B9F58AEFFDFF60EAFDFF62EBFDFF53E9FDFF3DE6
        FDFF2BDBF3FF19D0E7FF11C6DCFF4AD2E4FF68D4E2FF028192E9000000000000
        000001050507011F88D71442ABFC84EAFBFF6CECFDFF84EFFDFF6EECFDFF53E9
        FDFF45E5FBFF66E3F3FF78DDEBFF49C0CEFE1B97A6F3018091EA000000000135
        3B5F018292EB28A0B5F6294BBBFF1E39B8FF62D8F6FF64EAFDFF6DEBFDFF7EEE
        FDFF88EAF8FF44BBC9FA068C9AF7015B67A30124284001020202000000000132
        385A028899F650C8D8FF69DCECFF346EC8FF0E1CABFF63B1D7FF73DCEAFF42B7
        C6F70A8B9DF6025A649F0110121B000000000000000000000000000000000000
        00000134458101889CFE42BDCDFF78DEEBFF1766ABF7013190E4027684D20142
        4A77010C0E15000000000000000000000000000000000000000001020202012C
        4995024B7BF40C77B2FF0288A1FF33AEBEFE1D98A8F20122263D000000000000
        00000000000000000000000000000000000000000000000000000121366F044F
        81F4107BBCFF117EC1FF024F7EF2016B7CCE018B9CFF01171A29000000000000
        0000000000000000000000000000000000000000000000000000014673ED0D73
        B2FF117EC1FF0B6CA9FF01406ADA0102020201485182010B0D13000000000000
        000000000000000000000000000000000000000000000000000001426EE50B6A
        A6FF0C6EABFF014877F501142144000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000001121D3B0141
        6BDA01436DE30115224700000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedBtn_ClearLogClick
    end
    object SpeedBtn_CMDLine: TSpeedButton
      Left = 484
      Top = 310
      Width = 23
      Height = 22
      Hint = #21629#20196#39044#35272
      Flat = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000FFFFFF00FF80
        8000CCCCCC006355550068586000978787006F5A6300978B8B006A555D006A54
        5B0095888A0085767800968A8B006A555C00806F7200A69C9C006B555C00BBB4
        B300B3965800735D5C00C6A857006A555C00D4B556006B555C006B555D006B55
        5C00A09596006C555D00B0955D009F9495006F595E00A2885F00FDDA5300FFDC
        5300EFCE5400DCBD5600FFDD56006A545C00705A5F00A2895F00725D6400715E
        6400725E640079666C0086767B008E7F820096898B00FFF1BA00FFF9E1000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000030000
        000000000000030000000009151B15090000000009151B150900081316201613
        0800000813162016130810142124241410000010142124241410172221303022
        180404192221303022170D12212F2F1C292525281C212F2F120D061E1F232726
        2B25252B2627231F1E06000B2B2A2B2D2C0E0E2C2D2B2A2B0B0000000A2E2E2E
        2E05052E2E2E2E0A00000000000C2E2E1D00001A2E2E0C00000000000000070F
        110000110F070000000000000000000102000002010000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedBtn_CMDLineClick
    end
    object Label_ConfigFileDir: TLabel
      Left = 32
      Top = 11
      Width = 102
      Height = 12
      Caption = #20351#29992#37197#32622#25991#20214'(c)'#65306
    end
    object GroupBox_BascPara: TGroupBox
      Left = 11
      Top = 33
      Width = 458
      Height = 72
      Caption = #22522#30784#21442#25968
      TabOrder = 3
      object Label_LocalPort: TLabel
        Left = 47
        Top = 21
        Width = 102
        Height = 12
        Caption = #26412#22320#20390#21548#31471#21475'(l)'#65306
        ParentShowHint = False
        ShowHint = True
      end
      object Label_KCPServerIP: TLabel
        Left = 41
        Top = 47
        Width = 108
        Height = 12
        Caption = 'KCP'#26381#21153#22120#22320#22336'(r)'#65306
        ParentShowHint = False
        ShowHint = True
      end
      object Label_KCPServerPort: TLabel
        Left = 313
        Top = 47
        Width = 36
        Height = 12
        Hint = #40664#35748#20540#65306'29900'
        Caption = #31471#21475#65306
        ParentShowHint = False
        ShowHint = True
      end
      object Edit_LocalPort: TEdit
        Left = 155
        Top = 18
        Width = 121
        Height = 20
        MaxLength = 5
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = Edit_LocalPortChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
      object Edit_KCPServerIP: TEdit
        Left = 155
        Top = 44
        Width = 121
        Height = 20
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = Edit_KCPServerIPChange
      end
      object Edit_KCPServerPort: TEdit
        Left = 354
        Top = 44
        Width = 81
        Height = 20
        Hint = #40664#35748#20540#65306'29900'
        MaxLength = 5
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnChange = Edit_KCPServerPortChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
    end
    object GroupBox_SelectPara: TGroupBox
      Left = 11
      Top = 112
      Width = 458
      Height = 190
      Caption = #21487#36873#21442#25968'('#21152#26143#21442#25968#38656#35201#19982#26381#21153#31471#20445#25345#19968#33268')'
      TabOrder = 4
      object Label_Key: TLabel
        Left = 31
        Top = 26
        Width = 132
        Height = 12
        Hint = #40664#35748#20540#65306'it'#39's a secrect'
        Caption = #9733'     '#36890#35759#23494#38053'(key)'#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label_Crypt: TLabel
        Left = 31
        Top = 54
        Width = 132
        Height = 12
        Hint = #40664#35748#20540#65306'aes'
        Caption = #9733'   '#21152#23494#26041#24335'(crypt)'#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label_Conn: TLabel
        Left = 79
        Top = 110
        Width = 84
        Height = 12
        Hint = #40664#35748#20540#65306'1'
        Caption = #36830#25509#25968'(conn)'#65306
        ParentShowHint = False
        ShowHint = True
      end
      object Label_MTU: TLabel
        Left = 321
        Top = 109
        Width = 84
        Height = 12
        Hint = #40664#35748#20540#65306'1350'
        Caption = 'MTU'#22823#23567'(mtu)'#65306
        ParentShowHint = False
        ShowHint = True
      end
      object Label_SndWnd: TLabel
        Left = 55
        Top = 138
        Width = 108
        Height = 12
        Hint = #40664#35748#20540#65306'128'
        Caption = #21457#36865#31383#21475'(sndwnd)'#65306
        ParentShowHint = False
        ShowHint = True
      end
      object Label_RcvWnd: TLabel
        Left = 297
        Top = 137
        Width = 108
        Height = 12
        Hint = #40664#35748#20540#65306'1024'
        Caption = #25509#25910#31383#21475'(rcvwnd)'#65306
        ParentShowHint = False
        ShowHint = True
      end
      object Label_DSCP: TLabel
        Left = 43
        Top = 166
        Width = 120
        Height = 12
        Hint = #40664#35748#20540#65306'0'
        Caption = #25968#25454#21253#20248#20808#32423'(dscp)'#65306
        ParentShowHint = False
        ShowHint = True
      end
      object Label_DataShard: TLabel
        Left = 31
        Top = 82
        Width = 132
        Height = 12
        Hint = #40664#35748#20540#65306'10'
        Caption = #9733' '#25968#25454#22359'(datashard)'#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label_ParityShard: TLabel
        Left = 261
        Top = 81
        Width = 144
        Height = 12
        Hint = #40664#35748#20540#65306'3'
        Caption = #9733' '#26657#39564#22359'(parityshard)'#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label_NoComp: TLabel
        Left = 332
        Top = 54
        Width = 114
        Height = 12
        Hint = #40664#35748#20540#65306#19981#24320#21551
        Caption = #9733' '#31105#29992#21387#32553'(nocomp)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label_AutoExpire: TLabel
        Left = 273
        Top = 166
        Width = 132
        Height = 12
        Hint = #40664#35748#20540#65306'0'
        Caption = #36807#26399#26102#38388'(autoexpire)'#65306
        ParentShowHint = False
        ShowHint = True
      end
      object CheckBox_Key: TCheckBox
        Left = 10
        Top = 24
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'it'#39's a secrect'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = CheckBox_KeyClick
      end
      object Edit_Key: TEdit
        Left = 164
        Top = 22
        Width = 281
        Height = 20
        Hint = #40664#35748#20540#65306'it'#39's a secrect'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = Edit_KeyChange
      end
      object CheckBox_Crypt: TCheckBox
        Left = 10
        Top = 52
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'aes'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = CheckBox_CryptClick
      end
      object ComboBox_Crypt: TComboBox
        Left = 164
        Top = 50
        Width = 113
        Height = 20
        Hint = #40664#35748#20540#65306'aes'
        Style = csDropDownList
        DropDownCount = 20
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnChange = ComboBox_CryptChange
        Items.Strings = (
          'aes'
          'aes-128'
          'aes-192'
          'salsa20'
          'blowfish'
          'twofish'
          'cast5'
          '3des'
          'tea'
          'xtea'
          'xor'
          'none')
      end
      object CheckBox_Conn: TCheckBox
        Left = 10
        Top = 108
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'1'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = CheckBox_ConnClick
      end
      object Edit_Conn: TEdit
        Left = 164
        Top = 106
        Width = 41
        Height = 20
        Hint = #40664#35748#20540#65306'1'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnChange = Edit_ConnChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
      object CheckBox_MTU: TCheckBox
        Left = 244
        Top = 108
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'1350'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = CheckBox_MTUClick
      end
      object Edit_MTU: TEdit
        Left = 406
        Top = 105
        Width = 41
        Height = 20
        Hint = #40664#35748#20540#65306'1350'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnChange = Edit_MTUChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
      object CheckBox_SndWnd: TCheckBox
        Left = 10
        Top = 136
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'128'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        OnClick = CheckBox_SndWndClick
      end
      object Edit_SndWnd: TEdit
        Left = 164
        Top = 134
        Width = 41
        Height = 20
        Hint = #40664#35748#20540#65306'128'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        OnChange = Edit_SndWndChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
      object CheckBox_RcvWnd: TCheckBox
        Left = 244
        Top = 136
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'1024'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        OnClick = CheckBox_RcvWndClick
      end
      object Edit_RcvWnd: TEdit
        Left = 406
        Top = 133
        Width = 41
        Height = 20
        Hint = #40664#35748#20540#65306'1024'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        OnChange = Edit_RcvWndChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
      object CheckBox_NoComp: TCheckBox
        Left = 315
        Top = 52
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306#19981#24320#21551
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = CheckBox_NoCompClick
      end
      object CheckBox_DSCP: TCheckBox
        Left = 10
        Top = 164
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'0'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
        OnClick = CheckBox_DSCPClick
      end
      object Edit_DSCP: TEdit
        Left = 164
        Top = 162
        Width = 41
        Height = 20
        Hint = #40664#35748#20540#65306'0'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        OnChange = Edit_DSCPChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
      object CheckBox_DataShard: TCheckBox
        Left = 10
        Top = 80
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'10'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = CheckBox_DataShardClick
      end
      object Edit_DataShard: TEdit
        Left = 164
        Top = 78
        Width = 41
        Height = 20
        Hint = #40664#35748#20540#65306'10'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnChange = Edit_DataShardChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
      object CheckBox_ParityShard: TCheckBox
        Left = 244
        Top = 80
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'3'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = CheckBox_ParityShardClick
      end
      object Edit_ParityShard: TEdit
        Left = 406
        Top = 77
        Width = 41
        Height = 20
        Hint = #40664#35748#20540#65306'3'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnChange = Edit_ParityShardChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
      object CheckBox_AutoExpire: TCheckBox
        Left = 244
        Top = 164
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'0'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        OnClick = CheckBox_AutoExpireClick
      end
      object Edit_AutoExpire: TEdit
        Left = 406
        Top = 162
        Width = 41
        Height = 20
        Hint = #40664#35748#20540#65306'0'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 20
        OnChange = Edit_AutoExpireChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
    end
    object GroupBox_Mode: TGroupBox
      Left = 480
      Top = 33
      Width = 417
      Height = 88
      Caption = #20256#36755#27169#24335
      TabOrder = 5
      object Label_Interval: TLabel
        Left = 35
        Top = 45
        Width = 120
        Height = 12
        Hint = #40664#35748#20540#65306'40'
        Caption = #38388#38548#26102#38388'(interval)'#65306
        ParentShowHint = False
        ShowHint = True
      end
      object Label_Resend: TLabel
        Left = 250
        Top = 45
        Width = 108
        Height = 12
        Hint = #40664#35748#20540#65306'0'
        Caption = #24555#36895#37325#20256'(resend)'#65306
        ParentShowHint = False
        ShowHint = True
      end
      object Label_NC: TLabel
        Left = 35
        Top = 67
        Width = 72
        Height = 12
        Hint = #40664#35748#20540#65306#19981#24320#21551
        Caption = #20851#38381#27969#25511'(nc)'
        ParentShowHint = False
        ShowHint = True
      end
      object Label_Mode: TLabel
        Left = 59
        Top = 23
        Width = 96
        Height = 12
        Hint = #40664#35748#20540#65306'fast'
        Caption = #27169#24335#36873#25321'(mode)'#65306
        ParentShowHint = False
        ShowHint = True
      end
      object Label_NoDelay: TLabel
        Left = 250
        Top = 23
        Width = 144
        Height = 12
        Hint = #40664#35748#20540#65306#19981#24320#21551
        Caption = #21551#29992'nodelay'#27169#24335'(nodelay)'
        ParentShowHint = False
        ShowHint = True
      end
      object CheckBox_NoDelay: TCheckBox
        Left = 232
        Top = 22
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306#19981#24320#21551
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = CheckBox_NoDelayClick
      end
      object CheckBox_Interval: TCheckBox
        Left = 14
        Top = 44
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'40'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = CheckBox_IntervalClick
      end
      object Edit_Interval: TEdit
        Left = 154
        Top = 42
        Width = 41
        Height = 20
        Hint = #40664#35748#20540#65306'40'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnChange = Edit_IntervalChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
      object CheckBox_Resend: TCheckBox
        Left = 232
        Top = 44
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'0'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = CheckBox_ResendClick
      end
      object Edit_Resend: TEdit
        Left = 358
        Top = 42
        Width = 41
        Height = 20
        Hint = #40664#35748#20540#65306'0'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnChange = Edit_ResendChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
      object CheckBox_NC: TCheckBox
        Left = 14
        Top = 66
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306#19981#24320#21551
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = CheckBox_NCClick
      end
      object CheckBox_Mode: TCheckBox
        Left = 14
        Top = 22
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'fast'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = CheckBox_ModeClick
      end
      object ComboBox_Mode: TComboBox
        Left = 154
        Top = 20
        Width = 59
        Height = 20
        Hint = #40664#35748#20540#65306'fast'
        Style = csDropDownList
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = ComboBox_ModeChange
        Items.Strings = (
          'fast3'
          'fast2'
          'fast'
          'normal'
          'manual')
      end
    end
    object Memo_Log: TMemo
      Left = 6
      Top = 339
      Width = 891
      Height = 287
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 11
    end
    object Edit_Remark: TEdit
      Left = 49
      Top = 310
      Width = 420
      Height = 20
      TabOrder = 7
      OnChange = Edit_RemarkChange
    end
    object Btn_Start: TButton
      Left = 577
      Top = 308
      Width = 75
      Height = 25
      Caption = #21551#21160
      TabOrder = 8
      OnClick = Btn_StartClick
    end
    object Btn_Stop: TButton
      Left = 733
      Top = 308
      Width = 75
      Height = 25
      Caption = #20572#27490
      TabOrder = 9
      OnClick = Btn_StopClick
    end
    object Memo_CMDLine: TMemo
      Left = 480
      Top = 188
      Width = 417
      Height = 114
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 10
      OnDblClick = Memo_CMDLineDblClick
    end
    object GroupBox_HiddenPara: TGroupBox
      Left = 480
      Top = 125
      Width = 417
      Height = 61
      Caption = #38544#34255#21442#25968
      TabOrder = 6
      object Label_ACKNoDelay: TLabel
        Left = 36
        Top = 19
        Width = 120
        Height = 12
        Hint = #40664#35748#20540#65306#19981#24320#21551
        Caption = #31435#21363#21709#24212'(acknodelay)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label_SockBuf: TLabel
        Left = 36
        Top = 42
        Width = 162
        Height = 12
        Hint = #40664#35748#20540#65306'4194304'
        Caption = 'socket'#32531#20914#21306#22823#23567'(sockbuf)'#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label_KeepAlive: TLabel
        Left = 205
        Top = 19
        Width = 150
        Height = 12
        Hint = #40664#35748#20540#65306'10'
        Caption = #20445#25345#36830#25509#26102#38388'(keepalive)'#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object CheckBox_ACKNoDelay: TCheckBox
        Left = 14
        Top = 18
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306#19981#24320#21551
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = CheckBox_ACKNoDelayClick
      end
      object CheckBox_SockBuf: TCheckBox
        Left = 14
        Top = 39
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'4194304'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = CheckBox_SockBufClick
      end
      object Edit_SockBuf: TEdit
        Left = 200
        Top = 37
        Width = 76
        Height = 20
        Hint = #40664#35748#20540#65306'4194304'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnChange = Edit_SockBufChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
      object CheckBox_KeepAlive: TCheckBox
        Left = 185
        Top = 18
        Width = 17
        Height = 17
        Hint = #40664#35748#20540#65306'10'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = CheckBox_KeepAliveClick
      end
      object Edit_KeepAlive: TEdit
        Left = 357
        Top = 16
        Width = 41
        Height = 20
        Hint = #40664#35748#20540#65306'10'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnChange = Edit_KeepAliveChange
        OnKeyPress = Edit_LocalPortKeyPress
      end
    end
    object CheckBox_ConfigFileDir: TCheckBox
      Left = 11
      Top = 9
      Width = 17
      Height = 17
      TabOrder = 0
      OnClick = CheckBox_ConfigFileDirClick
    end
    object Edit_ConfigFileDir: TEdit
      Left = 134
      Top = 8
      Width = 690
      Height = 20
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      OnChange = Edit_ConfigFileDirChange
    end
    object Btn_FindConfigFileDir: TButton
      Left = 830
      Top = 6
      Width = 70
      Height = 25
      Caption = #26597#25214
      TabOrder = 2
      OnClick = Btn_FindConfigFileDirClick
    end
  end
  object CheckBox_AutoStart: TCheckBox
    Left = 8
    Top = 542
    Width = 105
    Height = 17
    Caption = ' '#31243#24207#24320#26426#33258#21551
    TabOrder = 1
    OnClick = CheckBox_AutoStartClick
  end
  object Edit_ClientEXEDir: TEdit
    Left = 412
    Top = 8
    Width = 690
    Height = 20
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
    OnChange = Edit_ClientEXEDirChange
  end
  object Btn_FindClientEXE: TButton
    Left = 1108
    Top = 6
    Width = 75
    Height = 25
    Caption = #27983#35272
    TabOrder = 9
    OnClick = Btn_FindClientEXEClick
  end
  object CheckBox_Minimize: TCheckBox
    Left = 147
    Top = 542
    Width = 125
    Height = 17
    Caption = ' '#31243#24207#21551#21160#21518#26368#23567#21270
    TabOrder = 2
    OnClick = CheckBox_MinimizeClick
  end
  object CheckBox_AutoConn: TCheckBox
    Left = 8
    Top = 570
    Width = 81
    Height = 17
    Caption = ' '#33258#21160#37325#36830
    TabOrder = 3
    OnClick = CheckBox_AutoConnClick
  end
  object SpinEdit_AutoConnTime: TSpinEdit
    Left = 89
    Top = 568
    Width = 49
    Height = 21
    MaxLength = 3
    MaxValue = 999
    MinValue = 1
    TabOrder = 12
    Value = 0
    OnChange = SpinEdit_AutoConnTimeChange
  end
  object OpenDialog_ClientEXE: TOpenDialog
    Filter = 'KCPTun'#23458#25143#31471'|client_windows_*.exe'
    Left = 48
    Top = 344
  end
  object PopupMenu_Tray: TPopupMenu
    AutoHotkeys = maManual
    Images = ImageList_Menu
    Left = 120
    Top = 400
    object Menu_Show: TMenuItem
      Caption = #26174#31034'(&S)'
      ImageIndex = 0
      OnClick = Menu_ShowClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Menu_StartAll: TMenuItem
      Caption = #20840#37096#21551#21160'(&R)'
      ImageIndex = 1
      OnClick = Menu_StartAllClick
    end
    object Menu_StopAll: TMenuItem
      Caption = #20840#37096#20572#27490'(&P)'
      ImageIndex = 2
      OnClick = Menu_StopAllClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Menu_Exit: TMenuItem
      Caption = #36864#20986'(&Q)'
      ImageIndex = 3
      OnClick = Menu_ExitClick
    end
  end
  object TrayIcon_Sys: TTrayIcon
    Hint = 'KCPTun '#23458#25143#31471#37197#32622#31649#29702#24037#20855
    PopupMenu = PopupMenu_Tray
    Visible = True
    OnClick = TrayIcon_SysClick
    Left = 48
    Top = 400
  end
  object ImageList_Menu: TImageList
    Left = 209
    Top = 398
    Bitmap = {
      494C010104001800EC0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F600CECECE00C5C5C500C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C7C7C700C6C6C600D0D0D000F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DBDBDB0096969600707070006F6F
      6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F
      6F006F6F6F006F6F6F0070707000969696000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4847200825137007E4A32007E4A
      32007D4A32007E4A32007D4A32007C4932007C4932007C4932007C4932007C48
      32007B4832007A47300077685C00CDCDCD000000000000000000000000000000
      000000000000C1BAB7009D5E3E00A3410900925232008F888500A4A4A4000000
      000000000000000000000000000000000000848484009F9F9F009F9F9F006565
      65007A7A7A005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F5F005F5F
      5F005F5F5F005F5F5F007B7B7B00707070000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B00000000000000000000000000C25B1700D18E4F00D4986500D497
      6200D4976300D99C6700E0A36E00DEA16D00E1A36F00E3A67300E6A87500EAAB
      7800EDB17E00F6AC6D0095592100C0C0C000000000000000000000000000CCCC
      CC00A5786200A2461000D3842D00EFBC7500D88D3E00A24814008E624B009393
      9300ACACAC000000000000000000000000009F9F9F00E2E2E200DFDFDF001313
      13005F5F5F001C1C1C0010101000111111001212120011111100121212001212
      1200121212000E0E0E005F5F5F006F6F6F000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B00000000000000000000000000BA632D00D9D5CB00CED9E300D8DF
      E6007A7A7A00D8E0E600C6CDD300F2FAFF00DDE5EB00DAE1E700D7DEE400D4DB
      E200D3DEE600FAEEE100985F2600C1C1C1000000000000000000AF9689009E4C
      1F00BD641200EAB36300FCF3E600FFFFFF00FDF5EA00F4C48800C67435009C45
      17008C7265009999990000000000000000009F9F9F00E5E5E500E2E2E2002A2A
      2A00606060003D3D3D0012121200121212001313130013131300131313001414
      140013131300080808005F5F5F006F6F6F000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B00000000000000000000000000BA632E00E9DECF007A7A7A00DAD9
      D900F4F4F300CECECD007A7A7A00F9F8F800DDDCDC00D4D4D300CECDCD00C7C6
      C600C2C4C600EEDDCB00985E2700C1C1C10000000000A55F3C00B1530500D991
      3200F5DDBA00FFFFFF00D2A68F00A64D2000CC998000FFFFFF00FBE9D100ECB3
      7900BD683100924C290094878100000000009F9F9F00E8E8E800E5E5E5007171
      710049494900777777001B1B1B00141414001414140014141400141414001414
      140013131300020202007F7F7F006F6F6F000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B00000000000000000000000000BB632E00E7DCCC00FCFDFE00FEFE
      FE00B9B9B900B4B4B400EEEEEE00F6F6F600E1E1E000DADADA00D5D5D500CECE
      CD00CACCCF00EEDCCB00975E2700C1C1C100A9562D00B75E1100ECC38500FDF8
      F000E6CCBF00AB532300C0691E00ECB05E00C36F2900AB542600E6CCBF00FFFB
      F700FCE0C100C477440097441B00000000009F9F9F00ECECEC00E9E9E900D8D8
      D8003F3F3F00767676007D7D7D001D1D1D001515150015151500151515001414
      140004040400636363009F9F9F006F6F6F000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00007B7B7B00000000000000000000000000BB632E00EEE4D3007A7A7A00DEDE
      DE00E7E7E700E1E1E100F2F2F200F7F7F700E3E3E300DDDDDD00D8D8D800D2D2
      D100CDCFD200ECDAC900965E2700C1C1C100ECE5E200F2E6DF00F2E6DF00B973
      5000B4580E00E2A04600F7E1C100FFFFFF00F9E5CA00ECB26D00BB642800B973
      5000F2E6DF00F2E6DF00B1ABA700000000009F9F9F00F2F2F200F0F0F000EBEB
      EB00D8D8D800444444006F6F6F00898989004C4C4C00202020000E0E0E000202
      020059595900C8C8C8009F9F9F006F6F6F000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B00000000000000000000000000BC642F00EFE4D500EAEEEF00CCCC
      CC007A7A7A00E8E8E8007A7A7A00FCFCFC00E8E8E800E1E1E100DCDCDC00D7D7
      D600D1D4D600EAD8C700965E2700C1C1C100F1EBE800CC998000AC501300CE7F
      2000F0C99100FFFFFF00D2A68F00A64D2000D2A68F00FFFFFF00F9DBB500DF9E
      6100B15A2800CC998000D4CCCA00000000009F9F9F00FAFAFA00F9F9F900F3F3
      F300EAEAEA00E5E5E50038383800616161006C6C6C00131313000D0D0D009D9D
      9D00CECECE00CBCBCB009F9F9F006F6F6F000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B00000000000000000000000000BC653000EEE4D500FFFFFF00F7F7
      F700EFEFEF00EFEFEF00D0D0D000FDFDFD00EDEDED00E5E5E500DFDFDF00DBDA
      DA00D5D7DA00E8D6C500965D2700C1C1C100A9562D00B0520100E5AD5700FBF1
      E200E6CCBF00AB552600C7773A00F9C28300CA7C4500AC562900E6CCBF00FEF7
      EE00FBD5AA00BE6A350097441B00000000009F9F9F00FEFEFE00FEFEFE00F9F9
      F900EFEFEF00CCCCCC00393939008E8E8E001E1E1E0017171700060606008484
      8400D1D1D100CECECE009F9F9F006F6F6F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B00000000000000000000000000BD653000F6E9D900D3D6D800EBEB
      EB007A7A7A00DDDDDD00FFFFFF00FCFCFC00EFEFEF00E9E9E900E4E4E400DFDE
      DE00D9DBDE00E5D3C200955D2600C1C1C100E3D6D000E6CCBF00F2E6DF00B973
      5000B75E1B00E39E4C00DBBE8100DFC48A00F7BE7B00D2AC6B006E621C00B973
      5000F2E6DF00E6CCBF00A2948E00000000009F9F9F00FEFEFE00FEFEFE00FCFC
      FC00F3F3F30099999900787878006A6A6A001818180017171700101010004343
      4300D3D3D300D0D0D0009F9F9F006F6F6F000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B00000000000000000000000000BD663100FAECDA007A7A7A00E6E6
      E600E1E1E100E8E8E800EFEFEF00FEFEFE00F3F3F300EEEEEE00E8E8E800E3E3
      E200DDE0E200E4D2C000955C2600C1C1C100F4EEEA00CC998000AD521600D07F
      21009ABF9A0087D1C30069E9F80084E5E50096E6DD0063BD89001FA53F00678F
      3E00B25B2A00CC998000E4DDDA00000000009F9F9F00FFFFFF00FFFFFF00FEFE
      FE00F8F8F80095959500797979007B7B7B001818180018181800111111003737
      3700D6D6D600D3D3D3009F9F9F006F6F6F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B00000000000000000000000000BD673200F9EDD900EEF0F200F6F6
      F600ECECEC00D5D5D5007A7A7A00FFFFFF00F7F7F700F1F1F100ECECEC00E7E7
      E700E0E3E500E2D1BE00955B2500C1C1C100AB582E00B1520100DB8A0E00A6A5
      61005ACDD3003198AC000B1C1F001A3A3E006DEAF8008FE3DD00378B3C003F7F
      2200F9C18200BE6A34009E4C2200000000009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FCFCFC00E1E1E1005E5E5E009C9C9C002828280018181800070707007C7C
      7C00D9D9D900D6D6D6009F9F9F006F6F6F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD653000FDF0DE007A7A7A00E2E3
      E5007A7A7A00D7D9DB00F7F9FA00FFFFFF00FDFFFF00F7F9FB00F2F4F600EDF0
      F200E6ECF100E1D1C200935A2400C0C0C000F1E4DE00B6704D00AD4C01008B97
      610031CEED002093AD000E363F001F616D0058E3F900B9BF8C00EEAD5700E6A3
      5700BC662B00A9634000DDD0CA00000000009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFBFB00939393006565650060606000161616002B2B2B00D2D2
      D200DCDCDC00D9D9D9009F9F9F006F6F6F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0693600FCEBD500FFFCF900FAF7
      F300F7F5F200F5F3F000F4F1ED00EDECE900E8E6E500E2E1E000DCDBD900D8D6
      D500D1D2D300D1BFAC0099602A00CDCDCD000000000000000000E4CBBE00AF5D
      2E00647C6F0071B0900029D4FC0080B99B0094BA9100DCA24400C16C2300A656
      2A00CFB6A9000000000000000000000000009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00F7F7F700B9B9B9007777770091919100E6E6E600E3E3
      E300DFDFDF00DCDCDC009F9F9F00707070000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000007B00
      000000000000000000000000000000000000E2AE8300DB934C00DA975600D894
      5300D7935200D4925000D38F4F00D28E4D00D18E4D00D08A4600CF894400CD8A
      4A00CC884900D3874000B88F6900F7F7F7000000000000000000000000000000
      0000D1A38D00A6490F00C8710300DA890D00CD781300A4481100BC9079000000
      0000000000000000000000000000000000009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00F9F9F900F3F3F300EFEFEF00ECECEC00E9E9E900E6E6
      E600E2E2E200DFDFDF009F9F9F00969696000000000000000000000000000000
      0000000000000000000000000000000000007B00000000000000000000007B00
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000F8F1EE00BD7E5E00A13D0000B5765600E7E0DD00000000000000
      000000000000000000000000000000000000868686009F9F9F009F9F9F009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F009F9F9F0084848400DBDBDB000000000000000000000000000000
      0000000000000000000000000000000000007B0000007B0000007B0000007B00
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000F81F0000FE83
      0000E0070000FE830000C00300004283000080010000F883000000010000F993
      0000000100002883000000010000F003000000010000FC83000000010000F883
      000000010000FC83000000010000FF83000000010000FFFF0000C0070000FF0F
      0000F01F0000FF6F0000F83F0000FF0F00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu_ClientNode: TPopupMenu
    AutoHotkeys = maManual
    Left = 48
    Top = 272
    object Menu_Start: TMenuItem
      Caption = #21551#21160'(&R)'
      OnClick = Menu_StartClick
    end
    object Menu_Stop: TMenuItem
      Caption = #20572#27490'(&P)'
      OnClick = Menu_StopClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Menu_Copy: TMenuItem
      Caption = #22797#21046#33410#28857'(&C)'
      OnClick = Menu_CopyClick
    end
    object Menu_Delete: TMenuItem
      Caption = #21024#38500'(&D)'
      OnClick = Menu_DeleteClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object Menu_ExportToJSON: TMenuItem
      Caption = #23548#20986#21040'JSON'#25991#20214'(&E)'
      OnClick = Menu_ExportToJSONClick
    end
    object Menu_ImportFromJSON: TMenuItem
      Caption = #20174'JSON'#25991#20214#23548#20837'(&I)'
      OnClick = Menu_ImportFromJSONClick
    end
  end
  object OpenDialog_JSON: TOpenDialog
    Filter = 'KCPTun'#37197#32622#25991#20214'|*.*'
    Left = 168
    Top = 344
  end
  object SaveDialog_JSON: TSaveDialog
    DefaultExt = 'json'
    Filter = 'JSON'#37197#32622#25991#20214'|*.json'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 168
    Top = 272
  end
end
