inherited FrameTurmas: TFrameTurmas
  Width = 846
  Height = 606
  Visible = False
  ExplicitWidth = 846
  ExplicitHeight = 606
  inherited PanelPrincipal: TPanel
    Width = 846
    Height = 606
    ExplicitWidth = 901
    ExplicitHeight = 518
    inherited Titulo: TLabel
      Width = 292
      Caption = 'Cadastro de Turmas'
      ExplicitWidth = 292
    end
    object lblCodigoTurma: TLabel
      Left = 56
      Top = 151
      Width = 68
      Height = 24
      Caption = 'C'#243'digo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5987163
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDisciplina: TLabel
      Left = 56
      Top = 195
      Width = 92
      Height = 24
      Caption = 'Disciplina:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5987163
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnRemover: TSpeedButton
      AlignWithMargins = True
      Left = 625
      Top = 546
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
    end
    object btnSalvar: TSpeedButton
      AlignWithMargins = True
      Left = 538
      Top = 546
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
    end
    object btnCancelar: TSpeedButton
      AlignWithMargins = True
      Left = 712
      Top = 546
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
    object edtDisciplina: TComboBox
      Left = 157
      Top = 195
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
    object edtCodigo: TEdit
      Left = 157
      Top = 151
      Width = 556
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object GradeTurmas: TStringGrid
      Left = 56
      Top = 253
      Width = 737
      Height = 281
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 2
      ColWidths = (
        64
        356
        309)
    end
  end
end
