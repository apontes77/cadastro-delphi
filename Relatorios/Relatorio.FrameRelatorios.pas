unit Relatorio.FrameRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Geral.FrameBase,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Discente.DAO,
  Discente.Classe,
  Geral.Conexao,
  Generics.Collections, Vcl.Buttons, Vcl.Grids;

type
  TFrameRelatorios = class(TFrameBase)
    btnCancelar: TSpeedButton;
    GradeRelatorio: TStringGrid;
  private
    FConexao: TConexao;
    FListaDiscente: TList<TDiscente>;

    FDiscenteDAO: TDiscenteDAO;

    procedure PopularGrade();
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    procedure SetConexao(AConexao: TConexao);
    property Conexao: TConexao read FConexao write SetConexao;
  end;

const
  CL_DISCENTE = 0;
  CL_N1 = 1;
  CL_N2 = 2;
  CL_TURMA = 3;

implementation

{$R *.dfm}

{ TFrameRelatorios }

constructor TFrameRelatorios.Create(AOwner: TComponent);
begin
  inherited;
  FDiscenteDAO := TDiscenteDAO.Create();

  GradeRelatorio.Cells[CL_DISCENTE, 0] := 'Discente';
  GradeRelatorio.Cells[CL_N1, 0] := 'N1';
  GradeRelatorio.Cells[CL_N2, 0] := 'N2';
  GradeRelatorio.Cells[CL_TURMA, 0] := 'Turma';
end;

destructor TFrameRelatorios.Destroy;
begin
  FreeAndNil(FDiscenteDAO);
  inherited;
end;

procedure TFrameRelatorios.PopularGrade;
var
  I: Integer;
  Discentes: TDiscente;

begin
  FListaDiscente := FDiscenteDAO.getReleases();

  GradeRelatorio.RowCount := FListaDiscente.Count;
  for I := 0 to FListaDiscente.Count -1 do
  begin
    Discentes := FListaDiscente[I];

    GradeRelatorio.Cells[CL_DISCENTE, I+1] := Discentes.Nome;
    GradeRelatorio.Cells[CL_N1, I+1] := FloatToStr(Discentes.N1);
    GradeRelatorio.Cells[CL_N2, I+1] := FloatToStr(Discentes.N2);
    GradeRelatorio.Cells[CL_TURMA, I+1] := Discentes.Turma;
  end;

end;

procedure TFrameRelatorios.SetConexao(AConexao: TConexao);
begin
  FConexao := AConexao;

  FDiscenteDAO.Conexao := FConexao;
  PopularGrade();
end;

end.
