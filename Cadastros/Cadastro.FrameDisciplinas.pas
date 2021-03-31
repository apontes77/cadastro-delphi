unit Cadastro.FrameDisciplinas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Geral.FrameBase, Vcl.Buttons, Vcl.Grids, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrameDisciplinas = class(TFrameBase)
    lblCodigoTurma: TLabel;
    edtCodigo: TEdit;
    GradeDisciplinas: TStringGrid;
    btnSalvar: TSpeedButton;
    btnRemover: TSpeedButton;
    btnCancelar: TSpeedButton;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FrameDisciplinas: TFrameDisciplinas;

const
  CL_ID = 0;
  CL_NOME = 1;

implementation

{$R *.dfm}

{ TFrameBase1 }

constructor TFrameDisciplinas.Create(AOwner: TComponent);
begin
  inherited;
  GradeDisciplinas.Cells[CL_ID, 0] := 'Id. Disciplina';
  GradeDisciplinas.Cells[CL_NOME, 0] := 'Nome';
end;

end.
