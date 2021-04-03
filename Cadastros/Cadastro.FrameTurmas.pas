unit Cadastro.FrameTurmas;

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
  Vcl.Grids,
  Vcl.Buttons,
  Turma.Classe,
  Generics.Collections,
  Turma.DAO,
  Geral.Conexao;

type
  TFrameTurmas = class(TFrameBase)
    lblCodigoTurma: TLabel;
    lblDisciplina: TLabel;
    cbbDisciplina: TComboBox;
    edtCodigo: TEdit;
    GradeTurmas: TStringGrid;
    btnRemover: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnLimpar: TSpeedButton;
    edtId: TEdit;
    lblId: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure GradeTurmasDblClick(Sender: TObject);
  private
    FConexao: TConexao;
    FListaTurmas: TList<TTurma>;
    FTurmaDAO: TTurmaDAO;

    procedure PopularGrade();
    procedure ConfigurarGrade();
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    procedure SetConexao(AConexao: TConexao);
    property Conexao: TConexao read FConexao write SetConexao;
  end;

var
  FrameTurmas: TFrameTurmas;

const
  CL_ID = 0;
  CL_CODIGO = 1;
  CL_DISCIPLINA = 2;

implementation

{$R *.dfm}

{ TFrameTurmas }

procedure TFrameTurmas.btnLimparClick(Sender: TObject);
begin
  inherited;
  edtId.Text := '0';
  edtCodigo.Text := '';
end;

procedure TFrameTurmas.btnRemoverClick(Sender: TObject);
var
  CodTurma: Integer;
begin
  inherited;
  CodTurma := GradeTurmas.Cells[CL_ID, GradeTurmas.Row].ToInteger;
  try
    FConexao.FdConnection.StartTransaction;
    FTurmaDAO.Delete(CodTurma);
    FConexao.FdConnection.Commit;
  finally
    if FConexao.FdConnection.InTransaction then
      FConexao.FdConnection.Rollback;
  end;

  PopularGrade();
end;

procedure TFrameTurmas.btnSalvarClick(Sender: TObject);
var
  Turma: TTurma;
begin
  inherited;

  Turma := TTurma.Create();
  try
    Turma.Id := StrToInt(edtId.Text);
    Turma.Codigo := edtCodigo.Text;
    FConexao.FdConnection.StartTransaction;

    if Turma.Id > 0 then
      FTurmaDAO.Update(Turma)
    else
      FTurmaDAO.Insert(Turma);

    FConexao.FdConnection.Commit;
  finally
    if FConexao.FdConnection.InTransaction then
      FConexao.FdConnection.Rollback;

    FreeAndNil(Turma);
  end;
  btnLimpar.Click;
  PopularGrade();
end;

procedure TFrameTurmas.ConfigurarGrade;
begin
  FTurmaDAO := TTurmaDAO.Create();
  GradeTurmas.Cells[CL_ID, 0] := 'Id. Turma';
  GradeTurmas.Cells[CL_Codigo, 0] := 'Código';
  GradeTurmas.Cells[CL_DISCIPLINA, 0] := 'Disciplina';
end;

constructor TFrameTurmas.Create(AOwner: TComponent);
begin
  inherited;
  ConfigurarGrade();
end;

destructor TFrameTurmas.Destroy;
begin
  FreeAndNil(FTurmaDAO);
  inherited;
end;

procedure TFrameTurmas.GradeTurmasDblClick(Sender: TObject);
begin
  inherited;
  edtId.Text := GradeTurmas.Cells[CL_ID, GradeTurmas.Row];
  edtCodigo.Text := GradeTurmas.Cells[CL_CODIGO, GradeTurmas.Row];
end;

procedure TFrameTurmas.PopularGrade;
var
  I: Integer;
begin
  FListaTurmas := FTurmaDAO.getAll();

  GradeTurmas.RowCount := FListaTurmas.Count + 1;

  for I := 0 to FListaTurmas.Count -1 do
  begin
    GradeTurmas.Cells[CL_ID, I +1] := FListaTurmas.Items[I].Id.ToString;
    GradeTurmas.Cells[CL_CODIGO, I +1] := FListaTurmas.Items[I].Codigo;
    GradeTurmas.Cells[CL_DISCIPLINA, I +1] := FListaTurmas.Items[I].Disciplina.ToString;
  end;

end;

procedure TFrameTurmas.SetConexao(AConexao: TConexao);
begin
  FConexao := AConexao;
  FTurmaDAO.Conexao := FConexao;

  PopularGrade();
end;

end.
