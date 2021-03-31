unit Cadastro.FrameDiscentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Geral.FrameBase, Vcl.Buttons, Vcl.Grids, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrameDiscentes = class(TFrameBase)
    lblCodigoTurma: TLabel;
    edtCodigo: TEdit;
    lblDisciplina: TLabel;
    edtDisciplina: TComboBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    ComboBox2: TComboBox;
    GradeDiscentes: TStringGrid;
    btnCancelar: TSpeedButton;
    btnRemover: TSpeedButton;
    btnSalvar: TSpeedButton;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
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

constructor TFrameDiscentes.Create(AOwner: TComponent);
begin
  inherited;
  GradeDiscentes.Cells[CL_ID, 0] := 'Id. Discente';
  GradeDiscentes.Cells[CL_NOME, 0] := 'Nome';
  GradeDiscentes.Cells[CL_CURSO, 0] := 'Curso';
  GradeDiscentes.Cells[CL_IDADE, 0] := 'Idade';
  GradeDiscentes.Cells[CL_SEXO, 0] := 'Sexo';
  GradeDiscentes.Cells[CL_TURMA, 0] := 'Turma';
end;

end.
