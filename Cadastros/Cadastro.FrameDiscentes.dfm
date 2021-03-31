inherited FrameDiscentes: TFrameDiscentes
  Width = 845
  Height = 699
  Visible = False
  ExplicitWidth = 845
  ExplicitHeight = 699
  inherited PanelPrincipal: TPanel
    Width = 845
    Height = 699
    BevelKind = bkTile
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 845
    ExplicitHeight = 699
    inherited Titulo: TLabel
      Width = 321
      Caption = 'Cadastro de Discentes'
      ExplicitWidth = 321
    end
    object lblCodigoTurma: TLabel
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
    object lblDisciplina: TLabel
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
    object Label1: TLabel
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
    object Label2: TLabel
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
    object Label3: TLabel
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
      TabOrder = 0
    end
    object edtDisciplina: TComboBox
      Left = 157
      Top = 280
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
    object ComboBox1: TComboBox
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
    object Edit1: TEdit
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
    object ComboBox2: TComboBox
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
      ColWidths = (
        85
        259
        318
        95
        110
        270)
    end
  end
end
