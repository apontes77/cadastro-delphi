inherited FrameDoscentes: TFrameDoscentes
  Width = 848
  Height = 667
  Visible = False
  ExplicitWidth = 848
  ExplicitHeight = 667
  inherited PanelPrincipal: TPanel
    Width = 848
    Height = 667
    BevelKind = bkTile
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 848
    ExplicitHeight = 667
    inherited Titulo: TLabel
      Width = 331
      Caption = 'Cadastro de Doscentes'
      ExplicitWidth = 331
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
    object Label2: TLabel
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
    object lblDisciplina: TLabel
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
    object Label3: TLabel
      Left = 56
      Top = 271
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
    object btnSalvar: TSpeedButton
      AlignWithMargins = True
      Left = 540
      Top = 614
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
    object btnRemover: TSpeedButton
      AlignWithMargins = True
      Left = 627
      Top = 614
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
    object btnCancelar: TSpeedButton
      AlignWithMargins = True
      Left = 714
      Top = 614
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
    object Edit1: TEdit
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
    object edtDisciplina: TComboBox
      Left = 157
      Top = 231
      Width = 172
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object ComboBox2: TComboBox
      Left = 157
      Top = 271
      Width = 556
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object GradeDoscentes: TStringGrid
      Left = 58
      Top = 320
      Width = 737
      Height = 281
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 4
      ColWidths = (
        85
        259
        318
        95
        110)
    end
  end
end
