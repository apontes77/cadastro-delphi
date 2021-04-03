unit Cadastro.FrameDisciplinas;

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
  Disciplina.Classe,
  Generics.Collections,
  Disciplina.DAO,
  Geral.Conexao;

type
  TFrameDisciplinas = class(TFrameBase)
    lblNome: TLabel;
    edtNome: TEdit;
    GradeDisciplinas: TStringGrid;
    btnSalvar: TSpeedButton;
    btnRemover: TSpeedButton;
    btnCancelar: TSpeedButton;
    lblId: TLabel;
    edtId: TEdit;
    btnLimpar: TSpeedButton;
    procedure GradeDisciplinasDblClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
  private
    FConexao: TConexao;
    FListaDisciplinas: TList<TDisciplina>;
    FDisciplinaDAO: TDisciplinaDAO;
    procedure PopularGrade();
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    procedure SetConexao(AConexao: TConexao);
    property Conexao: TConexao read FConexao write SetConexao;
  end;

var
  FrameDisciplinas: TFrameDisciplinas;

const
  CL_ID = 0;
  CL_NOME = 1;

implementation

{$R *.dfm}

{ TFrameBase1 }

procedure TFrameDisciplinas.btnLimparClick(Sender: TObject);
begin
  inherited;
  edtId.Text := '0';
  edtNome.Text := '';
end;

procedure TFrameDisciplinas.btnRemoverClick(Sender: TObject);
var
  CodDisciplina: Integer;
begin
  inherited;
  CodDisciplina := GradeDisciplinas.Cells[CL_ID, GradeDisciplinas.Row].ToInteger;
  try
    FConexao.FdConnection.StartTransaction;
    FDisciplinaDAO.Delete(CodDisciplina);
    FConexao.FdConnection.Commit;
  finally
    if FConexao.FdConnection.InTransaction then
      FConexao.FdConnection.Rollback;
  end;

  PopularGrade();
end;

procedure TFrameDisciplinas.btnSalvarClick(Sender: TObject);
var
  Disiciplina: TDisciplina;
begin
  inherited;

  Disiciplina := TDisciplina.Create();
  try
    Disiciplina.Id := StrToInt(edtId.Text);
    Disiciplina.Nome := edtNome.Text;
    FConexao.FdConnection.StartTransaction;

    if Disiciplina.Id > 0 then
      FDisciplinaDAO.Update(Disiciplina)
    else
      FDisciplinaDAO.Insert(Disiciplina);

    FConexao.FdConnection.Commit;
  finally
    if FConexao.FdConnection.InTransaction then
      FConexao.FdConnection.Rollback;

    FreeAndNil(Disiciplina);
  end;
  btnLimpar.Click;
  PopularGrade();
end;

constructor TFrameDisciplinas.Create(AOwner: TComponent);
begin
  inherited;
  FDisciplinaDAO := TDisciplinaDAO.Create();
  GradeDisciplinas.Cells[CL_ID, 0] := 'Id. Disciplina';
  GradeDisciplinas.Cells[CL_NOME, 0] := 'Nome';
end;

destructor TFrameDisciplinas.Destroy;
begin
  FreeAndNil(FDisciplinaDAO);
  inherited;
end;

procedure TFrameDisciplinas.GradeDisciplinasDblClick(Sender: TObject);
begin
  inherited;
  edtId.Text := GradeDisciplinas.Cells[CL_ID, GradeDisciplinas.Row];
  edtNome.Text := GradeDisciplinas.Cells[CL_NOME, GradeDisciplinas.Row];
end;

procedure TFrameDisciplinas.PopularGrade;
var
  I: Integer;
begin
  FListaDisciplinas := FDisciplinaDAO.getAll();

  GradeDisciplinas.RowCount := FListaDisciplinas.Count + 1;

  for I := 0 to FListaDisciplinas.Count -1 do
  begin
    GradeDisciplinas.Cells[CL_ID, I +1] := FListaDisciplinas.Items[I].Id.ToString;
    GradeDisciplinas.Cells[CL_NOME, I +1] := FListaDisciplinas.Items[I].Nome;
  end;

end;

procedure TFrameDisciplinas.SetConexao(AConexao: TConexao);
begin
  FConexao := AConexao;
  FDisciplinaDAO.Conexao := FConexao;

  PopularGrade();
end;

end.
