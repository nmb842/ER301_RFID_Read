object Form1: TForm1
  Left = 415
  Top = 110
  Width = 657
  Height = 546
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 122
    Top = 14
    Width = 187
    Height = 33
    Caption = 'MIFARE ONE '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 167
    Width = 128
    Height = 16
    Caption = 'Absolute block'#65306
  end
  object lb_info: TLabel
    Left = 86
    Top = 326
    Width = 8
    Height = 16
  end
  object Label3: TLabel
    Left = 76
    Top = 75
    Width = 48
    Height = 16
    Caption = 'PORT'#65306
  end
  object Label4: TLabel
    Left = 284
    Top = 77
    Width = 88
    Height = 16
    Caption = 'BAUD RATE'#65306
  end
  object Label7: TLabel
    Left = 40
    Top = 360
    Width = 104
    Height = 16
    Caption = 'input string:'
  end
  object Label8: TLabel
    Left = 40
    Top = 408
    Width = 112
    Height = 16
    Caption = 'output string:'
  end
  object Label5: TLabel
    Left = 64
    Top = 128
    Width = 80
    Height = 24
    Caption = 'Card SN:'
  end
  object Label9: TLabel
    Left = 272
    Top = 168
    Width = 41
    Height = 25
    Caption = 'Key:'
  end
  object Label6: TLabel
    Left = 8
    Top = 200
    Width = 137
    Height = 25
    Caption = 'Block data (hex)'
  end
  object cb_kh: TComboBox
    Left = 154
    Top = 163
    Width = 109
    Height = 24
    Style = csDropDownList
    ImeName = #35895#27468#25340#38899#36755#20837#27861' 2'
    ItemHeight = 16
    ItemIndex = 4
    TabOrder = 0
    Text = '4'
    Items.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20'
      '21'
      '22'
      '23'
      '24'
      '25'
      '26'
      '27'
      '28'
      '29'
      '30'
      '31'
      '32'
      '33'
      '34'
      '35'
      '36'
      '37'
      '38'
      '39'
      '40'
      '41'
      '42'
      '43'
      '44'
      '45'
      '46'
      '47'
      '48'
      '49'
      '50'
      '51'
      '52'
      '53'
      '54'
      '55'
      '56'
      '57'
      '58'
      '59'
      '60'
      '61'
      '62'
      '63')
  end
  object Button1: TButton
    Left = 64
    Top = 264
    Width = 85
    Height = 41
    Caption = 'Request(3)'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 264
    Width = 63
    Height = 41
    Caption = 'Read'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 292
    Top = 264
    Width = 63
    Height = 41
    Caption = 'Write'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 386
    Top = 264
    Width = 63
    Height = 41
    Caption = 'Halt'
    TabOrder = 4
    OnClick = Button4Click
  end
  object cb_port: TComboBox
    Left = 154
    Top = 71
    Width = 109
    Height = 24
    Style = csDropDownList
    ImeName = #35895#27468#25340#38899#36755#20837#27861' 2'
    ItemHeight = 16
    ItemIndex = 2
    TabOrder = 5
    Text = '3'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9')
  end
  object cb_baud: TComboBox
    Left = 370
    Top = 73
    Width = 81
    Height = 24
    Style = csDropDownList
    ImeName = #35895#27468#25340#38899#36755#20837#27861' 2'
    ItemHeight = 16
    ItemIndex = 3
    TabOrder = 6
    Text = '115200'
    Items.Strings = (
      '9600'
      '19200'
      '57600'
      '115200')
  end
  object rg_key: TRadioGroup
    Left = 278
    Top = 116
    Width = 171
    Height = 37
    Caption = 'Key set'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Key A'
      'Key B')
    TabOrder = 7
  end
  object Edit1: TEdit
    Left = 160
    Top = 360
    Width = 289
    Height = 24
    ImeName = #35895#27468#25340#38899#36755#20837#27861' 2'
    TabOrder = 8
    Text = 'RFID123'
  end
  object Edit2: TEdit
    Left = 160
    Top = 408
    Width = 289
    Height = 24
    ImeName = #35895#27468#25340#38899#36755#20837#27861' 2'
    TabOrder = 9
  end
  object btnWrieSting: TButton
    Left = 488
    Top = 352
    Width = 113
    Height = 33
    Caption = 'Write String'
    TabOrder = 10
    OnClick = btnWrieStingClick
  end
  object btnReadSting: TButton
    Left = 488
    Top = 408
    Width = 113
    Height = 33
    Caption = 'Read Sting'
    TabOrder = 11
    OnClick = btnReadStingClick
  end
  object le_xlh: TEdit
    Left = 152
    Top = 128
    Width = 113
    Height = 24
    ImeName = #35895#27468#25340#38899#36755#20837#27861' 2'
    TabOrder = 12
  end
  object le_akey: TEdit
    Left = 312
    Top = 168
    Width = 137
    Height = 24
    ImeName = #35895#27468#25340#38899#36755#20837#27861' 2'
    MaxLength = 12
    TabOrder = 13
    Text = 'FFFFFFFFFFFF'
  end
  object le_sj: TEdit
    Left = 152
    Top = 200
    Width = 297
    Height = 24
    ImeName = #35895#27468#25340#38899#36755#20837#27861' 2'
    TabOrder = 14
  end
end
