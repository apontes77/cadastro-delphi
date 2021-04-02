program ProjetoCadastroDelphi;

uses
  Vcl.Forms,
  un_Principal in 'un_Principal.pas' {frmPrincipal},
  Geral.FrameBase in 'Geral\Geral.FrameBase.pas' {FrameBase: TFrame},
  Cadastro.FrameTurmas in 'Cadastros\Cadastro.FrameTurmas.pas' {FrameTurmas: TFrame},
  Cadastro.FrameDiscentes in 'Cadastros\Cadastro.FrameDiscentes.pas' {FrameDiscentes: TFrame},
  Cadastro.FrameDocentes in 'Cadastros\Cadastro.FrameDocentes.pas' {FrameDocentes: TFrame},
  Cadastro.FrameCursos in 'Cadastros\Cadastro.FrameCursos.pas' {FrameCursos: TFrame},
  Cadastro.FrameDisciplinas in 'Cadastros\Cadastro.FrameDisciplinas.pas' {FrameDisciplinas: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
