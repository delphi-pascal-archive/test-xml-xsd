object FAbout: TFAbout
  Left = 317
  Top = 297
  BorderStyle = bsDialog
  Caption = 'About...'
  ClientHeight = 281
  ClientWidth = 379
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object CloseButton: TButton
    Tag = 10
    Left = 263
    Top = 238
    Width = 96
    Height = 30
    Cancel = True
    Caption = '&Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = CloseButtonClick
    IsControl = True
  end
  object GroupBox1: TGroupBox
    Tag = 9
    Left = 9
    Top = 7
    Width = 357
    Height = 221
    Caption = 'Version Information'
    TabOrder = 1
    object ProgramIcon: TImage
      Tag = 8
      Left = 39
      Top = 31
      Width = 40
      Height = 39
      AutoSize = True
      Center = True
      Stretch = True
      IsControl = True
    end
    object ProductName: TLabel
      Tag = 9
      Left = 110
      Top = 33
      Width = 176
      Height = 16
      Caption = 'Test de validation XML / XSD '
      IsControl = True
    end
    object Bevel1: TBevel
      Left = 16
      Top = 84
      Width = 326
      Height = 2
    end
    object ProductLabel: TLabel
      Tag = 9
      Left = 110
      Top = 53
      Width = 99
      Height = 16
      Caption = 'avec MSXML 4.0'
      IsControl = True
    end
    object VersionMemo: TMemo
      Tag = 9
      Left = 25
      Top = 98
      Width = 311
      Height = 110
      TabStop = False
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
end
