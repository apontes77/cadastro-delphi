unit Cadastro.FrameCursos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Geral.FrameBase, Vcl.Buttons, Vcl.Grids, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrameCursos = class(TFrameBase)
    lblCodigoTurma: TLabel;
    edtCodigo: TEdit;
    GradeCursos: TStringGrid;
    btnSalvar: TSpeedButton;
    btnRemover: TSpeedButton;
    btnCancelar: TSpeedButton;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FrameCursos: TFrameCursos;

const
  CL_ID = 0;
  CL_NOME = 1;

implementation

{$R *.dfm}

{ TFrameBase1 }

constructor TFrameCursos.Create(AOwner: TComponent);
begin
  inherited;
  GradeCursos.Cells[CL_ID, 0] := 'Id. Curso';
  GradeCursos.Cells[CL_NOME, 0] := 'Nome';
end;

end.
