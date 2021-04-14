unit Cadastro.FrameDiscentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Geral.FrameBase,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Discente.Classe,
  Curso.Classe,
  Turma.Classe,
  Generics.Collections,
  Discente.DAO,
  Curso.DAO,
  Turma.DAO,
  Geral.Conexao;

type
  TFrameDiscentes = class(TFrameBase)
    lblNome: TLabel;
    edtNome: TEdit;
    lblSexo: TLabel;
    cbbSexo: TComboBox;
    lblCurso: TLabel;
    cbbCurso: TComboBox;
    lblIdade: TLabel;
    edtIdade: TEdit;
    lblTurma: TLabel;
    cbbTurma: TComboBox;
    GradeDiscentes: TStringGrid;
    btnCancelar: TSpeedButton;
    btnRemover: TSpeedButton;
    btnSalvar: TSpeedButton;
    lblId: TLabel;
    edtId: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure GradeDiscentesDblClick(Sender: TObject);
  private
    FConexao: TConexao;
    FListaDiscentes: TList<TDiscente>;
    FListaCursos: TList<TCurso>;
    FListaTurmas: TList<TTurma>;

    FDiscenteDAO: TDiscenteDAO;
    FCursoDAO: TCursoDAO;
    FTurmaDAO: TTurmaDAO;
    procedure PopularGrade();
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure SetConexao(AConexao: TConexao);
    property Conexao: TConexao read FConexao write SetConexao;
  end;

var
  FrameDiscentes: TFrameDiscentes;

const
  CL_ID = 0;
  CL_NOME = 1;
  CL_CURSO = 2;
  CL_IDADE = 3;
  CL_SEXO = 4;
  CL_TURMA = 5;

implementation

{$R *.dfm}

{ TFrameBase1 }

procedure TFrameDiscentes.btnRemoverClick(Sender: TObject);
var
  CodDiscente: Integer;
begin
  inherited;
  CodDiscente := GradeDiscentes.Cells[CL_ID, GradeDiscentes.Row].ToInteger;

  try
    FConexao.FdConnection.StartTransaction;
    FDiscenteDAO.Delete(CodDiscente);
    FConexao.FdConnection.Commit;
  finally
    if FConexao.FdConnection.InTransaction then
      FConexao.FdConnection.Rollback;
  end;

  PopularGrade();
end;

procedure TFrameDiscentes.btnSalvarClick(Sender: TObject);
var
  Discente: TDiscente;
begin
  inherited;

  Discente := TDiscente.Create();
  try
    Discente.Id := StrToInt(edtId.Text);
    Discente.Nome := edtNome.Text;
    Discente.Idade := StrToInt(edtIdade.Text);

    if cbbSexo.Items[cbbSexo.ItemIndex] = 'Masculino' then
      Discente.Sexo := 'M'
    else if cbbSexo.Items[cbbSexo.ItemIndex] = 'Feminino' then
      Discente.Sexo := 'F';

    Discente.Curso := cbbCurso.ItemIndex+1;
    FConexao.FdConnection.StartTransaction;

    if Discente.Id > 0 then
      FDiscenteDAO.Update(Discente)
    else
      FDiscenteDAO.Insert(Discente);

    FConexao.FdConnection.Commit;
  finally
    if FConexao.FdConnection.InTransaction then
      FConexao.FdConnection.Rollback;

    FreeAndNil(Discente);
  end;

  PopularGrade();
end;

constructor TFrameDiscentes.Create(AOwner: TComponent);
begin
  inherited;
  FDiscenteDAO := TDiscenteDAO.Create();
  FCursoDAO := TCursoDAO.Create();
  FTurmaDAO := TTurmaDAO.Create();

  GradeDiscentes.Cells[CL_ID, 0] := 'Id. Discente';
  GradeDiscentes.Cells[CL_NOME, 0] := 'Nome';
  GradeDiscentes.Cells[CL_CURSO, 0] := 'Curso';
  GradeDiscentes.Cells[CL_IDADE, 0] := 'Idade';
  GradeDiscentes.Cells[CL_SEXO, 0] := 'Sexo';
  GradeDiscentes.Cells[CL_TURMA, 0] := 'Turma';
end;

destructor TFrameDiscentes.Destroy;
begin
  FreeAndNil(FDiscenteDAO);
  FreeAndNil(FCursoDAO);
  FreeAndNil(FTurmaDAO);
  inherited;
end;

procedure TFrameDiscentes.GradeDiscentesDblClick(Sender: TObject);
begin
  inherited;
  edtId.Text := GradeDiscentes.Cells[CL_ID, GradeDiscentes.Row];
  edtNome.Text := GradeDiscentes.Cells[CL_NOME, GradeDiscentes.Row];
  edtIdade.Text := GradeDiscentes.Cells[CL_IDADE, GradeDiscentes.Row];

  cbbCurso.ItemIndex := StrToInt(GradeDiscentes.Cells[CL_CURSO, GradeDiscentes.Row])-1;

  if GradeDiscentes.Cells[CL_SEXO, GradeDiscentes.Row] = 'M' then
    cbbSexo.ItemIndex := 0
  else if GradeDiscentes.Cells[CL_SEXO, GradeDiscentes.Row] = 'F' then
    cbbSexo.ItemIndex := 1;
end;

procedure TFrameDiscentes.PopularGrade;
var
  I: Integer;
  asdf: string;
begin
  FListaDiscentes := FDiscenteDAO.getAll();
  FListaCursos := FCursoDAO.getAll();
  FListaTurmas := FTurmaDAO.getAll();

  GradeDiscentes.RowCount := FListaDiscentes.Count + 1;

  for I := 0 to FListaDiscentes.Count -1 do
  begin
    GradeDiscentes.Cells[CL_ID, I +1] := FListaDiscentes.Items[I].Id.ToString;
    GradeDiscentes.Cells[CL_NOME, I +1] := FListaDiscentes.Items[I].Nome;
    GradeDiscentes.Cells[CL_CURSO, I +1] := FListaDiscentes.Items[I].Curso.ToString;
    GradeDiscentes.Cells[CL_IDADE, I +1] := FListaDiscentes.Items[I].Idade.ToString;
    GradeDiscentes.Cells[CL_SEXO, I +1] := FListaDiscentes.Items[I].Sexo;
  end;

  for I := 0 to FListaCursos.Count -1 do
    cbbCurso.AddItem(FListaCursos[I].Nome, TObject(FListaCursos[I]));

  for I := 0 to FListaTurmas.Count -1 do
    cbbTurma.AddItem(FListaTurmas[I].Codigo, TObject(FListaTurmas[I]));
end;

procedure TFrameDiscentes.SetConexao(AConexao: TConexao);
begin
  FConexao := AConexao;

  FDiscenteDAO.Conexao := FConexao;
  FCursoDAO.Conexao := FConexao;
  FTurmaDAO.Conexao := FConexao;
  PopularGrade();
end;

end.
