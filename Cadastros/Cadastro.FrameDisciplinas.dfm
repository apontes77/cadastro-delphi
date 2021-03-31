inherited FrameDisciplinas: TFrameDisciplinas
  Width = 834
  Height = 551
  Visible = False
  ExplicitWidth = 834
  ExplicitHeight = 551
  inherited PanelPrincipal: TPanel
    Width = 834
    Height = 551
    inherited Titulo: TLabel
      Width = 335
      Caption = 'Cadastro de Disciplinas'
      ExplicitWidth = 335
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
      ColWidths = (
        88
        636)
    end
  end
end
