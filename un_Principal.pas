unit un_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Cadastro.FrameTurmas,
  Cadastro.FrameDiscentes,
  Cadastro.FrameDocentes,
  Cadastro.FrameCursos,
  Cadastro.FrameDisciplinas,
  Geral.Conexao;

type
  TfrmPrincipal = class(TForm)
    PanelBotoes: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    PanelPrincipal: TPanel;
    Image1: TImage;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FFrameTurmas: TFrameTurmas;
    FFrameDiscentes: TFrameDiscentes;
    FFrameDocentes: TFrameDocentes;
    FFrameCursos: TFrameCursos;
    FFrameDisciplinas: TFrameDisciplinas;
    FConexao: TConexao;
    procedure FrameTurmasCancelarClick(Sender: TObject);
    procedure FrameDiscentesCancelarClick(Sender: TObject);
    procedure FrameDoscentesCancelarClick(Sender: TObject);
    procedure FrameCursosCancelarClick(Sender: TObject);
    procedure FrameDisciplinasCancelarClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

constructor TfrmPrincipal.Create(AOwner: TComponent);
begin
  inherited;

  FConexao := TConexao.Create();

  FConexao.Database := 'Cadastro-Delphi';
  FConexao.User := 'postgres';
  FConexao.Password := 'postgres';
  FConexao.Server := 'localhost';
  FConexao.Port := '5432';

  FConexao.CreateConnection();

  FFrameTurmas := TFrameTurmas.Create(Self);
  FFrameTurmas.Parent := PanelPrincipal;
  FFrameTurmas.Left := Round(PanelPrincipal.Width / 2);
  FFrameTurmas.Top := Round(PanelPrincipal.Height / 2);
  FFrameTurmas.btnCancelar.OnClick := FrameTurmasCancelarClick;
  FFrameTurmas.SetConexao(FConexao);

  FFrameDiscentes := TFrameDiscentes.Create(Self);
  FFrameDiscentes.Parent := PanelPrincipal;
  FFrameDiscentes.Left := Round(PanelPrincipal.Width / 2);
  FFrameDiscentes.Top := Round(PanelPrincipal.Height / 2);
  FFrameDiscentes.btnCancelar.OnClick := FrameDiscentesCancelarClick;
  FFrameDiscentes.SetConexao(FConexao);

  FFrameDocentes := TFrameDocentes.Create(Self);
  FFrameDocentes.Parent := PanelPrincipal;
  FFrameDocentes.Left := Round(PanelPrincipal.Width / 2);
  FFrameDocentes.Top := Round(PanelPrincipal.Height / 2);
  FFrameDocentes.btnCancelar.OnClick := FrameDoscentesCancelarClick;
  FFrameDocentes.SetConexao(FConexao);

  FFrameCursos := TFrameCursos.Create(Self);
  FFrameCursos.Parent := PanelPrincipal;
  FFrameCursos.Left := Round(PanelPrincipal.Width / 2);
  FFrameCursos.Top := Round(PanelPrincipal.Height / 2);
  FFrameCursos.btnCancelar.OnClick := FrameCursosCancelarClick;
  FFrameCursos.SetConexao(FConexao);

  FFrameDisciplinas := TFrameDisciplinas.Create(Self);
  FFrameDisciplinas.Parent := PanelPrincipal;
  FFrameDisciplinas.Left := Round(PanelPrincipal.Width / 2);
  FFrameDisciplinas.Top := Round(PanelPrincipal.Height / 2);
  FFrameDisciplinas.btnCancelar.OnClick := FrameDisciplinasCancelarClick;
  FFrameDisciplinas.SetConexao(FConexao);
end;

destructor TfrmPrincipal.Destroy;
begin
  FreeAndNil(FFrameTurmas);
  FreeAndNil(FrameDiscentes);
  FreeAndNil(FFrameDocentes);
  FreeAndNil(FFrameCursos);
  FreeAndNil(FFrameDisciplinas);

  FConexao.CloseConnection();
  FreeAndNil(FConexao);
  inherited;
end;

procedure TfrmPrincipal.FrameCursosCancelarClick(Sender: TObject);
begin
  FFrameCursos.Hide;
end;

procedure TfrmPrincipal.FrameDiscentesCancelarClick(Sender: TObject);
begin
  FFrameDiscentes.Hide;
end;

procedure TfrmPrincipal.FrameDisciplinasCancelarClick(Sender: TObject);
begin
  FFrameDisciplinas.Hide;
end;

procedure TfrmPrincipal.FrameDoscentesCancelarClick(Sender: TObject);
begin
  FFrameDocentes.Hide;
end;

procedure TfrmPrincipal.FrameTurmasCancelarClick(Sender: TObject);
begin
  FFrameTurmas.Hide;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  FFrameDisciplinas.Show;
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  FFrameTurmas.Show;
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  FFrameCursos.Show;
end;

procedure TfrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  FFrameDiscentes.Show;
end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
  FFrameDocentes.Show;
end;

end.
