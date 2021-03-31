unit Cadastro.FrameTurmas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Geral.FrameBase, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.Buttons;

type
  TFrameTurmas = class(TFrameBase)
    lblCodigoTurma: TLabel;
    lblDisciplina: TLabel;
    edtDisciplina: TComboBox;
    edtCodigo: TEdit;
    GradeTurmas: TStringGrid;
    btnRemover: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
  private
    procedure ConfigurarGrade();
  public
    constructor Create(AOwner: TComponent); override;
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

procedure TFrameTurmas.ConfigurarGrade;
begin
  GradeTurmas.Cells[CL_ID, 0] := 'Id. Turma';
  GradeTurmas.Cells[CL_Codigo, 0] := 'Código';
  GradeTurmas.Cells[CL_DISCIPLINA, 0] := 'Disciplina';
end;

constructor TFrameTurmas.Create(AOwner: TComponent);
begin
  inherited;
  ConfigurarGrade();
end;

end.
