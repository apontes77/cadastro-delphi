inherited FrameDisciplinas: TFrameDisciplinas
  Width = 834
  Height = 551
  Visible = False
  ExplicitWidth = 834
  ExplicitHeight = 551
  inherited PanelPrincipal: TPanel
    Width = 834
    Height = 551
    ExplicitWidth = 834
    ExplicitHeight = 551
    inherited Titulo: TLabel
      Width = 335
      Caption = 'Cadastro de Disciplinas'
      ExplicitWidth = 335
    end
    object lblNome: TLabel
      Left = 56
      Top = 166
      Width = 59
      Height = 24
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5987163
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnSalvar: TSpeedButton
      AlignWithMargins = True
      Left = 538
      Top = 502
      Width = 81
      Height = 33
      Caption = 'Salvar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6381921
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnSalvarClick
    end
    object btnRemover: TSpeedButton
      AlignWithMargins = True
      Left = 625
      Top = 502
      Width = 81
      Height = 33
      Caption = 'Remover'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6381921
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnRemoverClick
    end
    object btnCancelar: TSpeedButton
      AlignWithMargins = True
      Left = 712
      Top = 502
      Width = 81
      Height = 33
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6381921
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblId: TLabel
      Left = 56
      Top = 130
      Width = 28
      Height = 24
      Caption = 'ID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5987163
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnLimpar: TSpeedButton
      AlignWithMargins = True
      Left = 719
      Top = 157
      Width = 81
      Height = 33
      Caption = 'Limpar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6381921
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnLimparClick
    end
    object edtNome: TEdit
      Left = 157
      Top = 166
      Width = 556
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object GradeDisciplinas: TStringGrid
      Left = 56
      Top = 209
      Width = 737
      Height = 281
      ColCount = 2
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 1
      OnDblClick = GradeDisciplinasDblClick
      ColWidths = (
        88
        636)
    end
    object edtId: TEdit
      Left = 157
      Top = 130
      Width = 164
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
  end
end
