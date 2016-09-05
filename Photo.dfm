object FPhoto: TFPhoto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #25105#30340#19987#23646#31169#20154#28608#21169#24072' ^_^'
  ClientHeight = 393
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel_Photo: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 394
    AutoSize = True
    BevelInner = bvLowered
    TabOrder = 0
    object Image_Photo: TImage
      Left = 2
      Top = 2
      Width = 690
      Height = 390
      AutoSize = True
      OnClick = Image_PhotoClick
    end
  end
end
