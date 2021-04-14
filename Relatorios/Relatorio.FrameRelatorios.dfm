inherited FrameRelatorios: TFrameRelatorios
  Width = 917
  Height = 572
  Visible = False
  ExplicitWidth = 917
  ExplicitHeight = 572
  inherited PanelPrincipal: TPanel
    Width = 917
    Height = 572
    ExplicitTop = 3
    ExplicitWidth = 917
    ExplicitHeight = 572
    inherited Titulo: TLabel
      Width = 144
      Caption = 'Relat'#243'rios'
      ExplicitWidth = 144
    end
    object btnCancelar: TSpeedButton
      AlignWithMargins = True
      Left = 800
      Top = 519
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
    object GradeRelatorio: TStringGrid
      Left = 40
      Top = 159
      Width = 825
      Height = 354
      ColCount = 4
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      ColWidths = (
        281
        137
        107
        287)
    end
  end
end
