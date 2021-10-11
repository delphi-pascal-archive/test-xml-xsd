object FMain: TFMain
  Left = 260
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Test XML XSD'
  ClientHeight = 273
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 16
  object BtLoadXml: TButton
    Left = 8
    Top = 40
    Width = 105
    Height = 25
    Caption = 'Open XML'
    TabOrder = 0
    OnClick = BtLoadXmlClick
  end
  object MeXml: TMemo
    Left = 120
    Top = 8
    Width = 297
    Height = 257
    TabOrder = 1
  end
  object BtLoadXsd: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 25
    Caption = 'Open XSD'
    TabOrder = 2
    OnClick = BtLoadXsdClick
  end
  object BtValidate: TButton
    Left = 8
    Top = 72
    Width = 105
    Height = 25
    Caption = 'Validate'
    TabOrder = 3
    OnClick = BtValidateClick
  end
  object BtReset: TButton
    Left = 8
    Top = 144
    Width = 105
    Height = 25
    Caption = 'Reinitialise'
    TabOrder = 4
    OnClick = BtResetClick
  end
  object Button1: TButton
    Left = 8
    Top = 240
    Width = 105
    Height = 25
    Caption = 'About'
    TabOrder = 5
    OnClick = Button1Click
  end
end
