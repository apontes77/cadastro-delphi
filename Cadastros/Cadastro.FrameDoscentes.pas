unit Cadastro.FrameDoscentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Geral.FrameBase, Vcl.Buttons, Vcl.Grids, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrameDoscentes = class(TFrameBase)
    lblCodigoTurma: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    Edit1: TEdit;
    lblDisciplina: TLabel;
    edtDisciplina: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    GradeDoscentes: TStringGrid;
    btnSalvar: TSpeedButton;
    btnRemover: TSpeedButton;
    btnCancelar: TSpeedButton;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FrameDoscentes: TFrameDoscentes;

const
  CL_ID = 0;
  CL_NOME = 1;
  CL_IDADE = 3;
  CL_SEXO = 4;
  CL_TURMA = 5;

implementation

{$R *.dfm}

{ TFrameDoscentes }

constructor TFrameDoscentes.Create(AOwner: TComponent);
begin
  inherited;
  GradeDoscentes.Cells[CL_ID, 0] := 'Id. Discente';
  GradeDoscentes.Cells[CL_NOME, 0] := 'Nome';
  GradeDoscentes.Cells[CL_IDADE, 0] := 'Idade';
  GradeDoscentes.Cells[CL_SEXO, 0] := 'Sexo';
  GradeDoscentes.Cells[CL_TURMA, 0] := 'Turma';
end;

end.
