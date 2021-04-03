unit Cadastro.FrameCursos;

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
  Curso.Classe,
  Generics.Collections,
  Curso.DAO,
  Geral.Conexao;

type
  TFrameCursos = class(TFrameBase)
    lblCodigoTurma: TLabel;
    edtNome: TEdit;
    GradeCursos: TStringGrid;
    btnSalvar: TSpeedButton;
    btnRemover: TSpeedButton;
    btnCancelar: TSpeedButton;
    lblId: TLabel;
    edtId: TEdit;
    btnLimpar: TSpeedButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure GradeCursosDblClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    FConexao: TConexao;
    FListaCursos: TList<TCurso>;
    FCursoDAO: TCursoDAO;
    procedure PopularGrade();
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    procedure SetConexao(AConexao: TConexao);
    property Conexao: TConexao read FConexao write SetConexao;
  end;

var
  FrameCursos: TFrameCursos;

const
  CL_ID = 0;
  CL_NOME = 1;

implementation

{$R *.dfm}

{ TFrameBase1 }

procedure TFrameCursos.btnLimparClick(Sender: TObject);
begin
  inherited;
  edtId.Text := '0';
  edtNome.Text := '';
end;

procedure TFrameCursos.btnRemoverClick(Sender: TObject);
var
  CodCurso: Integer;
begin
  inherited;
  CodCurso := GradeCursos.Cells[CL_ID, GradeCursos.Row].ToInteger;
  try
    FConexao.FdConnection.StartTransaction;
    FCursoDAO.Delete(CodCurso);
    FConexao.FdConnection.Commit;
  finally
    if FConexao.FdConnection.InTransaction then
      FConexao.FdConnection.Rollback;
  end;

  PopularGrade();
end;

procedure TFrameCursos.btnSalvarClick(Sender: TObject);
var
  Curso: TCurso;
begin
  inherited;

  Curso := TCurso.Create();
  try
    Curso.Id := StrToInt(edtId.Text);
    Curso.Nome := edtNome.Text;
    FConexao.FdConnection.StartTransaction;

    if Curso.Id > 0 then
      FCursoDAO.Update(Curso)
    else
      FCursoDAO.Insert(Curso);

    FConexao.FdConnection.Commit;
  finally
    if FConexao.FdConnection.InTransaction then
      FConexao.FdConnection.Rollback;

    FreeAndNil(Curso);
  end;
  btnLimpar.Click;
  PopularGrade();
end;

constructor TFrameCursos.Create(AOwner: TComponent);
begin
  inherited;
  GradeCursos.Cells[CL_ID, 0] := 'Id. Curso';
  GradeCursos.Cells[CL_NOME, 0] := 'Nome';

  FCursoDAO := TCursoDAO.Create();
end;

destructor TFrameCursos.Destroy;
begin
  FreeAndNil(FCursoDAO);
  inherited;
end;

procedure TFrameCursos.GradeCursosDblClick(Sender: TObject);
begin
  inherited;
  edtId.Text := GradeCursos.Cells[CL_ID, GradeCursos.Row];
  edtNome.Text := GradeCursos.Cells[CL_NOME, GradeCursos.Row];
end;

procedure TFrameCursos.PopularGrade;
var
  I: Integer;
begin
  FListaCursos := FCursoDAO.getAll();

  GradeCursos.RowCount := FListaCursos.Count + 1;

  for I := 0 to FListaCursos.Count -1 do
  begin
    GradeCursos.Cells[CL_ID, I +1] := FListaCursos.Items[I].Id.ToString;
    GradeCursos.Cells[CL_NOME, I +1] := FListaCursos.Items[I].Nome;
  end;
end;

procedure TFrameCursos.SetConexao(AConexao: TConexao);
begin
  FConexao := AConexao;
  FCursoDAO.Conexao := FConexao;

  PopularGrade();
end;

end.
