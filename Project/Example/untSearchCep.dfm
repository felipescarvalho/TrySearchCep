object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'CEP'
  ClientHeight = 249
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 249
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 104
    ExplicitTop = 48
    ExplicitWidth = 241
    ExplicitHeight = 105
    object edtCep: TLabeledEdit
      Left = 18
      Top = 32
      Width = 121
      Height = 23
      EditLabel.Width = 21
      EditLabel.Height = 15
      EditLabel.Caption = 'Cep'
      NumbersOnly = True
      TabOrder = 0
      Text = '05424020'
    end
    object edtLogradouro: TLabeledEdit
      Left = 18
      Top = 80
      Width = 263
      Height = 23
      EditLabel.Width = 62
      EditLabel.Height = 15
      EditLabel.Caption = 'Logradouro'
      TabOrder = 1
      Text = ''
    end
    object edtCidade: TLabeledEdit
      Left = 18
      Top = 166
      Width = 263
      Height = 23
      EditLabel.Width = 37
      EditLabel.Height = 15
      EditLabel.Caption = 'Cidade'
      TabOrder = 2
      Text = ''
    end
    object edtBairro: TLabeledEdit
      Left = 18
      Top = 125
      Width = 263
      Height = 23
      EditLabel.Width = 27
      EditLabel.Height = 15
      EditLabel.Caption = 'Bairo'
      TabOrder = 3
      Text = ''
    end
    object btnConsultaCep: TButton
      Left = 145
      Top = 29
      Width = 80
      Height = 29
      Caption = 'Consulta Cep'
      TabOrder = 4
      OnClick = btnConsultaCepClick
    end
  end
end
