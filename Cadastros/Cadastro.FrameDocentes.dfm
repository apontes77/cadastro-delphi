inherited FrameDocentes: TFrameDocentes
  Width = 848
  Height = 799
  Visible = False
  ExplicitWidth = 848
  ExplicitHeight = 799
  inherited PanelPrincipal: TPanel
    Width = 848
    Height = 799
    ExplicitWidth = 848
    ExplicitHeight = 799
    inherited Titulo: TLabel
      Width = 316
      Caption = 'Cadastro de Docentes'
      ExplicitWidth = 316
    end
    object lblNome: TLabel
      Left = 56
      Top = 151
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
    object lblIdade: TLabel
      Left = 56
      Top = 190
      Width = 58
      Height = 24
      Caption = 'Idade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5987163
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSexo: TLabel
      Left = 56
      Top = 227
      Width = 50
      Height = 24
      Caption = 'Sexo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5987163
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTurma: TLabel
      Left = 56
      Top = 271
      Width = 74
      Height = 24
      Caption = 'Turmas:'
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
      Top = 742
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
      Top = 742
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
      Top = 742
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
      Top = 115
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
    object edtNome: TEdit
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
      TabOrder = 0
    end
    object edtIdade: TEdit
      Left = 157
      Top = 190
      Width = 172
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object cbbSexo: TComboBox
      Left = 157
      Top = 231
      Width = 172
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'Masculino'
      Items.Strings = (
        'Masculino'
        'Feminino')
    end
    object GradeDocentes: TStringGrid
      Left = 56
      Top = 448
      Width = 737
      Height = 281
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 3
      OnDblClick = GradeDocentesDblClick
      ColWidths = (
        85
        259
        318
        95
        110)
    end
    object edtId: TEdit
      Left = 157
      Top = 115
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
      TabOrder = 4
      Text = '0'
    end
    object clbTurmas: TCheckListBox
      Left = 157
      Top = 271
      Width = 332
      Height = 162
      ItemHeight = 13
      TabOrder = 5
    end
  end
end
