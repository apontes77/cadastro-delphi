unit Docente.Classe;

interface

uses
  Turma.Classe,
  Generics.Collections;

type
  TDocente = class
  private
    FId: Integer;
    FNome: string;
    FIdade: Integer;
    FSexo: string;
    FListaTurma: TList<TTurma>;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Idade: Integer read FIdade write FIdade;
    property Sexo: string read FSexo write FSexo;
    property ListaTurma: TList<TTurma> read FListaTurma write FListaTurma;
  end;

implementation

end.
