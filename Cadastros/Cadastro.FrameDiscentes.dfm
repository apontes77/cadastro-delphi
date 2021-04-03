inherited FrameDiscentes: TFrameDiscentes
  Width = 845
  Height = 699
  Visible = False
  ExplicitWidth = 845
  ExplicitHeight = 699
  inherited PanelPrincipal: TPanel
    Width = 845
    Height = 699
    ExplicitWidth = 845
    ExplicitHeight = 699
    inherited Titulo: TLabel
      Width = 321
      Caption = 'Cadastro de Discentes'
      ExplicitWidth = 321
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
    object lblSexo: TLabel
      Left = 56
      Top = 280
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
    object lblCurso: TLabel
      Left = 56
      Top = 199
      Width = 57
      Height = 24
      Caption = 'Curso:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5987163
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIdade: TLabel
      Left = 58
      Top = 239
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
    object lblTurma: TLabel
      Left = 58
      Top = 320
      Width = 65
      Height = 24
      Caption = 'Turma:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5987163
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnCancelar: TSpeedButton
      AlignWithMargins = True
      Left = 714
      Top = 655
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
    object btnRemover: TSpeedButton
      AlignWithMargins = True
      Left = 627
      Top = 655
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
    object btnSalvar: TSpeedButton
      AlignWithMargins = True
      Left = 540
      Top = 655
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
    object lblId: TLabel
      Left = 56
      Top = 110
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
    object cbbSexo: TComboBox
      Left = 157
      Top = 280
      Width = 172
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = 'Masculino'
      Items.Strings = (
        'Masculino'
        'Feminino')
    end
    object cbbCurso: TComboBox
      Left = 157
      Top = 199
      Width = 556
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtIdade: TEdit
      Left = 157
      Top = 239
      Width = 172
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cbbTurma: TComboBox
      Left = 157
      Top = 320
      Width = 556
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object GradeDiscentes: TStringGrid
      Left = 58
      Top = 368
      Width = 737
      Height = 281
      ColCount = 6
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 5
      OnDblClick = GradeDiscentesDblClick
      ColWidths = (
        85
        259
        318
        95
        110
        270)
    end
    object edtId: TEdit
      Left = 157
      Top = 110
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
      TabOrder = 6
      Text = '0'
    end
  end
end
