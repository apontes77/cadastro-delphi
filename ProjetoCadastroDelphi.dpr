program ProjetoCadastroDelphi;

uses
  Vcl.Forms,
  un_Principal in 'un_Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
