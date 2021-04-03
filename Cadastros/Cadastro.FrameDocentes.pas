unit Cadastro.FrameDocentes;

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
  Docente.Classe,
  Generics.Collections,
  Docente.DAO,
  Geral.Conexao;

type
  TFrameDocentes = class(TFrameBase)
    lblNome: TLabel;
    edtNome: TEdit;
    lblIdade: TLabel;
    edtIdade: TEdit;
    lblSexo: TLabel;
    cbbSexo: TComboBox;
    lblTurma: TLabel;
    cbbTurma: TComboBox;
    GradeDocentes: TStringGrid;
    btnSalvar: TSpeedButton;
    btnRemover: TSpeedButton;
    btnCancelar: TSpeedButton;
    lblId: TLabel;
    edtId: TEdit;
    procedure GradeDocentesDblClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
  private
    FConexao: TConexao;
    FListaDocentes: TList<TDocente>;
    FDocenteDAO: TDocenteDAO;

    procedure PopularGrade();
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure SetConexao(AConexao: TConexao);
    property Conexao: TConexao read FConexao write SetConexao;
  end;

var
  FrameDocentes: TFrameDocentes;

const
  CL_ID = 0;
  CL_NOME = 1;
  CL_IDADE = 3;
  CL_SEXO = 4;
  CL_TURMA = 5;

implementation

{$R *.dfm}

{ TFrameDoscentes }

procedure TFrameDocentes.btnRemoverClick(Sender: TObject);
var
  CodDocente: Integer;
begin
  inherited;
  CodDocente := GradeDocentes.Cells[CL_ID, GradeDocentes.Row].ToInteger;

  try
    FConexao.FdConnection.StartTransaction;
    FDocenteDAO.Delete(CodDocente);
    FConexao.FdConnection.Commit;
  finally
    if FConexao.FdConnection.InTransaction then
      FConexao.FdConnection.Rollback;
  end;

  PopularGrade();
end;

procedure TFrameDocentes.btnSalvarClick(Sender: TObject);
var
  Docente: TDocente;
begin
  inherited;

  Docente := TDocente.Create();
  try
    Docente.Id := StrToInt(edtId.Text);
    Docente.Nome := edtNome.Text;
    Docente.Idade := StrToInt(edtIdade.Text);

    if cbbSexo.Items[cbbSexo.ItemIndex] = 'Masculino' then
      Docente.Sexo := 'M'
    else if cbbSexo.Items[cbbSexo.ItemIndex] = 'Feminino' then
      Docente.Sexo := 'F';

    FConexao.FdConnection.StartTransaction;

    if Docente.Id > 0 then
      FDocenteDAO.Update(Docente)
    else
      FDocenteDAO.Insert(Docente);

    FConexao.FdConnection.Commit;
  finally
    if FConexao.FdConnection.InTransaction then
      FConexao.FdConnection.Rollback;

    FreeAndNil(Docente);
  end;

  PopularGrade();
end;

constructor TFrameDocentes.Create(AOwner: TComponent);
begin
  inherited;
  FDocenteDAO := TDocenteDAO.Create();

  GradeDocentes.Cells[CL_ID, 0] := 'Id. Discente';
  GradeDocentes.Cells[CL_NOME, 0] := 'Nome';
  GradeDocentes.Cells[CL_IDADE, 0] := 'Idade';
  GradeDocentes.Cells[CL_SEXO, 0] := 'Sexo';
  GradeDocentes.Cells[CL_TURMA, 0] := 'Turma';
end;

destructor TFrameDocentes.Destroy;
begin
  FreeAndNil(FDocenteDAO);
  inherited;
end;

procedure TFrameDocentes.GradeDocentesDblClick(Sender: TObject);
begin
  inherited;
  edtId.Text := GradeDocentes.Cells[CL_ID, GradeDocentes.Row];
  edtNome.Text := GradeDocentes.Cells[CL_NOME, GradeDocentes.Row];
  edtIdade.Text := GradeDocentes.Cells[CL_IDADE, GradeDocentes.Row];

  if GradeDocentes.Cells[CL_SEXO, GradeDocentes.Row] = 'M' then
    cbbSexo.ItemIndex := 0
  else if GradeDocentes.Cells[CL_SEXO, GradeDocentes.Row] = 'F' then
    cbbSexo.ItemIndex := 1;

//  cbbCurso.ite := GradeDiscentes.Cells[CL_SEXO, GradeDiscentes.Row];
//  edtNome.Text := GradeDiscentes.Cells[CL_NOME, GradeCursos.Row];
end;

procedure TFrameDocentes.PopularGrade;
var
  I: Integer;
  asdf: string;
begin
  FListaDocentes := FDocenteDAO.getAll();

  GradeDocentes.RowCount := FListaDocentes.Count + 1;

  for I := 0 to FListaDocentes.Count -1 do
  begin
    GradeDocentes.Cells[CL_ID, I +1] := FListaDocentes.Items[I].Id.ToString;
    GradeDocentes.Cells[CL_NOME, I +1] := FListaDocentes.Items[I].Nome;
    GradeDocentes.Cells[CL_IDADE, I +1] := FListaDocentes.Items[I].Idade.ToString;
    GradeDocentes.Cells[CL_SEXO, I +1] := FListaDocentes.Items[I].Sexo;
  end;
end;

procedure TFrameDocentes.SetConexao(AConexao: TConexao);
begin
  FConexao := AConexao;

  FDocenteDAO.Conexao := FConexao;
  FListaDocentes := FDocenteDAO.getAll();
  PopularGrade();
end;

end.
